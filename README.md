# Turnkey Talent & Casting Marketplace Web Platform Template

[![PHP](https://img.shields.io/badge/PHP-8.1%20%7C%208.2-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net)
[![MySQL](https://img.shields.io/badge/MySQL-8.0%20%7C%20MariaDB-00758F?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-Responsive-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com)
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

A complete, multi-sided turnkey marketplace and casting web platform template engineered for **modeling agencies**, **talent booking directories**, **creative freelancer job boards**, and **event staffing platforms**. Built with an object-oriented PHP architecture, modular dashboards, and automated containerization via Docker Compose.

---

## 🌟 Key Highlights & Template Architecture

- **Three-Sided Marketplace Portals**:
  - **Talent / Model Portal (`Model/`)**: Portfolio photo gallery, physical measurements, casting applications, job proposal tracking, and earnings review.
  - **Client / Recruiter Portal (`Client/`)**: Talent search filters (location, skills, rate), casting calls / job post creation, applicant review, and private messaging.
  - **Administration Master Hub (`Admin/`)**: Platform analytics, user verifications, category taxonomy control, transaction review, and membership approvals.
- **Job Posting & Casting Search**: Search filters by category, location, budget range, and duration (`jobs.php`, `searchcat.php`).
- **Subscription & Tier Pricing**: Tiered plans for premium portfolio placement and client hiring credits (`pricing.php`).
- **Object-Oriented Service Layer**: Clean separation of database interactions (`classes/DB.php`, `classes/User.php`), input sanitization, and session management.
- **Environment-Aware Configuration**: Dynamic database resolution in `core/frontinit.php` and `core/init.php` supporting containerized variables and local servers.

---

## 🏗️ Architecture & Component Topology

```
+-------------------------------------------------------------+
|                     Client Browser                          |
+-------------------------------------------------------------+
                              | HTTP (Port 8088)
                              v
+-------------------------------------------------------------+
|                 Apache Web Server (PHP 8.1)                 |
|  - Front Controller & Page Routers (index.php, jobs.php)    |
|  - Talent Dashboard (/Model/) & Client Portal (/Client/)    |
|  - Backoffice Administration (/Admin/)                      |
|  - OOP Service Models (classes/DB.php, User.php)            |
+-------------------------------------------------------------+
                              | TCP / MySQL protocol
                              v
+-------------------------------------------------------------+
|              Database Service (MariaDB 10.11)               |
|  - Schema: modeleine_app                                    |
|  - Persistent storage for users, casting calls, profiles    |
+-------------------------------------------------------------+
```

---

## 🚀 Quick Start with Docker Compose

Run the marketplace platform locally with zero pre-installed runtime dependencies:

### 1. Clone the Repository
```bash
git clone git@github.com-personal:KevinAndrey96/modeleine-web.git
cd modeleine-web
```

### 2. Launch the Stack
```bash
docker compose up -d
```

### 3. Access the Portals
- **Public Marketplace**: [http://localhost:8088](http://localhost:8088)
- **Talent / Model Login**: [http://localhost:8088/login.php](http://localhost:8088/login.php)
- **Admin Control Panel**: [http://localhost:8088/Admin/](http://localhost:8088/Admin/)

---

## 💻 Manual Deployment (LAMP / cPanel / Shared Hosting)

1. Upload all repository files to your server web root (`public_html/` or `/var/www/html/`).
2. Create a MySQL database and user.
3. Configure your database settings in `core/frontinit.php` and `core/init.php` or export environment variables:
   ```ini
   DB_HOST="localhost"
   DB_NAME="modeleine_app"
   DB_USER="your_db_user"
   DB_PASSWORD="your_db_password"
   ```
4. Verify that Apache `mod_rewrite` is enabled for clean SEO URLs.

---

## 🛡️ License

Maintained for developer portfolio demonstration and production turnkey website deployment.
