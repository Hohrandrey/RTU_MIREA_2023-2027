DROP TABLE IF EXISTS "запросы" CASCADE;
DROP TABLE IF EXISTS "сессии" CASCADE;
DROP TABLE IF EXISTS "история" CASCADE;
DROP TABLE IF EXISTS "логи" CASCADE;
DROP TABLE IF EXISTS "уведомления" CASCADE;
DROP TABLE IF EXISTS "нейросетевые_модели" CASCADE;
DROP TABLE IF EXISTS "наборы_данных" CASCADE;
DROP TABLE IF EXISTS "пользователи" CASCADE;
DROP TABLE IF EXISTS "избранное" CASCADE;
DROP TABLE IF EXISTS "отзывы" CASCADE;
DROP TABLE IF EXISTS "связь_контента_с_лицензиями" CASCADE;
DROP TABLE IF EXISTS "лицензии" CASCADE;
DROP TABLE IF EXISTS "связь_контента_с_категориями" CASCADE;
DROP TABLE IF EXISTS "категории" CASCADE;
DROP TABLE IF EXISTS "контент" CASCADE;
DROP TABLE IF EXISTS "заявки_на_закупку" CASCADE;
DROP TABLE IF EXISTS "внешние_источники" CASCADE;


CREATE TABLE "пользователи" (
    "идентификатор"     BIGSERIAL PRIMARY KEY,
    "имя"               VARCHAR(100) NOT NULL,
    "электронная_почта" VARCHAR(255) NOT NULL UNIQUE,
    "хеш_пароля"        VARCHAR(255) NOT NULL,
    "дата_регистрации"  DATE NOT NULL DEFAULT CURRENT_DATE,
    "роль"              VARCHAR(50) NOT NULL DEFAULT 'пользователь',
    "статус"            VARCHAR(50) NOT NULL DEFAULT 'активный',
    "телефон"           VARCHAR(20) UNIQUE,
    "дата_создания"     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "дата_обновления"   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "сессии" (
    "идентификатор"              BIGSERIAL PRIMARY KEY,
    "идентификатор_пользователя" BIGINT NOT NULL REFERENCES "пользователи"("идентификатор") ON DELETE CASCADE,
    "время_начала"               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "время_окончания"            TIMESTAMP,
    "контекст"                   TEXT,
    "устройство"                 VARCHAR(100),
    "браузер"                    VARCHAR(100),
    "дата_создания"              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "наборы_данных" (
    "идентификатор"        BIGSERIAL PRIMARY KEY,
    "название"             VARCHAR(100) NOT NULL,
    "описание"             TEXT,
    "количество_записей"   INTEGER DEFAULT 0,
    "дата_создания_набора" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "формат"               VARCHAR(50) NOT NULL,
    "путь_к_файлу"         TEXT NOT NULL,
    "статус"               VARCHAR(50) NOT NULL DEFAULT 'на_рассмотрении',
    "источник_данных"      VARCHAR(255),
    "дата_создания"        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "нейросетевые_модели" (
    "идентификатор"                   BIGSERIAL PRIMARY KEY,
    "идентификатор_обучающего_набора" BIGINT REFERENCES "наборы_данных"("идентификатор") ON DELETE SET NULL,
    "название"                        VARCHAR(100) NOT NULL,
    "версия"                          VARCHAR(50) NOT NULL,
    "дата_обучения"                   TIMESTAMP,
    "точность"                        DECIMAL(5,4),
    "путь_к_модели"                   TEXT NOT NULL,
    "статус"                          VARCHAR(50) NOT NULL DEFAULT 'неактивный',
    "гиперпараметры"                  JSONB,
    "размер_модели"                   BIGINT,
    "дата_создания"                   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "запросы" (
    "идентификатор"                    BIGSERIAL PRIMARY KEY,
    "идентификатор_сессии"             BIGINT NOT NULL REFERENCES "сессии"("идентификатор") ON DELETE CASCADE,
    "идентификатор_обработавшей_модел" BIGINT REFERENCES "нейросетевые_модели"("идентификатор") ON DELETE SET NULL,
    "текст"                            TEXT NOT NULL,
    "время"                            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "структурированные_параметры"      JSONB,
    "статус"                           VARCHAR(50) NOT NULL DEFAULT 'на_рассмотрении',
    "источник_запроса"                 VARCHAR(50) NOT NULL DEFAULT 'веб',
    "ip_адрес"                         INET,
    "дата_создания"                    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "история" (
    "идентификатор"              BIGSERIAL PRIMARY KEY,
    "идентификатор_пользователя" BIGINT NOT NULL REFERENCES "пользователи"("идентификатор") ON DELETE CASCADE,
    "тип_действия"               VARCHAR(50) NOT NULL,
    "время"                      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "детали"                     TEXT,
    "длительность"               INTEGER, -- длительность в секундах, если применимо
    "дата_создания"              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "логи" (
    "идентификатор"              BIGSERIAL PRIMARY KEY,
    "идентификатор_пользователя" BIGINT REFERENCES "пользователи"("идентификатор") ON DELETE SET NULL,
    "время"                      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "уровень"                    VARCHAR(20) NOT NULL,
    "сообщение"                  TEXT NOT NULL,
    "источник"                   VARCHAR(100) NOT NULL,
    "детали"                     JSONB,
    "дата_создания"              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "уведомления" (
    "идентификатор"              BIGSERIAL PRIMARY KEY,
    "идентификатор_пользователя" BIGINT NOT NULL REFERENCES "пользователи"("идентификатор") ON DELETE CASCADE,
    "тип"                        VARCHAR(50) NOT NULL,
    "заголовок"                  VARCHAR(255) NOT NULL,
    "сообщение"                  TEXT NOT NULL,
    "дата"                       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "прочитано"                  BOOLEAN NOT NULL DEFAULT FALSE,
    "ссылка"                     VARCHAR(255),
    "дата_создания"              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "контент" (
    "идентификатор"         BIGSERIAL PRIMARY KEY,
    "название"              VARCHAR(255) NOT NULL,
    "тип"                   VARCHAR(50) NOT NULL,
    "авторы"                TEXT,
    "описание"              TEXT,
    "уровень"               VARCHAR(50),
    "сслыка_на_файл"        TEXT,
    "дата_добавления"       DATE NOT NULL DEFAULT CURRENT_DATE,
    "язык"                  VARCHAR(50),
    "средний_рейтинг"       DECIMAL(3,2) DEFAULT 0,
    "количество_просмотров" INTEGER DEFAULT 0,
    "дата_создания"         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "дата_обновления"       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "категории" (
    "идентификатор"                    BIGSERIAL PRIMARY KEY,
    "идентификатор_родительской_катег" BIGINT REFERENCES "категории"("идентификатор") ON DELETE CASCADE,
    "название"                         VARCHAR(100) NOT NULL,
    "описание"                         TEXT,
    "дата_создания_категории"          DATE NOT NULL DEFAULT CURRENT_DATE,
    "количество_контента"              INTEGER DEFAULT 0,
    "иконка"                           VARCHAR(255),
    "дата_создания"                    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "связь_контента_с_категориями" (
    "идентификатор"           BIGSERIAL PRIMARY KEY,
    "идентификатор_контента"  BIGINT NOT NULL REFERENCES "контент"("идентификатор") ON DELETE CASCADE,
    "идентификатор_категории" BIGINT NOT NULL REFERENCES "категории"("идентификатор") ON DELETE CASCADE
);

CREATE TABLE "лицензии" (
    "идентификатор"         BIGSERIAL PRIMARY KEY,
    "тип"                   VARCHAR(100) NOT NULL,
    "правообладатель"       VARCHAR(255),
    "дата_начала"           DATE,
    "дата_окончания"        DATE,
    "стоимость"             DECIMAL(10,2),
    "ограничения"           TEXT,
    "условия_использования" TEXT,
    "дата_создания"         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "связь_контента_с_лицензиями" (
    "идентификатор"          BIGSERIAL PRIMARY KEY,
    "идентификатор_контента" BIGINT NOT NULL REFERENCES "контент"("идентификатор") ON DELETE CASCADE,
    "идентификатор_лицензии" BIGINT NOT NULL REFERENCES "лицензии"("идентификатор") ON DELETE CASCADE
);

CREATE TABLE "отзывы" (
    "идентификатор"              BIGSERIAL PRIMARY KEY,
    "идентификатор_пользователя" BIGINT NOT NULL REFERENCES "пользователи"("идентификатор") ON DELETE CASCADE,
    "идентификатор_контента"     BIGINT NOT NULL REFERENCES "контент"("идентификатор") ON DELETE CASCADE,
    "оценка"                     INTEGER CHECK ("оценка" BETWEEN 1 AND 5),
    "текст"                      TEXT,
    "дата"                       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "статус_модерации"           VARCHAR(50) NOT NULL DEFAULT 'на_рассмотрении',
    "полезность"                 INTEGER DEFAULT 0,
    "жалобы"                     INTEGER DEFAULT 0,
    "дата_создания"              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "избранное" (
    "идентификатор"              BIGSERIAL PRIMARY KEY,
    "идентификатор_пользователя" BIGINT NOT NULL REFERENCES "пользователи"("идентификатор") ON DELETE CASCADE,
    "идентификатор_контента"     BIGINT NOT NULL REFERENCES "контент"("идентификатор") ON DELETE CASCADE,
    "дата_добавления"            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "заметка"                    TEXT,
    "теги"                       VARCHAR(255),
    "приоритет"                  INTEGER DEFAULT 0,
    "дата_создания"              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "внешние_источники" (
    "идентификатор"         BIGSERIAL PRIMARY KEY,
    "название"              VARCHAR(100) NOT NULL,
    "базовый_url"           VARCHAR(255) NOT NULL,
    "api_ключ"              VARCHAR(255),
    "описание"              TEXT,
    "статус"                VARCHAR(50) NOT NULL DEFAULT 'активный',
    "параметры_подключения" JSONB,
    "формат_данных"         VARCHAR(50) NOT NULL DEFAULT 'json',
    "дата_создания"         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "заявки_на_закупку" (
    "идентификатор"                    BIGSERIAL PRIMARY KEY,
    "идентификатор_инициатора"         BIGINT NOT NULL REFERENCES "пользователи"("идентификатор") ON DELETE CASCADE,
    "идентификатор_контента"           BIGINT REFERENCES "контент"("идентификатор") ON DELETE SET NULL,
    "идентификатор_внешнего_источника" BIGINT REFERENCES "внешние_источники"("идентификатор") ON DELETE SET NULL,
    "дата_создания_заявки"             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "статус"                           VARCHAR(50) NOT NULL DEFAULT 'на_рассмотрении',
    "бюджет"                           DECIMAL(10,2),
    "комментарии"                      TEXT,
    "предлагаемый_контент_текст"       TEXT NOT NULL,
    "обоснование"                      TEXT,
    "приоритет"                        INTEGER DEFAULT 0,
    "дата_утверждения"                 TIMESTAMP,
    "дата_создания"                    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
