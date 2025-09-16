FROM python:3.10

WORKDIR /app

COPY requirements.txt .
RUN pip install  -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]














FROM python:3.10

WORKDIR /app

RUN apt-get update && apt-get install -y
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
