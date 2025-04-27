-- PostgreSQL Ders Bitirme Projesi: Online Eğitim Platformu Veritabanı Şeması 

-- 1. Üyeler (Members) Tablosu
CREATE TABLE members (
    member_id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    registration_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. Eğitimler (Courses) Tablosu
CREATE TABLE courses (
    course_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    instructor VARCHAR(100)
);

-- 3. Kategoriler (Categories) Tablosu
CREATE TABLE categories (
    category_id SMALLSERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- 4. Eğitim-Kategori İlişkisi (Çok-Çok)
CREATE TABLE course_categories (
    course_category_id BIGSERIAL PRIMARY KEY,
    course_id BIGINT NOT NULL REFERENCES courses(course_id) ON DELETE CASCADE,
    category_id SMALLINT NOT NULL REFERENCES categories(category_id) ON DELETE CASCADE,
    UNIQUE (course_id, category_id)
);

-- 5. Katılımlar (Enrollments) Tablosu
CREATE TABLE enrollments (
    enrollment_id BIGSERIAL PRIMARY KEY,
    member_id BIGINT NOT NULL REFERENCES members(member_id) ON DELETE CASCADE,
    course_id BIGINT NOT NULL REFERENCES courses(course_id) ON DELETE CASCADE,
    enrollment_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (member_id, course_id)
);

-- 6. Sertifikalar (Certificates) Tablosu
CREATE TABLE certificates (
    certificate_id BIGSERIAL PRIMARY KEY,
    certificate_code VARCHAR(100) UNIQUE NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    created_date DATE DEFAULT CURRENT_DATE
);

-- 7. Sertifika Atamaları (CertificateAssignments) Tablosu
CREATE TABLE certificate_assignments (
    certificate_assignment_id BIGSERIAL PRIMARY KEY,
    member_id BIGINT NOT NULL REFERENCES members(member_id) ON DELETE CASCADE,
    certificate_id BIGINT NOT NULL REFERENCES certificates(certificate_id) ON DELETE CASCADE,
    assignment_date DATE DEFAULT CURRENT_DATE,
    UNIQUE (member_id, certificate_id)
);

-- 8. Blog Gönderileri (BlogPosts) Tablosu
CREATE TABLE blog_posts (
    post_id BIGSERIAL PRIMARY KEY,
    author_id BIGINT NOT NULL REFERENCES members(member_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);