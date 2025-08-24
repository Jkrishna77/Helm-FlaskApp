FROM python:3.8-slim

WORKDIR /app
COPY flask-rest-svc/ /app
RUN pip install --no-cache-dir -r /app/requirements.txt

EXPOSE 9001
CMD ["python3", "main.py"]
