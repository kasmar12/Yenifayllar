FROM python:3.11-slim

# İş qovluğu
WORKDIR /app

# Asılılıqlar
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kodlar
COPY . .

# Botu işə sal
CMD ["python", "main.py"]
