# Weather App
Prosta aplikacja napisana w **[Go](https://go.dev/)** z użyciem **[OpenWeatherMap](https://openweathermap.org)**.

## Obraz Dockera

Repozytorium DockerHub:  
**[hub.docker.com/r/poprostuwitold/weather-app](https://hub.docker.com/r/poprostuwitold/weather-app)**

Repozytorium GitHub (z kodem źródłowym i Dockerfile):  
**[github.com//PoProstuWitold/learning/tree/main/go/exercises/weather-app](https://github.com/PoProstuWitold/learning/tree/main/go/exercises/weather-app)**

---

## Autor

**Witold Zawada**  
**Politechnika Lubelska**  
**Data realizacji:** 2025

---

## Opis projektu

Aplikacja webowa napisana w języku Go, umożliwiająca pobieranie aktualnych danych pogodowych z API OpenWeatherMap.  
Działa jako kontener Dockera, loguje dane startowe i udostępnia prosty interfejs webowy do interakcji.

---

## Funkcjonalności

- Logi startowe (data, autor, port)
- Wybór kraju z listy (kod [ISO 3166-1 alfa-2](https://pl.wikipedia.org/wiki/ISO_3166-1_alfa-2) + pełna nazwa)
- Wpisywanie miasta ręcznie
- Wyświetlanie: lokalizacji, temperatury, opisu pogody, wiatru, wilgotności, ciśnienia itd.
- Responsywny frontend HTML + JS (bez frameworków i bibliotek)
- API `/api/weather` zrealizowane jako proxy do OpenWeatherMap
- Minimalne style CSS

---

## Docker

Aplikacja została opakowana w kontener Dockera z wykorzystaniem **wieloetapowego builda**.

### Dockerfile – cechy:
- builder: `golang:1.24-alpine`
- finalny obraz: `alpine:3.21`
- `HEALTHCHECK` dla monitorowania kontenera
- `LABEL` zgodny ze specyfikacją [OCI](https://en.wikipedia.org/wiki/Open_Container_Initiative)
- uruchamianie kontenera jako nie-root (użytkownik o nazwie ``witold``)

---

## Część obowiązkowa

### a. Budowanie obrazu:
```bash
docker build -t weather-app .
```

### b. Uruchomienie kontenera:
```bash
docker run -p 8080:8080 --name weather weather-app
```

lub z flagą ``-d`` do uruchomienia w tle:

```bash
docker run -d -p 8080:8080 --name weather weather-app
```

### c. Sprawdzenie logów:
```bash
docker logs weather
```

Przykładowe logi:
```bash
2025/04/21 17:07:58 Start date: 2025-04-21T17:07:58Z
2025/04/21 17:07:58 Author: Witold Zawada
2025/04/21 17:07:58 Listening on port: 8080
```

### d. Sprawdzanie liczby warstw i rozmiaru:
```bash
docker image inspect weather-app --format='Warstwy: {{len .RootFS.Layers}}, Rozmiar: {{.Size}}'
```

Przykładowy wynik polecenia:
```
Warstwy: 5, Rozmiar: 14646875
```

Rozmiar obrazu wynosi około ``14.6 MB``.

---

## Część dodatkowa/nieobowiązkowa

### Podstawowe wymagania i wariant drugi (max. +50%)
Sprawdzanie podatności na zagrożenia oraz realizacja wymagań wariantu drugiego.

### Wymagania
- Zgodność z OCI
- Obsługa platform: `linux/amd64` i `linux/arm64`
- Budowanie z użyciem buildera `docker-container`
- Wykorzystanie cache (eksporter registry, backend inline)

---

## Buildx – konfiguracja

Tworzenie i aktywowanie buildera:
```bash
docker buildx create --name multiarch-builder --use
```

---

## Budowanie i publikacja obrazu z cache i multiarch
```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --push \
  --tag poprostuwitold/weather-app:cached \
  --cache-from=type=registry,ref=poprostuwitold/weather-app:cache \
  --cache-to=type=registry,ref=poprostuwitold/weather-app:cache,mode=max \
  .
```

---

## Sprawdzenie platform w manifeście
```bash
docker buildx imagetools inspect poprostuwitold/weather-app:cached
```

Output tego polecenia jest bardzo obszerny, ale zawiera informacje o obu platformach
```bash
Manifests: 
  Name:        docker.io/poprostuwitold/weather-app:cached@sha256:bd536a81f0bf695507c94bdca7afd97411cf57a968e916f3f6fae33918bb5f4c
  MediaType:   application/vnd.oci.image.manifest.v1+json
  Platform:    linux/amd64
               
  Name:        docker.io/poprostuwitold/weather-app:cached@sha256:7bd56bf669636f50fc3bfc98ea2bd5c32bf2b3fba7f0111d48377e401c354fb0
  MediaType:   application/vnd.oci.image.manifest.v1+json
  Platform:    linux/arm64
```

---

## Cache – potwierdzenie działania
Pierwsze budowanie: wolniejsze.

Drugie budowanie: błyskawiczne (cache hit).

---

## Docker Scout – analiza podatności
```bash
docker scout quickview poprostuwitold/weather-app:cached
```

Wynik:
```bash
    ✓ Pulled
    ✓ Image stored for indexing
    ✓ Indexed 21 packages
    ✓ Provenance obtained from attestation

    i Base image was auto-detected. To get more accurate results, build images with max-mode provenance attestations.
      Review docs.docker.com ↗ for more information.

  Target     │  poprostuwitold/weather-app:cached  │    0C     0H     0M     0L   
    digest   │  bd536a81f0bf                       │                              
  Base image │  alpine:3                           │    0C     0H     0M     0L  
```
Obraz nie zawiera żadnych podatności. A przynajmniej żadne nie zostały wykryte :)

---

## Podsumowanie
Aplikacja została zbudowana jako multiarch z użyciem cache inline + exporter registry.
Została również przeskanowana i nie zawiera krytycznych luk bezpieczeństwa.

Odpalić lokalnie można:
```bash
docker run -d -p 8080:8080 --name weather poprostuwitold/weather-app:cached
```
