# Helm-FlaskApp

This project demonstrates deploying a Python REST API using Flask, containerizing it with Docker, pushing the image to Docker Hub, and managing deployment with Helm on Kubernetes.

## Steps

1. **Create Python REST App**  
   Build a simple REST API using Flask.

   **Commands:**
   ```sh
   python -m venv venv
   venv\Scripts\activate         # On Windows
   pip install -r requirements.txt
   python flask-rest-svc/main.py
   ```

   **Verify:**  
   Open your browser or use curl:
   ```sh
   curl http://localhost:9001/hello
   ```
   You should see:
   ```json
   {"message": "Service is up and running!"}
   ```

2. **Dockerize the Application**  
   Write a Dockerfile to containerize the Flask app.

   **Commands:**
   ```sh
   docker build -t flask-rest-svc .
   docker run -p 9001:9001 flask-rest-svc
   ```

   
   **Verify:**  
   Open your browser or use curl:
   ```sh
   curl http://localhost:9001/hello
   ```
   You should see:
   ```json
   {"message": "Service is up and running!"}
   ```


3. **Push to Docker Hub**  
   Tag and push the Docker image to your Docker Hub repository.

4. **Create Helm Chart**  
   Scaffold a Helm chart to manage Kubernetes deployment.

5. **Install and Verify**  
   Use Helm to install the app on Kubernetes and verify the deployment.

## Prerequisites

- Python 3.x
- Docker
- Docker Hub account
- Helm
- Kubernetes cluster (local or cloud)

## Usage

Follow the steps in this README to build, containerize, and deploy your Flask app using