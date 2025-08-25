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

   **Commands:**
   ```sh
   docker login
   docker tag flask-rest-svc <your-dockerhub-username>/flask-rest-svc:latest
   docker push <your-dockerhub-username>/flask-rest-svc:latest
   ```

   **To pull and run the image on any machine:**
   ```sh
   docker pull <your-dockerhub-username>/flask-rest-svc:latest
   docker run -p 9001:9001 <your-dockerhub-username>/flask-rest-svc:latest
   ```

4. **Create Helm Chart**  
   Scaffold a Helm chart to manage Kubernetes deployment.

   **Commands:**
   ```sh
   helm create helm-flask-svc
   ```
   - Edit `helm-flask-svc/values.yaml` and set your Docker image:
     ```yaml
     image:
       repository: <your-dockerhub-username>/flask-rest-svc
       tag: latest
       pullPolicy: IfNotPresent
     service:
       port: 9001
     ```
   - Update `deployment.yaml` and `service.yaml` in `helm-flask-svc/templates` if needed.

5. **Install and Verify**  
   Use Helm to install the app on Kubernetes and verify the deployment.

   **Commands:**
   ```sh
   helm install flask-rest helm-flask-svc
   kubectl get pods
   kubectl get svc
   ```
   - Find the service’s external IP or NodePort, then verify with:
     ```sh
     curl http://<service-ip>:9001/hello
     ```
   You should see:
   ```json
   {"message": "Service is up and running!"}
   ```

## Prerequisites

- Python 3.x
- Docker
- Docker Hub account
- Helm
- Kubernetes cluster (local or cloud)

## Usage

Follow the steps in this README to build, containerize, and deploy your Flask app using