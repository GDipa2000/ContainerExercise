# Parte 1: Scegli l'immagine di base
FROM gcc:latest

# Parte 2: Installa cmake
RUN apt-get update && apt-get install -y cmake

# Parte 3: Imposta la directory di lavoro all'interno del container
WORKDIR /app

# Parte 4: Copia i file dal contesto di build (la tua directory locale) al container
COPY . /app

# Parte 5: Crea una cartella per i file compilati
RUN mkdir build

# Parte 6: Cambia la directory di lavoro nella cartella di build
WORKDIR /app/build

# Parte 7: Configura il progetto CMake
RUN cmake ..

# Parte 8: Compila il progetto usando CMake
RUN cmake --build .

# Parte 9: Imposta il comando da eseguire quando il container viene avviato
CMD ["./CMakeHelloWorld"]