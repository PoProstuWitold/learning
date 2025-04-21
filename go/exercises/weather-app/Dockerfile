# Etap budowania aplikacji – Go w wersji Alpine, bo jest lekki i szybki
FROM golang:1.24-alpine AS builder

# Zgodnie z OCI (Open Container Initiative) – dane autora
LABEL org.opencontainers.image.authors="Witold Zawada"

# Katalog roboczy
WORKDIR /app

# Kopiowanie plików osobno, żeby cache lepiej działał
COPY go.mod ./
COPY . .

# Budowanie statyczne + usuwanie symboli debugowych dla mniejszego rozmiaru
RUN go build -ldflags="-s -w" -o server main.go

# Finalny obraz – Alpine z certyfikatami i użytkownikiem nie-root
FROM alpine:3.21

# Katalog roboczy
WORKDIR /app

# Instalacja tylko potrzebnych rzeczy i dodanie użytkownika nie-root
RUN apk add --no-cache ca-certificates && \
    adduser -D -u 10001 witold

# Ustawienie użytkownika nie-root
USER witold

# Kopiowanie binarki i plików statycznych.
# Znowu osobno, żeby cache lepiej działał
COPY --from=builder /app/server /server
COPY public/ ./public/

# Wystawienie portu, na którym nasłuchuje serwer HTTP napisany w Go
EXPOSE 8080

# Minimalny healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD wget --spider http://localhost:8080 || exit 1

# Start aplikacji – uruchomienie binarki
ENTRYPOINT ["/server"]
