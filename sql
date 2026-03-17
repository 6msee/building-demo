CREATE DATABASE admin_system CHARACTER SET utf8mb4;
USE admin_system;

-- =========================
-- USERS (ผู้ดูแลระบบ)
-- =========================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(255),
    email VARCHAR(255),
    role ENUM('superadmin','admin','editor') DEFAULT 'editor',
    status TINYINT DEFAULT 1,
    last_login DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- CATEGORIES (หมวดหมู่กลาง)
-- =========================
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type ENUM('news','documents','activities') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- NEWS (ข่าว)
-- =========================
CREATE TABLE news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category_id INT,
    detail TEXT,
    cover VARCHAR(255),
    views INT DEFAULT 0,
    author_id INT,
    status TINYINT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
    FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL
);

-- รูปข่าวหลายรูป
CREATE TABLE news_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    news_id INT NOT NULL,
    image VARCHAR(255),
    FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE
);

-- =========================
-- DOCUMENTS (เอกสาร)
-- =========================
CREATE TABLE documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    detail TEXT,
    category_id INT,
    file_path VARCHAR(255),
    downloads INT DEFAULT 0,
    author_id INT,
    status TINYINT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
    FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL
);

-- =========================
-- ACTIVITIES (กิจกรรม)
-- =========================
CREATE TABLE activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    cover VARCHAR(255),
    detail TEXT,
    start_date DATE,
    end_date DATE,
    organizer VARCHAR(255),
    views INT DEFAULT 0,
    status TINYINT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- STAFF (บุคลากร)
-- =========================
CREATE TABLE staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(50),
    department VARCHAR(100),
    image VARCHAR(255),
    detail TEXT,
    position VARCHAR(255),
    status TINYINT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- VISITOR LOG (สถิติผู้เข้าชม)
-- =========================
CREATE TABLE visitor_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ip_address VARCHAR(100),
    page VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);