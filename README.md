# DockerZ2

# inicjalizacja repozytorium:
W bash:
git init
git remote add origin https://github.com/holek363/DockerZ2.git
W GitHub:
Utworzenie nowego repozytorium

# Dodanie plików
git add .
git commit -m "FirstCommit"

# Przesłanie plików
git branch -M main
git push -u origin main

# Poprawki pojedyńczych plików:
git add .github/workflows/docker-build.yml
git commit -m "Poprawka"
git push
