# Capstone Project - E-Commerce Flask App (CI/CD + AKS)

This repository contains the source code, Dockerfile, Kubernetes manifests, and Azure DevOps pipeline configuration for deploying a monolithic Flask-based E-Commerce application to Azure Kubernetes Service (AKS).

## Key Features

- Flask-based monolithic E-Commerce web app
- SQLAlchemy for database ORM
- Authentication, admin dashboard, and product management
- Integrated CI/CD using Azure DevOps
- Containerized using Docker
- Deploys to AKS with YAML manifests
- Azure SQL Database for backend
- Integrated SonarQube code quality scan
- Monitoring and centralized logging setup

## Tech Stack

- Python (Flask, SQLAlchemy)
- Azure DevOps Pipelines
- Docker
- Kubernetes (AKS)
- Azure SQL Database
- Azure Container Registry (ACR)
- SonarQube

## Project Structure

capstone-main/
│
├── Dockerfile # Docker image definition
├── Market/ # App code (routes, models, templates)
├── main.py # Entry point
├── db.py # DB connection (Azure SQL)
├── manifests/ # Kubernetes YAML manifests
├── azure-pipelines.yml # Azure DevOps pipeline for CI/CD
├── test_sql.py / tests/ # Test files
├── sonar-project.properties # SonarQube configuration
└── requirements.txt # Python dependencies


## CI/CD Pipeline

1. **CI**:
   - Triggered on code push
   - Runs tests, SonarQube scan
   - Builds Docker image, Trivy scan
   - Pushes image to ACR

2. **CD**:
   - Deploys latest image to AKS using `kubectl`
   - Uses Kubernetes manifests (`manifests/` folder)

## Prerequisites

- Azure DevOps account
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Azure SQL Database
- SonarQube instance

## How to Run Locally

```bash
# Clone the repo
git clone https://github.com/ssethumadav/capstone.git
cd capstone-main

# Install dependencies
pip install -r requirements.txt

# Run locally
python main.py
