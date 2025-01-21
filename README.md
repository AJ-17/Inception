# 🐋 Inception

## 🎓 42 School Project
Inception is a System Administration project that is part of the 42 School curriculum. The main purpose of this project is to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

### Project Purpose
- Learn and implement containerization concepts using Docker
- Understand the interaction between different services (WordPress, NGINX, MariaDB)
- Master Docker Compose for multi-container application management
- Gain hands-on experience with system administration tasks
- Practice secure deployment of web services
- Learn about virtual machines and container orchestration

This project aims to set up a small infrastructure composed of different services under Docker. The goal is to run multiple services (WordPress, MariaDB, and Nginx) in dedicated containers using Docker Compose, each with their own specific configurations and security requirements.

## ⚡ Prerequisites
- Docker Engine
- Docker Compose
- Make (for Makefile usage)
- Basic understanding of containerization and Docker concepts

## 📁 Project Structure
```
Inception/
├── Makefile
├── srcs/
│   ├── docker-compose.yml
│   └── requirements/
│       ├── nginx/
│       │   ├── Dockerfile
│       │   └── conf/
│       ├── wordpress/
│       │   ├── Dockerfile
│       │   ├── conf/
│       │   └── tools/
│       └── mariadb/
│           ├── Dockerfile
│           ├── conf/
│           └── tools/
```

## 🔧 Services
1. **NGINX Container**
   - Acts as a reverse proxy
   - Only entry point to the infrastructure through port 443 (HTTPS)
   - TLSv1.2 or TLSv1.3 implementation

2. **WordPress Container**
   - Latest WordPress with php-fpm
   - No nginx in this container
   - Connected to MariaDB container

3. **MariaDB Container**
   - Latest MariaDB database
   - Stores WordPress database
   - Volume for persistent data

## 🚀 Setup Instructions

### 🔐 Environment Variables
Create a `.env` file in the `srcs/` directory with the following variables like in this example:
```.env
# MariaDB Variables
SQL_DATABASE=wp_db
SQL_USER=user
SQL_PASSWORD=password
SQL_ROOT_PASSWORD=password

# WP Variables
WP_PATH=/var/www/wordpress
WP_URL=ajakubcz.42.fr
WP_TITLE="Inception"
WP_ADMIN_USER=root
WP_ADMIN_PASSWORD=password
WP_ADMIN_EMAIL=root@example.fr

WP_USER=user
WP_USER_PASSWORD=password
WP_USER_EMAIL=user@example.fr
```

### 🏗️ Building and Running
1. Clone the repository:
   ```bash
   git clone git@github.com:AymericJakubczyk/Inception.git
   cd Inception
   ```

2. Build and start the containers:
   ```bash
   make
   ```

## 💾 Volume Configuration
- WordPress files stored in `/home/login/data/wordpress/`
- Database files stored in `/home/login/data/mariadb/`

## 🌐 Network Configuration
- All containers connected to the same virtual network
- Container-to-container communication uses their service names as hostnames

## ✅ Requirements
- No usage of ready-made Docker images (except base images)
- Dockerfiles must be called in docker-compose.yml
- The infrastructure should be built and run using a single `make` command
- All configuration files should be version controlled
- Containers should be built from the penultimate stable version of Alpine or Debian
- Services should automatically restart in case of crash

## 🔍 Troubleshooting
Common issues and solutions:
- Container not starting: Check logs using `docker logs <container_name>`
- Database connection issues: Verify environment variables and network connectivity
- Permission problems: Check volume mount permissions
