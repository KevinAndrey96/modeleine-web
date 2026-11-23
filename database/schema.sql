-- Talent & Model Casting Marketplace Database Schema
-- Auto-seeded on container initialization

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------
-- Table: settings
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `use_icon` int(1) NOT NULL DEFAULT 1,
  `site_icon` varchar(255) NOT NULL DEFAULT 'assets/img/favicon.png',
  `tagline` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT 'http://localhost:8088',
  `description` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `author` varchar(255) NOT NULL DEFAULT '',
  `mail` varchar(255) NOT NULL DEFAULT 'admin@casting.local',
  `mailpass` varchar(255) NOT NULL DEFAULT '',
  `job_limit` int(11) NOT NULL DEFAULT 10,
  `service_limit` int(11) NOT NULL DEFAULT 10,
  `proposal_limit` int(11) NOT NULL DEFAULT 10,
  `top_title` varchar(255) NOT NULL DEFAULT 'Encuentra y Contrata Modelos y Talentos',
  `show_downtitle` int(1) NOT NULL DEFAULT 1,
  `down_title` varchar(255) NOT NULL DEFAULT 'La plataforma lider de casting en Latinoamerica',
  `searchterm` varchar(255) NOT NULL DEFAULT 'Buscar modelos por categoria...',
  `header_img` varchar(255) NOT NULL DEFAULT 'assets/img/header/1.jpg',
  `cattagline` varchar(255) NOT NULL DEFAULT 'Explora Categorias de Talento',
  `testtagline` varchar(255) NOT NULL DEFAULT 'Lo que dicen las agencias y marcas',
  `statstagline` varchar(255) NOT NULL DEFAULT 'Metricas de la plataforma',
  `about_top_title` varchar(255) NOT NULL DEFAULT 'Acerca de Nosotros',
  `about_header_img` varchar(255) NOT NULL DEFAULT 'assets/img/header/about.jpg',
  `about_hello` text DEFAULT NULL,
  `about_whitebg` text DEFAULT NULL,
  `teamtagline` varchar(255) NOT NULL DEFAULT 'Nuestro Equipo Directivo',
  `timelinetagline` varchar(255) NOT NULL DEFAULT 'Nuestra Trayectoria',
  `how_top_title` varchar(255) NOT NULL DEFAULT 'Como Funciona la Plataforma',
  `how_header_img` varchar(255) NOT NULL DEFAULT 'assets/img/header/how.jpg',
  `faq_top_title` varchar(255) NOT NULL DEFAULT 'Preguntas Frecuentes',
  `faq_header_img` varchar(255) NOT NULL DEFAULT 'assets/img/header/faq.jpg',
  `faq_hello` text DEFAULT NULL,
  `contact_top_title` varchar(255) NOT NULL DEFAULT 'Contacto Directo',
  `contact_header_img` varchar(255) NOT NULL DEFAULT 'assets/img/header/contact.jpg',
  `contact_location` varchar(255) NOT NULL DEFAULT 'Calle 100 # 15-20, Bogota, Colombia',
  `contact_phone` varchar(50) NOT NULL DEFAULT '+57 300 123 4567',
  `contact_email` varchar(255) NOT NULL DEFAULT 'contacto@casting.local',
  `contact_map` text DEFAULT NULL,
  `footer_about` text DEFAULT NULL,
  `facebook` varchar(255) DEFAULT 'https://facebook.com',
  `twitter` varchar(255) DEFAULT 'https://twitter.com',
  `google` varchar(255) DEFAULT 'https://google.com',
  `instagram` varchar(255) DEFAULT 'https://instagram.com',
  `linkedin` varchar(255) DEFAULT 'https://linkedin.com',
  `pricing_top_title` varchar(255) NOT NULL DEFAULT 'Planes y Membresias',
  `pricing_header_img` varchar(255) NOT NULL DEFAULT 'assets/img/header/pricing.jpg',
  `services_header_img` varchar(255) NOT NULL DEFAULT 'assets/img/header/services.jpg',
  `jobs_header_img` varchar(255) NOT NULL DEFAULT 'assets/img/header/jobs.jpg',
  `google_analytics` varchar(50) DEFAULT '',
  `bgimage` varchar(255) NOT NULL DEFAULT 'assets/img/bg.jpg',
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `paypal_email` varchar(255) NOT NULL DEFAULT 'payments@casting.local',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` (`id`, `title`, `use_icon`, `site_icon`, `tagline`, `description`, `keywords`, `author`, `bgimage`, `contact_email`, `currency`) VALUES
(1, 'Model Casting Marketplace', 1, 'assets/img/favicon.png', 'Marketplace de Casting, Modelaje y Contratacion', 'Plataforma profesional que conecta marcas, productoras y fotografos con modelos profesionales.', 'modelos, casting, talentos, moda, fotografia, publicidad', 'Kevin Andrey Herrera', 'assets/img/bg.jpg', 'admin@casting.local', 'USD')
ON DUPLICATE KEY UPDATE `title` = VALUES(`title`);

-- -----------------------------------------------------
-- Table: payments_settings
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payments_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `membershipid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `payments_settings` (`id`, `currency`, `membershipid`) VALUES
(1, '1', 'MEM01')
ON DUPLICATE KEY UPDATE `currency` = VALUES(`currency`);

