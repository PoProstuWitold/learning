package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"time"
)

const port = "8080"

var locations = map[string]string{
	"PL": "Poland",
	"DE": "Germany",
	"FR": "France",
	"ES": "Spain",
	"IT": "Italy",
	"US": "United States",
	"GB": "United Kingdom",
	"UA": "Ukraine",
}

func homeHandler(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "public/index.html")
}

func locationsHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(locations)
}

func weatherHandler(w http.ResponseWriter, r *http.Request) {
	country := r.URL.Query().Get("country")
	city := r.URL.Query().Get("city")

	const apiKey = "3f01378c6785ec6bcbf7bb69bf95293a"

	res, err := http.Get(fmt.Sprintf(
		"https://api.openweathermap.org/data/2.5/weather?q=%s,%s&units=metric&appid=%s",
		city, country, apiKey,
	))
	if err != nil {
		http.Error(w, `{"error":"request failed"}`, http.StatusInternalServerError)
		return
	}
	defer res.Body.Close()

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(res.StatusCode) // <- zachowujemy np. 404

	// przekazujemy response tak jak jest
	_, _ = io.Copy(w, res.Body)
}

func main() {
	log.Printf("Start date: %s", time.Now().Format(time.RFC3339))
	log.Printf("Author: Witold Zawada")
	log.Printf("Listening on port: %s", port)

	http.HandleFunc("/", homeHandler)
	http.HandleFunc("/api/locations", locationsHandler)
	http.HandleFunc("/api/weather", weatherHandler)

	fs := http.FileServer(http.Dir("public"))
	http.Handle("/public/", http.StripPrefix("/public/", fs))

	if err := http.ListenAndServe(":"+port, nil); err != nil {
		log.Fatal(err)
	}
}
