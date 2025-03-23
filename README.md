# 🚀 FastAPI with Docker and GitHub Actions

This project demonstrates **Continuous Delivery** using **FastAPI**, **Docker**, and **GitHub Actions**.

---

## 📌 1. Install and Run Locally

### ✅ 1.1 Install Dependencies
Make sure you have **Python** and **pip** installed. Then, run:
```sh
pip install -r requirements.txt
```

### ✅ 1.2 Run FastAPI Server
Run the server locally using:
```sh
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```
Now, open **[http://127.0.0.1:8000](http://127.0.0.1:8000)** in your browser.

---

## 📦 2. Build and Run Docker Image

### ✅ 2.1 Build Docker Image
```sh
docker build -t parvgupta123/fastapi-app:latest .
```

### ✅ 2.2 Run Docker Container
```sh
docker run -p 8000:8000 parvgupta123/fastapi-app:latest
```
Now, open **[http://localhost:8000](http://localhost:8000)**.

---

## ⚙️ 3. GitHub Actions Workflow Explanation

### ✅ 3.1 What Happens in GitHub Actions?
1. **Triggers on push:** When you push code to GitHub, the workflow runs automatically.
2. **Builds Docker Image:** GitHub Actions builds the Docker image.
3. **Pushes to Docker Hub:** The image is uploaded to your Docker Hub repository.

### ✅ 3.2 Workflow File (`.github/workflows/DockerBuild.yml`)
```yaml
name: Docker Image Build and Push

on: push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Log in to Docker Hub
        run: echo "${{ secrets.DOCKERTOKEN }}" | docker login -u "parvgupta123" --password-stdin

      - name: Build and Push Docker Image
        run: |
          docker build -t parvgupta123/fastapi-app:latest .
          docker push parvgupta123/fastapi-app:latest
```

---

## 🔑 4. Setting Up Docker Token and Secrets

### ✅ 4.1 Generate a Docker Hub Token
1. Go to **[Docker Hub](https://hub.docker.com/)**.
2. Click **Account Settings → Security → Access Tokens**.
3. Click **Generate Token** and copy it.

### ✅ 4.2 Add Token as GitHub Secret
1. Go to your **GitHub Repository → Settings → Secrets → Actions**.
2. Click **New Repository Secret**.
3. Set **Name** as `DOCKERTOKEN`.
4. Paste the copied token as the **Value** and click **Save**.

---

## 📤 5. Docker Hub Image URL
Your Docker image is available at:
**[https://hub.docker.com/r/parvgupta123/fastapi-app](https://hub.docker.com/r/parvgupta123/fastapi-app)**

---

🎉 **You're now set up for Continuous Delivery with FastAPI, Docker, and GitHub Actions!** 🚀