-- -----------------------------------------------------
-- Table: membership_freelancer
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `membership_freelancer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membershipid` varchar(50) NOT NULL DEFAULT '',
  `bids` int(11) NOT NULL DEFAULT 20,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `membership_freelancer` (`id`, `membershipid`, `bids`, `price`, `name`) VALUES
(1, 'MEM01', 20, 0.00, 'Free Talent Plan')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- -----------------------------------------------------
-- Table: membership_agency
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `membership_agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membershipid` varchar(50) NOT NULL DEFAULT '',
  `bids` int(11) NOT NULL DEFAULT 50,
  `price` decimal(10,2) NOT NULL DEFAULT 49.00,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `membership_agency` (`id`, `membershipid`, `bids`, `price`, `name`) VALUES
(1, 'MEM02', 50, 49.00, 'Agency Pro Plan')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- -----------------------------------------------------
-- Table: category
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `slug` varchar(100) NOT NULL DEFAULT '',
  `icon` varchar(50) NOT NULL DEFAULT '',
  `item_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `category` (`id`, `catid`, `name`, `slug`, `icon`, `item_order`) VALUES
(1, 'CAT01', 'Pasarela / Runway', 'pasarela-runway', 'fa-female', 1),
(2, 'CAT02', 'Comercial & Publicidad', 'comercial-publicidad', 'fa-camera', 2),
(3, 'CAT03', 'Fotografia Editorial', 'fotografia-editorial', 'fa-image', 3),
(4, 'CAT04', 'Fitness & Deportes', 'fitness-deportes', 'fa-heartbeat', 4),
(5, 'CAT05', 'Actuacion & Extras', 'actuacion-extras', 'fa-film', 5)
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- -----------------------------------------------------
-- Table: skills
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skillid` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `catid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `skills` (`id`, `skillid`, `name`, `catid`) VALUES
(1, 'SK01', 'Catwalk', 'CAT01'),
(2, 'SK02', 'Pose en Estudio', 'CAT02'),
(3, 'SK03', 'Actuacion para Camara', 'CAT05'),
(4, 'SK04', 'Ingles Fluido', 'CAT02'),
(5, 'SK05', 'Danza Contemporanea', 'CAT04')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- -----------------------------------------------------
-- Table: groups
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `permissions` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `groups` (`id`, `name`, `permissions`) VALUES
(1, 'Administrator', '{\"admin\":1}')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- -----------------------------------------------------
-- Table: admin
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) NOT NULL DEFAULT '',
  `joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Password is: admin123 (SHA-256)
INSERT INTO `admin` (`id`, `adminid`, `name`, `email`, `password`, `salt`, `joined`, `user_type`) VALUES
(1, 'ADM01', 'Super Administrador', 'admin@casting.local', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa82280f1a82e3eb4', '', NOW(), 1)
ON DUPLICATE KEY UPDATE `password` = VALUES(`password`);

-- -----------------------------------------------------
-- Table: client
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) NOT NULL DEFAULT '',
  `imagelocation` varchar(255) NOT NULL DEFAULT 'assets/img/client-default.png',
  `bgimage` varchar(255) NOT NULL DEFAULT 'assets/img/bg-default.jpg',
  `joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT 1,
  `delete_remove` int(1) NOT NULL DEFAULT 0,
  `user_type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Password is: admin123 (SHA-256)
