FROM node:22-alpine AS deps
LABEL org.opencontainers.image.authors="Jakub Holka"
WORKDIR /app
# Kopiujemy tylko pliki zależności
COPY ./P1/package*.json ./
# Instalujemy zależności
RUN npm install --production
FROM node:22-alpine
LABEL org.opencontainers.image.authors="Jakub Holka"
WORKDIR /app
# Kopiujemy zbudowane zależności
COPY --from=deps /app/node_modules ./node_modules
# Kopiujemy pozostałe pliki aplikacji
COPY ./P1 .
# Zmienna środowiskowa
ENV PORT=3000
# Ustawienie domyślnego polecenia uruchamiającego aplikację
CMD ["node", "server.js"]
# Deklarujemy port, na którym nasłuchuje aplikacja
EXPOSE 3000
# HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:3000 || exit 1
