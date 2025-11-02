# Kube Practice: FastAPI Application

## 🇷🇺 Russian

Этот репозиторий — учебный проект по развертыванию Python-приложения в Kubernetes.

На данный момент проект содержит простое веб-приложение на FastAPI, которое упаковано в Docker-контейнер. Конечная цель проекта — развернуть приложение в Kubernetes с использованием Helm, настроив несколько окружений, автомасштабирование и управление трафиком.

### 🚀 Используемые технологии (на текущий момент)

*   **Язык:** Python 3.14
*   **Фреймворк:** FastAPI
*   **Контейнеризация:** Docker

### 🛠️ Как запустить текущую версию

#### Вариант 1: Запуск через Python (виртуальное окружение)

1.  **Клонировать репозиторий:**
    ```bash
    git clone https://github.com/martains21/kube-practice.git
    cd kube-practice
    ```

2.  **Создать и активировать виртуальное окружение:**
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3.  **Установить зависимости:**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Запустить приложение:**
    ```bash
    uvicorn app.main:app --reload
    ```
    Приложение будет доступно по адресу `http://127.0.0.1:8000`.

#### Вариант 2: Запуск через Docker

1.  **Убедитесь, что Docker запущен.**

2.  **Собрать Docker-образ:**
    ```bash
    docker build -t kube-practice-app .
    ```

3.  **Запустить контейнер:**
    ```bash
    docker run --rm -p 8000:80 kube-practice-app
    ```
    Приложение будет доступно по адресу `http://localhost:8000`.

<br>

<details>
<summary><b>📋 Цель Проекта (Полное Тестовое Задание)</b></summary>

1.  Развернуть minikube
2.  Используя базовый образ Centos 7, написать Dockerfile для запуска Nginx.
3.  Написать helm chart, в котором:
    *   3.1. **Configmap** для переменной окружения `ENVIRONMENT` (`dev`, `stage`, `prod`).
    *   3.2. **Secret** для переменной `ENVIRONMENT_FROM_SECRET` (`secret_dev`, `secret_stage`, `secret_prod`) с шифрованием (например, helm-secrets).
    *   3.3. **Deployment**, который будет:
        *   3.3.1. Запускать 2 реплики приложения.
        *   3.3.2. Работать на 8000 порте.
        *   3.3.3. Прокидывать в контейнер ConfigMap и Secret.
        *   3.3.4. Иметь `readiness` и `liveness` probes по эндпоинту `/healthcheck`.
    *   3.4. **Service** типа ClusterIP.
    *   3.5. **Ingress** для хостов: `localhost` (dev), `stage.domain.space` (stage), `prod.domain.space` (prod).
    *   3.6. **CertManager** с манифестами для Issuer и Certificate (без реального выпуска).
    *   3.7. **HorizontalPodAutoscaler** для скейлинга от 2 до 4 реплик по CPU/RAM > 80%.
    *   3.8. **Helmfile** для трех окружений (dev, stage, prod).
4.  Проверить работу, отобразив переменные `ENVIRONMENT` и `ENVIRONMENT_FROM_SECRET` в ответах приложения.
5.  Подготовить файлы конфигураций для всех окружений.

</details>

---
<br>

## 🇬🇧 English

This repository is a learning project focused on deploying a Python application to Kubernetes.

Currently, the project consists of a simple web application built with FastAPI and containerized using Docker. The ultimate goal is to deploy the application to Kubernetes using Helm, setting up multiple environments, autoscaling, and traffic management.

### 🚀 Technologies Used (so far)

*   **Language:** Python 3.14
*   **Framework:** FastAPI
*   **Containerization:** Docker

### 🛠️ How to Run the Current Version

#### Option 1: Running with Python (virtual environment)

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/martains21/kube-practice.git
    cd kube-practice
    ```

2.  **Create and activate the virtual environment:**
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Run the application:**
    ```bash
    uvicorn app.main:app --reload
    ```
    The application will be available at `http://12.7.0.0.1:8000`.

#### Option 2: Running with Docker

1.  **Make sure Docker is running.**

2.  **Build the Docker image:**
    ```bash
    docker build -t kube-practice-app .
    ```

3.  **Run the container:**
    ```bash
    docker run --rm -p 8000:80 kube-practice-app
    ```
    The application will be available at `http://localhost:8000`.

<br>

<details>
<summary><b>📋 Project Goal (Full Task Description)</b></summary>

1.  Deploy minikube
2.  Using the base CentOS 7 image, write a Dockerfile to run Nginx.
3.  Write a Helm chart that includes:
    *   3.1. **ConfigMap** for the `ENVIRONMENT` variable (`dev`, `stage`, `prod`).
    *   3.2. **Secret** for `ENVIRONMENT_FROM_SECRET` (`secret_dev`, `secret_stage`, `secret_prod`) with encryption (e.g., helm-secrets).
    *   3.3. A **Deployment** that will:
        *   3.3.1. Run 2 application replicas.
        *   3.3.2. Operate on port 8000.
        *   3.3.3. Inject ConfigMap and Secret into the container.
        *   3.3.4. Have `readiness` and `liveness` probes on the `/healthcheck` endpoint.
    *   3.4. A **Service** of type ClusterIP.
    *   3.5. An **Ingress** for hosts: `localhost` (dev), `stage.domain.space` (stage), `prod.domain.space` (prod).
    *   3.6. **CertManager** with manifests for an Issuer and Certificate (without actual issuance).
    *   3.7. A **HorizontalPodAutoscaler** to scale replicas from 2 to 4 based on CPU/RAM > 80%.
    *   3.8. A **Helmfile** for three environments (dev, stage, prod).
4.  Verify by displaying the `ENVIRONMENT` and `ENVIRONMENT_FROM_SECRET` variables in the application's responses.
5.  Prepare configuration files for all environments.

</details>