INSERT INTO `client` (`id`, `clientid`, `username`, `name`, `email`, `password`, `salt`, `joined`, `active`, `user_type`) VALUES
(1, 'CLI01', 'voguemedia', 'Vogue Media Agency', 'client@casting.local', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa82280f1a82e3eb4', '', NOW(), 1, 1)
ON DUPLICATE KEY UPDATE `password` = VALUES(`password`);

-- -----------------------------------------------------
-- Table: freelancer (Models / Talents)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `freelancer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) NOT NULL DEFAULT '',
  `imagelocation` varchar(255) NOT NULL DEFAULT 'assets/img/model-default.png',
  `bgimage` varchar(255) NOT NULL DEFAULT 'assets/img/bg-default.jpg',
  `title` varchar(150) NOT NULL DEFAULT '',
  `rate` decimal(10,2) NOT NULL DEFAULT 100.00,
  `phone` varchar(50) NOT NULL DEFAULT '',
  `category` varchar(100) NOT NULL DEFAULT '',
  `catid` varchar(50) NOT NULL DEFAULT 'CAT01',
  `about` text DEFAULT NULL,
  `joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT 1,
  `delete_remove` int(1) NOT NULL DEFAULT 0,
  `user_type` int(11) NOT NULL DEFAULT 1,
  `membershipid` varchar(50) NOT NULL DEFAULT 'MEM01',
  `membership_bids` int(11) NOT NULL DEFAULT 20,
  `membership_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `freelancerid` (`freelancerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Password is: admin123 (SHA-256)
INSERT INTO `freelancer` (`id`, `freelancerid`, `username`, `name`, `email`, `password`, `salt`, `title`, `rate`, `phone`, `category`, `catid`, `about`, `joined`, `active`, `user_type`) VALUES
(1, 'MOD01', 'valentinamodel', 'Valentina Rossi', 'model@casting.local', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa82280f1a82e3eb4', '', 'Modelo Profesional de Pasarela y Publicidad', 150.00, '+57 310 987 6543', 'Pasarela / Runway', 'CAT01', 'Modelo con 6 anos de trayectoria en pasarelas nacionales y campanas publicitarias editoriales.', NOW(), 1, 1),
(2, 'MOD02', 'camilatalent', 'Camila Restrepo', 'camila@casting.local', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa82280f1a82e3eb4', '', 'Modelo Comercial & Fotografia de Moda', 120.00, '+57 320 123 4567', 'Comercial & Publicidad', 'CAT02', 'Especializada en campanas comerciales, comerciales de television y catalogos de moda.', NOW(), 1, 1)
ON DUPLICATE KEY UPDATE `password` = VALUES(`password`);

-- -----------------------------------------------------
-- Table: job (Castings & Projects)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(50) NOT NULL DEFAULT '',
  `clientid` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `catid` varchar(50) NOT NULL DEFAULT 'CAT01',
  `budget` decimal(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT 1,
  `delete_remove` int(1) NOT NULL DEFAULT 0,
  `completed` int(1) NOT NULL DEFAULT 0,
  `public` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `jobid` (`jobid`),
  KEY `clientid` (`clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `job` (`id`, `jobid`, `clientid`, `title`, `slug`, `catid`, `budget`, `description`, `date_added`, `active`, `completed`, `public`) VALUES
(1, 'JOB01', 'CLI01', 'Campana Publicitaria Coleccion Playa & Resort 2026', 'campana-publicitaria-coleccion-playa-resort-2026', 'CAT01', 1800.00, 'Buscamos 2 modelos femeninas para grabacion de spot comercial y sesion fotografica en locacion exterior.', NOW(), 1, 0, 1),
(2, 'JOB02', 'CLI01', 'Pasarela Semana de la Moda Diseñadores Emergentes', 'pasarela-semana-de-la-moda-disenadores-emergentes', 'CAT01', 950.00, 'Casting abierto para desfile de alta costura de diseno independiente.', NOW(), 1, 0, 1)
ON DUPLICATE KEY UPDATE `title` = VALUES(`title`);

-- -----------------------------------------------------
-- Table: proposal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposalid` varchar(50) NOT NULL DEFAULT '',
  `jobid` varchar(50) NOT NULL DEFAULT '',
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `budget` decimal(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `proposal` (`id`, `proposalid`, `jobid`, `freelancerid`, `budget`, `description`, `date_added`, `accepted`) VALUES
(1, 'PROP01', 'JOB01', 'MOD01', 1800.00, 'Cuento con amplia disponibilidad y experiencia en sesiones en playa.', NOW(), 0)
ON DUPLICATE KEY UPDATE `budget` = VALUES(`budget`);

-- -----------------------------------------------------
-- Table: portfolio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: team
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `testimony` int(1) NOT NULL DEFAULT 1,
  `item_order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `team` (`id`, `name`, `title`, `description`, `testimony`, `item_order`) VALUES
(1, 'Carolina Mejia', 'Directora de Casting', 'La plataforma nos ha permitido contratar talentos para nuestras campanas en tiempo record.', 1, 1),
(2, 'Alejandro Gomez', 'Fotografo de Moda', 'Excelente herramienta para revisar books fotograficos y contactar modelos profesionales.', 1, 2)
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- -----------------------------------------------------
-- Table: timeline
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `year` varchar(20) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `item_order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `timeline` (`id`, `title`, `year`, `description`, `item_order`) VALUES
(1, 'Lanzamiento de la Plataforma', '2023', 'Inauguracion del marketplace de talentos.', 1)
ON DUPLICATE KEY UPDATE `title` = VALUES(`title`);

-- -----------------------------------------------------
-- Table: section_client & section_freelancer
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `section_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `icon` varchar(50) NOT NULL DEFAULT 'fa-bullhorn',
  `item_order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `section_client` (`id`, `title`, `description`, `icon`, `item_order`) VALUES
(1, 'Publica tu Casting', 'Describe los requerimientos de tu proyecto o sesion fotografica.', 'fa-bullhorn', 1),
(2, 'Revisa Perfiles y Books', 'Explora medidas, portafolios de fotos y experiencia verificada.', 'fa-users', 2),
(3, 'Contrata con Seguridad', 'Acuerda pagos y entregas bajo garantia y seguimiento.', 'fa-handshake-o', 3)
ON DUPLICATE KEY UPDATE `title` = VALUES(`title`);

CREATE TABLE IF NOT EXISTS `section_freelancer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `icon` varchar(50) NOT NULL DEFAULT 'fa-camera',
  `item_order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `section_freelancer` (`id`, `title`, `description`, `icon`, `item_order`) VALUES
(1, 'Crea tu Book Digital', 'Publica tus mejores tomas, medidas y categorias de interes.', 'fa-camera', 1),
(2, 'Aplica a Castings', 'Postulate a convocatorias de marcas y productoras comerciales.', 'fa-envelope-open', 2),
(3, 'Recibe Pagos Directos', 'Gestiona tus contratos y remuneraciones de forma transparente.', 'fa-money', 3)
ON DUPLICATE KEY UPDATE `title` = VALUES(`title`);

-- -----------------------------------------------------
-- Table: users_session
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `hash` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: message
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_from` varchar(50) NOT NULL DEFAULT '',
  `user_to` varchar(50) NOT NULL DEFAULT '',
  `msg` text DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_status` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;


-- -----------------------------------------------------
-- Table: currency
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(10) NOT NULL DEFAULT 'USD',
  `currency_name` varchar(100) NOT NULL DEFAULT 'US Dollar',
  `currency_symbol` varchar(10) NOT NULL DEFAULT '$',
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `currency` (`id`, `currency_code`, `currency_name`, `currency_symbol`) VALUES
(1, 'USD', 'US Dollar', '$'),
(2, 'EUR', 'Euro', '€'),
(3, 'GBP', 'British Pound', '£'),
(4, 'COP', 'Peso Colombiano', '$')
ON DUPLICATE KEY UPDATE `currency_code` = VALUES(`currency_code`);

-- -----------------------------------------------------
-- Table: profile
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileid` varchar(50) NOT NULL DEFAULT '',
  `userid` varchar(50) NOT NULL DEFAULT '',
  `location` varchar(255) DEFAULT '',
  `city` varchar(100) DEFAULT '',
  `country` varchar(100) DEFAULT '',
  `rate` decimal(10,2) DEFAULT 0.00,
  `website` varchar(255) DEFAULT '',
  `about` text DEFAULT NULL,
  `education` text DEFAULT NULL,
  `work` text DEFAULT NULL,
  `awards` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 1,
  `delete_remove` int(1) NOT NULL DEFAULT 0,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `profile` (`id`, `profileid`, `userid`, `location`, `city`, `country`, `rate`, `about`, `skills`, `active`) VALUES
(1, 'PROF001', 'MOD001', 'Bogota, Colombia', 'Bogota', 'Colombia', 50.00, 'Modelo profesional de pasarela y fotografia publicitaria con 5 anos de experiencia.', 'Pasarela, Fotografia, Editorial, Comercial', 1)
ON DUPLICATE KEY UPDATE `profileid` = VALUES(`profileid`);

-- -----------------------------------------------------
-- Table: service
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceid` varchar(50) NOT NULL DEFAULT '',
  `userid` varchar(50) NOT NULL DEFAULT '',
  `catid` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `active` int(1) NOT NULL DEFAULT 1,
  `delete_remove` int(1) NOT NULL DEFAULT 0,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `service` (`id`, `serviceid`, `userid`, `catid`, `title`, `description`, `rate`, `active`) VALUES
(1, 'SRV001', 'MOD001', 'CAT01', 'Sesion Fotografica de Moda y Lookbook', 'Sesion profesional para catalogo, lookbook o campana de marca.', 250.00, 1)
ON DUPLICATE KEY UPDATE `serviceid` = VALUES(`serviceid`);

-- -----------------------------------------------------
-- Table: milestone
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `milestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(50) NOT NULL DEFAULT '',
  `clientid` varchar(50) NOT NULL DEFAULT '',
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `budget` decimal(10,2) NOT NULL DEFAULT 0.00,
  `start_date` varchar(50) DEFAULT '',
  `end_date` varchar(50) DEFAULT '',
  `funded` int(1) NOT NULL DEFAULT 0,
  `active` int(1) NOT NULL DEFAULT 1,
  `delete_remove` int(1) NOT NULL DEFAULT 0,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: task
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(50) NOT NULL DEFAULT '',
  `milestoneid` varchar(50) NOT NULL DEFAULT '',
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `progress` int(3) NOT NULL DEFAULT 0,
  `start_date` varchar(50) DEFAULT '',
  `end_date` varchar(50) DEFAULT '',
  `active` int(1) NOT NULL DEFAULT 1,
  `delete_remove` int(1) NOT NULL DEFAULT 0,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: ratings
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(50) NOT NULL DEFAULT '',
  `clientid` varchar(50) NOT NULL DEFAULT '',
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `star` int(2) NOT NULL DEFAULT 5,
  `message` text DEFAULT NULL,
  `star_type` int(2) NOT NULL DEFAULT 7,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: ratings_client
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ratings_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(50) NOT NULL DEFAULT '',
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `clientid` varchar(50) NOT NULL DEFAULT '',
  `star` int(2) NOT NULL DEFAULT 5,
  `message` text DEFAULT NULL,
  `star_type` int(2) NOT NULL DEFAULT 7,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: file
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(50) NOT NULL DEFAULT '',
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `fileupload` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `extension` varchar(20) NOT NULL DEFAULT '',
  `size` varchar(50) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: transactions
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membershipid` varchar(50) NOT NULL DEFAULT '',
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `paymentid` varchar(100) NOT NULL DEFAULT '',
  `hash` varchar(255) NOT NULL DEFAULT '',
  `payment` decimal(10,2) NOT NULL DEFAULT 0.00,
  `complete` int(1) NOT NULL DEFAULT 1,
  `transaction_type` varchar(50) NOT NULL DEFAULT '',
  `paypal` varchar(255) DEFAULT '',
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: withdraw
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `confirm_email` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT 'paypal',
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: pay_freelancer
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pay_freelancer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `amount_sum` decimal(10,2) NOT NULL DEFAULT 0.00,
  `month_time` varchar(50) NOT NULL DEFAULT '',
  `complete` int(1) NOT NULL DEFAULT 0,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: payfreelancers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payfreelancers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `month` varchar(50) NOT NULL DEFAULT '',
  `complete` int(1) NOT NULL DEFAULT 0,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: trash
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(50) NOT NULL DEFAULT '',
  `userid` varchar(50) NOT NULL DEFAULT '',
  `delete_remove` int(1) NOT NULL DEFAULT 1,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: bugs
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(50) NOT NULL DEFAULT '',
  `reporter` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `priority` varchar(50) DEFAULT 'Low',
  `severity` varchar(50) DEFAULT 'Minor',
  `reproducibility` varchar(50) DEFAULT 'Always',
  `fixed` int(1) NOT NULL DEFAULT 0,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: link
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(50) NOT NULL DEFAULT '',
  `freelancerid` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: report
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(50) NOT NULL DEFAULT '',
  `by_userid` varchar(50) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: star
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(50) NOT NULL DEFAULT '',
  `userid` varchar(50) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
