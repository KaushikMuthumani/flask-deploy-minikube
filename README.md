

# Deployment of a Flask Application on Minikube using DevOps Methodologies

## Overview

This repository demonstrates a complete DevOps workflow, starting from **containerization** of an application to **orchestration**, **continuous integration/continuous deployment (CI/CD)**, and **monitoring with control mechanisms**.
The aim of this project is to showcase how a modern application can be developed, deployed, and managed in an automated and scalable environment.

---

## Workflow Stages

### 1. Dockerization

* The application was packaged using **Docker**.
* A `Dockerfile` was created to define dependencies, base image, and runtime configuration.
* Image built with:

  ```bash
  docker build -t myapp:latest .
  ```
* Verified locally using:

  ```bash
  docker run -p 8080:8080 myapp:latest
  ```

---

### 2. Containerization

* The application image was run as a container.
* Multiple containers were tested to validate scalability.
* **Docker Compose** was used to manage multi-container setup:

  ```bash
  docker-compose up -d
  ```
* Verified service communication between containers.

---

### 3. Orchestration

* **Kubernetes (K8s)** was used for orchestration.
* Created manifests for **Deployment**, **Service**, and **ConfigMap**.
* Deployed using:

  ```bash
  kubectl apply -f deployment.yaml
  kubectl apply -f service.yaml
  ```
* Ensured auto-scaling with:

  ```bash
  kubectl autoscale deployment myapp-deployment --cpu-percent=70 --min=2 --max=5
  ```
* Verified orchestration via:

  ```bash
  kubectl get pods,svc
  ```

---

### 4. CI/CD Pipeline

* A **GitHub Actions** workflow was set up for automation.
* Pipeline stages:

  1. **Build** – Docker image built on each commit.
  2. **Test** – Basic linting & container tests.
  3. **Push** – Image pushed to Docker Hub.
  4. **Deploy** – Triggered Kubernetes deployment update.
* Workflow file: `.github/workflows/ci-cd.yml`.

Example snippet:

```yaml
- name: Build Docker image
  run: docker build -t ${{ secrets.DOCKER_USERNAME }}/myapp:${{ github.sha }} .
```

---

### 5. Monitoring

* Monitoring set up using **Prometheus** and **Grafana**.
* Prometheus scrapes metrics from application and Kubernetes nodes.
* Grafana dashboards created for:

  * Container CPU/Memory usage
  * Pod availability
  * Request/response latency

---

### 6. Controlling

* Alerts configured in Prometheus for threshold breaches (e.g., high CPU usage).

---

## Tools & Technologies

* **Containerization:** Docker, Docker Compose
* **Orchestration:** Kubernetes
* **CI/CD:** GitHub Actions
* **Monitoring:** Prometheus, Grafana
* **Control/Logging:** ELK Stack, HPA

---

## Conclusion

This project demonstrates a **complete DevOps lifecycle**: starting from packaging the application into containers, deploying in a scalable Kubernetes cluster, automating builds and deployments via CI/CD pipelines, and ensuring observability and resilience through monitoring and control mechanisms.

