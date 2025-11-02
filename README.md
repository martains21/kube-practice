# kube-practice

## RU:

### Данный репозиторий это мое решение следующего задания:

1.	Развернуть minikube
2.	Используя базовый образ Centos 7 написать  Dockerfile для запуска  Nginx, с учетом указанных ниже требований
3.	Написать helm chart. в котором
3.1.	Configmap для переменных окружения (ENVIRONMENT) 
3.1.1.	Переменная ENVIRONMENT должна иметь значения: dev, stage, prod в зависимости от окружения
3.2.	Secret для секретных переменных окружения (ENVIRONMENT_FROM_SECRET) 
3.2.1.	Секреты должны шифроваться любым способом доступным для k8s (например: helm-secrets)
3.2.2.	Секрет ENVIRONMENT_FROM_SECRET должен иметь значения: secret_dev, secret_stage, secret_prod в зависимости от окружения
3.3.	Deployment, который будет 
3.3.1.	Запускать 2 реплики приложения
3.3.2.	Работать на 8000 порте
3.3.3.	Прокидывать в контейнер ConfigMap и Secret
3.3.4.	Иметь readiness и liveness probes по эндпоинту /healthcheck
3.4.	Service типа ClusterIP
3.5.	Ingress для nginx сервера, который должен сконфигурирован для хостов 
3.5.1.	dev - localhost
3.5.2.	stage – stage.domain.space
3.5.3.	prod - prod.domain.space
3.6.	CertManager в котором 
3.6.1.	Issuer для выписывания сертификатов acme-letsencrypt через http01.ingess
3.6.2.	Certificate - соответствующий сертификат связанный с Issuer для доменов окружений stage и prod
3.6.3.	P.S. Ествественно не нужно пытаться выписывать сертификаты, только написать манифесты
3.7.	HorizontalPodAutoscaler, который будет 
3.7.1.	Скейлить реплики от 2 до 4
3.7.2.	Триггер для скейла будет использование CPU или ОЗУ в 80%
3.8.	helmfile для трех (dev, stage, prod) окружений
3.9.	Максимально использовать общие переменные и переиспользовать переменные окружений по необходимости
3.10.	Написать полную пошаговую инструкцию по сборке приложения и запуску через minikube
3.11.	Используя helm chart выполнить деплой в minikube 
4.	Проверить работату по адресу http://0.0.0.0:8000/ и отображать значение переменной ENVIRONMENT в ответе, сделать скриншот
5.	По адресу http://0.0.0.0:8000/docs отображать значение переменной ENVIRONMENT_FROM_SECRET в заголовке страницы
6.	Подготовлены файлы конфигураций для всех окружений

## ENG:

### This repo is my solution for that task:


1.	Deploy minikube
2.	Using the base CentOS 7 image, write a Dockerfile to run Nginx, considering the requirements below
3.	Write a Helm chart that includes:
3.1.	ConfigMap for environment variables (ENVIRONMENT)
3.1.1.	The ENVIRONMENT variable must have values: dev, stage, prod depending on the environment
3.2.	Secret for sensitive environment variables (ENVIRONMENT_FROM_SECRET)
3.2.1.	Secrets must be encrypted using any method available in k8s (e.g., helm-secrets)
3.2.2.	The ENVIRONMENT_FROM_SECRET secret must have values: secret_dev, secret_stage, secret_prod depending on the environment
3.3.	A Deployment that will:
3.3.1.	Run 2 application replicas
3.3.2.	Operate on port 8000
3.3.3.	Inject ConfigMap and Secret into the container
3.3.4.	Have readiness and liveness probes on the /healthcheck endpoint
3.4.	A ClusterIP-type Service
3.5.	An Ingress for the nginx server, configured for the following hosts:
3.5.1.	dev - localhost
3.5.2.	stage – stage.domain.space
3.5.3.	prod - prod.domain.space
3.6.	CertManager in which:
3.6.1.	An Issuer for obtaining acme-letsencrypt certificates via http01.ingress
3.6.2.	A Certificate linked to the Issuer for stage and prod environment domains
3.6.3.	P.S. Naturally, do not attempt to actually issue certificates, only write the manifests
3.7.	A HorizontalPodAutoscaler that will:
3.7.1.	Scale replicas from 2 to 4
3.7.2.	Use CPU or RAM usage at 80% as the trigger for scaling
3.8.	A helmfile for three environments (dev, stage, prod)
3.9.	Maximize the use of shared variables and reuse environment variables as needed
3.10.	Write a complete step-by-step guide for building the application and deploying via minikube
3.11.	Use the Helm chart to deploy to minikube
4.	Verify operation at http://0.0.0.0:8000/ and display the ENVIRONMENT variable value in the response, take a screenshot
5.	Display the ENVIRONMENT_FROM_SECRET variable value in the page header at http://0.0.0.0:8000/docs
6.	Prepare configuration files for all environments