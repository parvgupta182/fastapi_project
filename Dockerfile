# 1. Python ka lightweight version use karein
FROM python:3.10-slim

# 2. Working directory set karein
WORKDIR /app

# 3. Dependencies copy karein aur install karein
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Poora code copy karein
COPY . .

# 5. Port expose karein
EXPOSE 8000

# 6. FastAPI ko run karein
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
