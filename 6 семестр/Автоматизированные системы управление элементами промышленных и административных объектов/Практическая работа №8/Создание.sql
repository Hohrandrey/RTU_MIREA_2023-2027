DROP TABLE IF EXISTS requests CASCADE;
DROP TABLE IF EXISTS sessions CASCADE;
DROP TABLE IF EXISTS history CASCADE;
DROP TABLE IF EXISTS logs CASCADE;
DROP TABLE IF EXISTS notifications CASCADE;
DROP TABLE IF EXISTS ml_models CASCADE;
DROP TABLE IF EXISTS datasets CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS favorites CASCADE;
DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS content_licenses CASCADE;
DROP TABLE IF EXISTS licenses CASCADE;
DROP TABLE IF EXISTS content_categories CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS content CASCADE;
DROP TABLE IF EXISTS purchase_requests CASCADE;
DROP TABLE IF EXISTS external_sources CASCADE;

CREATE TABLE users (
    id                BIGSERIAL PRIMARY KEY,
    name              VARCHAR(100) NOT NULL,
    email             VARCHAR(255) NOT NULL UNIQUE,
    password_hash     VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE,
    role              VARCHAR(50) NOT NULL DEFAULT 'user',
    status            VARCHAR(50) NOT NULL DEFAULT 'active',
    phone             VARCHAR(20) UNIQUE,
    created_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sessions (
    id         BIGSERIAL PRIMARY KEY,
    user_id    BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    start_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_time   TIMESTAMP,
    context    TEXT,
    device     VARCHAR(100),
    browser    VARCHAR(100),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE datasets (
    id            BIGSERIAL PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    description   TEXT,
    record_count  INTEGER DEFAULT 0,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    format        VARCHAR(50) NOT NULL,
    file_path     TEXT NOT NULL,
    status        VARCHAR(50) NOT NULL DEFAULT 'pending',
    data_source   VARCHAR(255),
    created_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ml_models (
    id                  BIGSERIAL PRIMARY KEY,
    training_dataset_id BIGINT REFERENCES datasets(id) ON DELETE SET NULL,
    name                VARCHAR(100) NOT NULL,
    version             VARCHAR(50) NOT NULL,
    training_date       TIMESTAMP,
    accuracy            DECIMAL(5,4),
    model_path          TEXT NOT NULL,
    status              VARCHAR(50) NOT NULL DEFAULT 'inactive',
    hyperparameters     JSONB,
    model_size          BIGINT,
    created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE requests (
    id                    BIGSERIAL PRIMARY KEY,
    session_id            BIGINT NOT NULL REFERENCES sessions(id) ON DELETE CASCADE,
    processed_by_model_id BIGINT REFERENCES ml_models(id) ON DELETE SET NULL,
    text                  TEXT NOT NULL,
    time                  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    structured_params     JSONB,
    status                VARCHAR(50) NOT NULL DEFAULT 'pending',
    source                VARCHAR(50) NOT NULL DEFAULT 'web',
    ip_address            INET,
    created_at            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE history (
    id          BIGSERIAL PRIMARY KEY,
    user_id     BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    action_type VARCHAR(50) NOT NULL,
    time        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    details     TEXT,
    duration    INTEGER, -- длительность в секундах, если применимо
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE logs (
    id         BIGSERIAL PRIMARY KEY,
    user_id    BIGINT REFERENCES users(id) ON DELETE SET NULL,
    time       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    level      VARCHAR(20) NOT NULL,
    message    TEXT NOT NULL,
    source     VARCHAR(100) NOT NULL,
    details    JSONB,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE notifications (
    id         BIGSERIAL PRIMARY KEY,
    user_id    BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    type       VARCHAR(50) NOT NULL,
    title      VARCHAR(255) NOT NULL,
    message    TEXT NOT NULL,
    date       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_read    BOOLEAN NOT NULL DEFAULT FALSE,
    link       VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE content (
    id          BIGSERIAL PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    type        VARCHAR(50) NOT NULL,
    authors     TEXT,
    description TEXT,
    level       VARCHAR(50),
    file_url    TEXT,
    added_date  DATE NOT NULL DEFAULT CURRENT_DATE,
    language    VARCHAR(50),
    avg_rating  DECIMAL(3,2) DEFAULT 0,
    view_count  INTEGER DEFAULT 0,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id                 BIGSERIAL PRIMARY KEY,
    parent_category_id BIGINT REFERENCES categories(id) ON DELETE CASCADE,
    name               VARCHAR(100) NOT NULL,
    description        TEXT,
    creation_date      DATE NOT NULL DEFAULT CURRENT_DATE,
    content_count      INTEGER DEFAULT 0,
    icon               VARCHAR(255),
    created_at         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE content_categories (
    content_categories_id BIGSERIAL PRIMARY KEY,
    content_id            BIGINT NOT NULL REFERENCES content(id) ON DELETE CASCADE,
    category_id           BIGINT NOT NULL REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE licenses (
    id            BIGSERIAL PRIMARY KEY,
    type          VARCHAR(100) NOT NULL,
    rights_holder VARCHAR(255),
    start_date    DATE,
    end_date      DATE,
    cost          DECIMAL(10,2),
    restrictions  TEXT,
    terms         TEXT,
    created_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE content_licenses (
    content_license_id BIGSERIAL PRIMARY KEY,
    content_id         BIGINT NOT NULL REFERENCES content(id) ON DELETE CASCADE,
    license_id         BIGINT NOT NULL REFERENCES licenses(id) ON DELETE CASCADE
);

CREATE TABLE reviews (
    id                BIGSERIAL PRIMARY KEY,
    user_id           BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    content_id        BIGINT NOT NULL REFERENCES content(id) ON DELETE CASCADE,
    rating            INTEGER CHECK (rating BETWEEN 1 AND 5),
    text              TEXT,
    date              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    moderation_status VARCHAR(50) NOT NULL DEFAULT 'pending',
    usefulness        INTEGER DEFAULT 0,
    complaints        INTEGER DEFAULT 0,
    created_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE favorites (
    id         BIGSERIAL PRIMARY KEY,
    user_id    BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    content_id BIGINT NOT NULL REFERENCES content(id) ON DELETE CASCADE,
    added_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    note       TEXT,
    tags       VARCHAR(255),
    priority   INTEGER DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE external_sources (
    id                BIGSERIAL PRIMARY KEY,
    name              VARCHAR(100) NOT NULL,
    base_url          VARCHAR(255) NOT NULL,
    api_key           VARCHAR(255),
    description       TEXT,
    status            VARCHAR(50) NOT NULL DEFAULT 'active',
    connection_params JSONB,
    data_format       VARCHAR(50) NOT NULL DEFAULT 'json',
    created_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE purchase_requests (
    id                     BIGSERIAL PRIMARY KEY,
    requester_id           BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    content_id             BIGINT REFERENCES content(id) ON DELETE SET NULL,
    external_source_id     BIGINT REFERENCES external_sources(id) ON DELETE SET NULL,
    creation_date          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status                 VARCHAR(50) NOT NULL DEFAULT 'pending',
    budget                 DECIMAL(10,2),
    comments               TEXT,
    suggested_content_text TEXT NOT NULL,
    justification          TEXT,
    priority               INTEGER DEFAULT 0,
    approved_at            TIMESTAMP,
    created_at             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
