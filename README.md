# Kube Practice: Nginx Deployment with Helm

## 🇷🇺 Russian

Этот репозиторий представляет собой решение тестового задания по развертыванию веб-сервера Nginx в Kubernetes с использованием Helm.

**Текущий статус:** Реализован Docker-образ на базе CentOS 7, который запускает Nginx. Nginx настроен так, чтобы динамически отображать значения, переданные через переменные окружения, что является основой для последующего развертывания в Kubernetes.

### 🚀 Используемые технологии

*   **Контейнеризация:** Docker
*   **Базовый образ:** CentOS 7
*   **Веб-сервер:** Nginx
*   **Оркестрация (планируется):** Kubernetes (Minikube)
*   **Управление пакетами (планируется):** Helm, Helmfile

### 🛠️ Как запустить текущую версию (локально через Docker)

1.  **Клонировать репозиторий:**
    ```bash
    git clone https://github.com/martains21/kube-practice.git
    cd kube-practice
    ```

2.  **Собрать Docker-образ:**
    ```bash
    docker build -t nginx-centos:v1 .
    ```

3.  **Запустить контейнер:**
    *Команда запускает Nginx на порту 8000 и передает внутрь тестовые переменные окружения.*
    ```bash
    docker run --rm -p 8080:8000 \
      -e ENVIRONMENT="local-docker-test" \
      -e ENVIRONMENT_FROM_SECRET="My Docker Secret" \
      --name my-nginx-test \
      nginx-centos:v1
    ```

4.  **Проверить работоспособность:**
    *   Откройте в браузере `http://localhost:8080`.
    *   На странице должно отображаться: `Current Environment: local-docker-test`.
    *   Заголовок вкладки в браузере должен быть: `My Docker Secret`.

<br>

<details>
<summary><b>📋 Цель Проекта (Полное Тестовое Задание)</b></summary>

1.  Развернуть minikube.
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
6.  Результат в составе: helm chart, скриншоты оформить на публичном Git репозитории и прислать ссылку.

</details>

---
<br>

## 🇬🇧 English

This repository is a solution for a technical assignment focused on deploying an Nginx web server to Kubernetes using Helm.

**Current Status:** A Docker image based on CentOS 7 has been implemented to run Nginx. The server is configured to dynamically display values passed via environment variables, which serves as the foundation for the subsequent Kubernetes deployment.

### 🚀 Technologies Used

*   **Containerization:** Docker
*   **Base Image:** CentOS 7
*   **Web Server:** Nginx
*   **Orchestration (planned):** Kubernetes (Minikube)
*   **Package Management (planned):** Helm, Helmfile

### 🛠️ How to Run the Current Version (Locally with Docker)

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/martains21/kube-practice.git
    cd kube-practice
    ```

2.  **Build the Docker image:**
    ```bash
    docker build -t nginx-centos:v1 .
    ```

3.  **Run the container:**
    *This command runs Nginx on port 8000 and injects test environment variables.*
    ```bash
    docker run --rm -p 8080:8000 \
      -e ENVIRONMENT="local-docker-test" \
      -e ENVIRONMENT_FROM_SECRET="My Docker Secret" \
      --name my-nginx-test \
      nginx-centos:v1
    ```

4.  **Verify it works:**
    *   Open `http://localhost:8080` in your browser.
    *   The page should display: `Current Environment: local-docker-test`.
    *   The browser tab title should be: `My Docker Secret`.

<br>

<details>
<summary><b>📋 Project Goal (Full Task Description)</b></summary>

1.  Deploy minikube.
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
    *   3.6. **CertManager** with manifests for an Issuer and Certificate.
    *   3.7. A **HorizontalPodAutoscaler** to scale replicas from 2 to 4 based on CPU/RAM > 80%.
    *   3.8. A **Helmfile** for three environments (dev, stage, prod).
4.  Verify by displaying the `ENVIRONMENT` and `ENVIRONMENT_FROM_SECRET` variables in the application's responses.
5.  Prepare configuration files for all environments.
6.  The result, including the helm chart and screenshots, should be submitted to a public Git repository.

</details>