# Turnkey Talent & Casting Marketplace Web Platform Template (php-casting-marketplace)

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
- **Automated Database Seeding**: Pre-configured schema and seed data in `database/schema.sql` automatically imported on container start.
- **Environment-Aware Configuration**: Dynamic database resolution in `core/frontinit.php`, `core/init.php`, and `core/backinit.php` supporting containerized variables and local servers.

---

## 🏗️ Architecture & Component Topology

```
+-------------------------------------------------------------+
|                     Client Browser                          |
+-------------------------------------------------------------+
              | HTTP (Port 8088)           | HTTP (Port 8089)
              v                            v
+-----------------------------+   +---------------------------+
| Apache Web Server (PHP 8.1) |   |        phpMyAdmin         |
| - Front Controller & Routers|   |   (Web Database Manager)  |
| - Dashboards: Admin, Model, |   +---------------------------+
|   and Client Portals        |                |
| - OOP DB Layer & Services   |                |
+-----------------------------+                |
              | TCP (Port 3306)                |
              +-----------------+--------------+
                                |
                                v
+-------------------------------------------------------------+
|              Database Service (MariaDB 10.11)               |
| - Schema: casting_db                                        |
| - Auto-seeded tables: users, castings, profiles, categories |
+-------------------------------------------------------------+
```

---

## 🚀 Quick Start with Docker Compose

Run the marketplace platform locally with zero pre-installed runtime dependencies:

### 1. Clone the Repository
```bash
git clone git@github.com-personal:KevinAndrey96/php-casting-marketplace.git
cd php-casting-marketplace
```

### 2. Configure Environment (Optional)
```bash
cp .env.example .env
```

### 3. Launch the Stack
```bash
docker compose up -d
```

### 4. Access the Portals
| Service | URL | Default Credentials | Description |
| :--- | :--- | :--- | :--- |
| **Public Marketplace** | [http://localhost:8088](http://localhost:8088) | N/A | Landing page, catalog and search |
| **Admin Portal** | [http://localhost:8088/Admin/](http://localhost:8088/Admin/) | `admin@casting.local` / `admin123` | Administrative backoffice |
| **Client Portal** | [http://localhost:8088/Client/](http://localhost:8088/Client/) | `client@casting.local` / `admin123` | Recruiter and client portal |
| **Talent / Model Portal** | [http://localhost:8088/Model/](http://localhost:8088/Model/) | `model@casting.local` / `admin123` | Model and talent dashboard |
| **phpMyAdmin** | [http://localhost:8089](http://localhost:8089) | User: `casting_user` / `casting_password` | Web database interface |

---

## 💻 Manual Deployment (LAMP / cPanel / Shared Hosting)

1. Upload all repository files to your server web root (`public_html/` or `/var/www/html/`).
2. Create a MySQL database and user.
3. Import `database/schema.sql` into your database.
4. Configure your database settings via environment variables or in `core/init.php` and `core/frontinit.php`:
   ```ini
   DB_HOST="localhost"
   DB_NAME="casting_db"
   DB_USER="your_db_user"
   DB_PASSWORD="your_db_password"
   ```
5. Verify that Apache `mod_rewrite` is enabled for clean SEO URLs.

---

## 🛡️ License

Maintained for developer portfolio demonstration and production turnkey website deployment.
