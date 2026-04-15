INSERT INTO users ("name", email, password_hash, registration_date, "role", status, phone) VALUES
('Иван Петров', 'ivan@example.com', 'hash_ivan', '2025-01-15', 'user', 'active', '+79161234567'),
('Мария Смирнова', 'maria@example.com', 'hash_maria', '2025-02-01', 'user', 'active', '+79261234568'),
('Алексей Иванов', 'alexey@example.com', 'hash_alexey', '2025-02-10', 'content_manager', 'active', '+79361234569'),
('Ольга Кузнецова', 'olga@example.com', 'hash_olga', '2025-03-05', 'admin', 'active', '+79461234570'),
('Дмитрий Враженко', 'student@rtu.ru', 'hash_student', '2025-03-20', 'ml_engineer', 'active', '+79561234571'),
('Елена Соколова', 'elena@example.com', 'hash_elena', '2025-04-01', 'user', 'active', '+79661234572'),
('Сергей Волков', 'sergey@example.com', 'hash_sergey', '2025-04-10', 'user', 'blocked', '+79761234573'),
('Анна Морозова', 'anna@example.com', 'hash_anna', '2025-04-15', 'supervisor', 'active', '+79861234574'),
('Павел Новиков', 'pavel@example.com', 'hash_pavel', '2025-05-01', 'user', 'active', '+79961234575'),
('Татьяна Зайцева', 'tatiana@example.com', 'hash_tatiana', '2025-05-10', 'user', 'active', '+79161234576'),
('Михаил Орлов', 'mikhail@example.com', 'hash_mikhail', '2025-06-01', 'content_manager', 'active', '+79261234577');

INSERT INTO sessions (user_id, start_time, end_time, device, browser, context) VALUES
(1, '2026-04-01 09:00:00', '2026-04-01 09:30:00', 'Windows PC', 'Chrome 120', '{"last_query": "изучение Python"}'),
(1, '2026-04-02 14:00:00', NULL, 'iPhone', 'Safari', '{"last_query": "книги по машинному обучению"}'),
(2, '2026-04-01 10:00:00', '2026-04-01 10:45:00', 'MacBook', 'Firefox', '{"last_query": "аудиокниги по психологии"}'),
(3, '2026-04-02 08:00:00', '2026-04-02 12:00:00', 'Windows PC', 'Edge', '{"filters": {"category": "бизнес"}}'),
(4, '2026-04-03 11:00:00', '2026-04-03 11:20:00', 'Android', 'Chrome Mobile', '{}'),
(5, '2026-04-01 13:00:00', NULL, 'Linux', 'Chrome', '{"debug": true}'),
(6, '2026-04-04 16:00:00', '2026-04-04 17:00:00', 'iPad', 'Safari', '{"last_query": "курсы по Go"}'),
(7, '2026-04-05 19:00:00', '2026-04-05 19:15:00', 'Windows PC', 'Opera', '{}'),
(8, '2026-04-06 09:00:00', '2026-04-06 09:30:00', 'MacBook', 'Safari', '{}'),
(9, '2026-04-07 21:00:00', '2026-04-07 22:00:00', 'Android', 'Samsung Internet', '{"last_query": "подкасты про технологии"}'),
(10, '2026-04-08 07:30:00', NULL, 'iPhone', 'Safari', '{}'),
(1, '2026-04-09 12:00:00', '2026-04-09 13:00:00', 'Windows PC', 'Chrome', '{"last_query": "видеоуроки по SQL"}');

INSERT INTO datasets ("name", description, record_count, format, file_path, status, data_source) VALUES
('Queries v1', 'Начальный набор размеченных запросов', 1500, 'CSV', '/data/queries_v1.csv', 'ready', 'internal'),
('User logs March', 'Обезличенные логи за март 2026', 25000, 'JSON', '/data/logs_2026_03.json', 'processing', 'logs'),
('External Queries', 'Запросы из открытых источников', 5000, 'CSV', '/data/external_queries.csv', 'ready', 'external'),
('RuBERT pretrain', 'Предобученный корпус русского языка', 1000000, 'BIN', '/models/rubert_pretrain.bin', 'ready', 'public'),
('Manual labels', 'Ручная разметка 200 запросов', 200, 'CSV', '/data/manual_labels.csv', 'ready', 'internal'),
('Feedback data', 'Данные обратной связи от пользователей', 450, 'JSON', '/data/feedback.json', 'pending', 'feedback'),
('Test dataset', 'Тестовый набор для валидации', 300, 'CSV', '/data/test_set.csv', 'ready', 'internal'),
('Train dataset large', 'Большой тренировочный набор', 8000, 'Parquet', '/data/train_large.parquet', 'ready', 'internal'),
('External News', 'Заголовки новостей для расширения словаря', 12000, 'TXT', '/data/news_titles.txt', 'ready', 'external'),
('Domain specific', 'Запросы в предметной области IT', 2200, 'CSV', '/data/domain_it.csv', 'ready', 'internal'),
('Validation set', 'Валидационная выборка', 500, 'CSV', '/data/val_set.csv', 'ready', 'internal');

INSERT INTO ml_models (training_dataset_id, "name", "version", training_date, accuracy, model_path, status, hyperparameters, model_size) VALUES
(1, 'RuBERT-tiny-intent', '1.0.0', '2026-03-01 10:00:00', 0.8542, '/models/rubert_tiny_intent_v1.pth', 'active', '{"learning_rate": 2e-5, "epochs": 3, "batch_size": 16}', 45000000),
(2, 'RuBERT-tiny-intent', '1.1.0', '2026-03-15 14:30:00', 0.8715, '/models/rubert_tiny_intent_v1.1.pth', 'active', '{"learning_rate": 1e-5, "epochs": 5, "batch_size": 16}', 45000000),
(3, 'DistilRuBERT', '2.0.0', '2026-02-20 09:00:00', 0.8920, '/models/distilrubert_v2.pth', 'active', '{"learning_rate": 3e-5, "epochs": 4, "batch_size": 32}', 67000000),
(4, 'LLaMA-7B-finetuned', '0.9.0', '2026-04-01 08:00:00', 0.9125, '/models/llama7b_qa.pth', 'testing', '{"learning_rate": 5e-6, "epochs": 2, "batch_size": 8}', 7000000000),
(NULL, 'Baseline TF-IDF', '1.0.0', '2026-01-10 12:00:00', 0.7200, '/models/tfidf_baseline.pkl', 'archived', '{"ngram_range": [1,2]}', 1200000),
(5, 'Intent classifier CNN', '1.2.0', '2026-03-20 11:00:00', 0.8350, '/models/cnn_intent.pth', 'inactive', '{"filters": 128, "kernel_size": 3}', 2500000),
(6, 'Sentiment model', '1.0.0', '2026-02-01 10:00:00', 0.7810, '/models/sentiment_v1.pth', 'active', '{"learning_rate": 2e-5}', 45000000),
(7, 'Entity recognition', '1.0.1', '2026-03-10 15:00:00', 0.9230, '/models/ner_rubert.pth', 'active', '{"max_length": 256}', 45000000),
(8, 'Next-query predictor', '0.5.0', '2026-04-05 09:00:00', 0.6510, '/models/next_query_lstm.pth', 'development', '{"hidden_size": 256, "num_layers": 2}', 3500000),
(1, 'RuBERT-base', '1.0.0', '2026-02-15 16:00:00', 0.8810, '/models/rubert_base_intent.pth', 'active', '{"learning_rate": 2e-5, "epochs": 3}', 110000000),
(9, 'FastText embeddings', '1.0.0', '2026-01-20 10:00:00', 0.7600, '/models/fasttext_ru.bin', 'active', '{"dim": 300}', 800000000);

INSERT INTO requests (session_id, processed_by_model_id, "text", "time", structured_params, status, "source", ip_address) VALUES
(1, 1, 'хочу изучить Python', '2026-04-01 09:05:00', '{"topic": "Python", "intent": "learn", "level": "beginner"}', 'processed', 'web', '192.168.1.10'),
(1, 1, 'книги по машинному обучению для начинающих', '2026-04-01 09:10:00', '{"topic": "machine learning", "intent": "find", "level": "beginner", "type": "book"}', 'processed', 'web', '192.168.1.10'),
(2, 2, 'курсы по Go для профессионалов', '2026-04-02 14:05:00', '{"topic": "Go", "intent": "find", "level": "advanced", "type": "course"}', 'processed', 'mobile', '10.0.0.23'),
(3, 3, 'аудиокниги по психологии отношений', '2026-04-01 10:10:00', '{"topic": "psychology", "intent": "find", "type": "audiobook"}', 'processed', 'web', '172.16.0.5'),
(4, 4, 'как управлять командой в стартапе', '2026-04-03 11:05:00', '{"topic": "management", "intent": "learn", "context": "startup"}', 'processed', 'web', '192.168.2.50'),
(5, 1, 'продвинутый Python для анализа данных', '2026-04-01 13:10:00', '{"topic": "Python", "intent": "learn", "level": "advanced", "domain": "data analysis"}', 'processed', 'web', '10.1.1.8'),
(6, 7, 'где скачать книгу Чистый код', '2026-04-04 16:15:00', '{"topic": "Clean Code", "intent": "download", "type": "book"}', 'processed', 'mobile', '172.20.0.12'),
(7, 2, 'видео про микросервисы', '2026-04-05 19:05:00', '{"topic": "microservices", "intent": "find", "type": "video"}', 'failed', 'web', '192.168.3.77'),
(8, 9, 'как стать data scientist с нуля', '2026-04-06 09:10:00', '{"topic": "data science", "intent": "learn", "level": "beginner"}', 'processed', 'web', '10.0.1.100'),
(9, 8, 'подкасты про IT и стартапы', '2026-04-07 21:15:00', '{"topic": "IT", "intent": "find", "type": "podcast"}', 'processed', 'mobile', '192.168.4.55'),
(10, 1, 'SQL для начинающих', '2026-04-08 07:45:00', '{"topic": "SQL", "intent": "learn", "level": "beginner"}', 'processed', 'web', '10.0.2.200'),
(12, 3, 'Python Django разработка', '2026-04-09 12:10:00', '{"topic": "Django", "intent": "learn", "framework": "Django"}', 'processed', 'web', '192.168.1.11');

INSERT INTO history (user_id, action_type, "time", details, duration) VALUES
(1, 'search', '2026-04-01 09:05:00', 'query: "хочу изучить Python"', 2),
(1, 'view_content', '2026-04-01 09:12:00', 'content_id: 101 (Python для начинающих)', 120),
(2, 'search', '2026-04-01 10:10:00', 'query: "аудиокниги по психологии"', 3),
(3, 'login', '2026-04-02 08:00:00', 'from ip 192.168.1.20', NULL),
(3, 'create_purchase_request', '2026-04-02 09:30:00', 'request_id: 5001 for book "Чистый код"', NULL),
(4, 'search', '2026-04-03 11:05:00', 'query: "управление командой"', 1),
(5, 'model_training_start', '2026-04-01 13:30:00', 'model_id: 2, dataset_id: 2', NULL),
(6, 'search', '2026-04-04 16:15:00', 'query: "скачать книгу Чистый код"', 2),
(6, 'download', '2026-04-04 16:30:00', 'content_id: 105 (Clean Code pdf)', 10),
(7, 'search', '2026-04-05 19:05:00', 'query: "микросервисы"', 1),
(9, 'listen_podcast', '2026-04-07 21:30:00', 'episode_id: 301, duration: 1800', 1800),
(10, 'search', '2026-04-08 07:45:00', 'query: "SQL для начинающих"', 2),
(1, 'add_favorite', '2026-04-09 12:30:00', 'content_id: 101', NULL);

INSERT INTO logs (user_id, "time", "level", "message", "source", details) VALUES
(1, '2026-04-01 09:05:00', 'INFO', 'User search request received', 'api-gateway', '{"endpoint": "/search", "method": "POST"}'),
(NULL, '2026-04-01 09:05:01', 'DEBUG', 'NLP model inference started', 'nlp-service', '{"model_id": 1, "input_length": 25}'),
(1, '2026-04-01 09:05:02', 'INFO', 'Search completed', 'search-service', '{"results_count": 12, "time_ms": 180}'),
(5, '2026-04-01 13:30:00', 'INFO', 'Model training job submitted', 'ml-orchestrator', '{"job_id": "train-20260401-001", "dataset_id": 2}'),
(5, '2026-04-01 14:00:00', 'ERROR', 'Training job failed: out of memory', 'ml-orchestrator', '{"error": "CUDA out of memory", "gpu": "Tesla T4"}'),
(3, '2026-04-02 09:30:00', 'WARN', 'Purchase request exceeds budget limit', 'purchase-service', '{"request_id": 5001, "amount": 1500, "limit": 1000}'),
(NULL, '2026-04-04 16:15:00', 'INFO', 'External API call to book store', 'external-adapter', '{"api": "litres", "response_time_ms": 320}'),
(7, '2026-04-05 19:05:01', 'ERROR', 'Request processing failed: model timeout', 'api-gateway', '{"model_id": 2, "timeout": 2000}'),
(8, '2026-04-06 09:10:00', 'INFO', 'User registration completed', 'auth-service', '{"user_id": 11, "email": "newuser@example.com"}'),
(NULL, '2026-04-07 21:00:00', 'INFO', 'Daily backup started', 'backup-service', '{"type": "full", "size_gb": 45}'),
(4, '2026-04-08 07:45:00', 'DEBUG', 'Cache hit for query "SQL"', 'search-service', '{"cache_key": "sql:beginner", "hits": 3}'),
(NULL, '2026-04-09 12:00:00', 'WARN', 'High CPU usage on database server', 'monitoring', '{"cpu_percent": 95, "duration_sec": 60}');

INSERT INTO notifications (user_id, "type", title, "message", "date", is_read, "link") VALUES
(1, 'new_content', 'Новые курсы по Python', 'По вашему запросу "Python для начинающих" добавлено 3 новых курса.', '2026-04-01 10:00:00', false, '/courses/python'),
(1, 'recommendation', 'Вам может понравиться', 'Книга "Грокаем алгоритмы"', '2026-04-02 08:00:00', true, '/content/201'),
(2, 'purchase_status', 'Заявка на закупку', 'Ваша заявка на книгу "Психология влияния" одобрена.', '2026-04-01 11:30:00', false, '/purchases/5001'),
(3, 'task_assigned', 'Новая задача', 'Вам назначена задача на модерацию 5 новых отзывов.', '2026-04-02 09:00:00', false, '/moderation'),
(5, 'model_trained', 'Модель обучена', 'Дообучение модели RuBERT-tiny-intent v1.1 завершено. Точность: 87.15%', '2026-04-01 15:00:00', true, '/ml/models/2'),
(6, 'new_content', 'Обновление подкастов', 'Новый выпуск подкаста "Люди и код"', '2026-04-04 09:00:00', false, '/podcasts/305'),
(8, 'system', 'Плановое обслуживание', 'Завтра с 02:00 до 04:00 возможны перебои в работе.', '2026-04-05 18:00:00', true, NULL),
(9, 'newsletter', 'Дайджест за неделю', 'Самые популярные материалы: Python, микросервисы, управление.', '2026-04-07 20:00:00', false, '/digest/week15'),
(10, 'welcome', 'Добро пожаловать!', 'Спасибо за регистрацию в системе "Семантический подборщик".', '2026-04-08 07:35:00', false, '/help'),
(4, 'alert', 'Превышение лимита запросов', 'Количество запросов к API превысило 80% дневного лимита.', '2026-04-09 14:00:00', false, '/admin/limits'),
(1, 'comment_reply', 'Ответ на ваш отзыв', 'Контент-менеджер ответил на ваш отзыв о курсе Python.', '2026-04-10 09:00:00', false, '/content/101#comments');

INSERT INTO "content" (title, "type", authors, description, "level", file_url, added_date, "language", avg_rating, view_count) VALUES
('Программирование на Python для начинающих', 'book', 'Марк Лутц', 'Изучение Python с нуля', 'beginner', '/files/python_book.pdf', '2025-06-01', 'ru', 4.5, 1250),
('Машинное обучение: алгоритмы и практика', 'video', 'Андрей Себрант', 'Курс по основам ML', 'intermediate', '/videos/ml_course.mp4', '2025-07-12', 'ru', 4.8, 3420),
('Аудиокнига "Чистый код"', 'audio', 'Роберт Мартин', 'Принципы написания качественного кода', 'advanced', '/audio/clean_code.mp3', '2025-05-23', 'ru', 4.9, 890),
('Основы SQL и реляционных баз данных', 'course', 'Иван Петров', 'Интерактивный курс по SQL', 'beginner', '/courses/sql_basics', '2025-08-01', 'ru', 4.3, 560),
('Deep Learning with PyTorch', 'book', 'Eli Stevens et al.', 'Глубокое обучение на PyTorch', 'advanced', '/files/dl_pytorch.pdf', '2025-09-10', 'en', 4.7, 320),
('Психология влияния', 'audio', 'Роберт Чалдини', 'Классика социальной психологии', 'beginner', '/audio/influence.mp3', '2025-04-15', 'ru', 4.6, 2150),
('React для профессионалов', 'video', 'Максим Иванов', 'Продвинутые техники React', 'advanced', '/videos/react_pro.mp4', '2025-10-01', 'ru', 4.4, 780),
('Английский для IT', 'course', 'LinguaLeo', 'Курс технического английского', 'intermediate', '/courses/english_it', '2025-03-20', 'ru', 4.2, 1430),
('Микросервисы: паттерны и практики', 'book', 'Крис Ричардсон', 'Архитектура микросервисов', 'advanced', '/files/microservices.pdf', '2025-11-05', 'ru', 4.9, 290),
('Подкаст "Люди и код" выпуск 45', 'podcast', 'Алексей Котов', 'Интервью с разработчиками', 'beginner', '/podcasts/people_and_code_45.mp3', '2025-12-01', 'ru', 4.0, 520),
('Data Science с нуля', 'book', 'Джоэл Грас', 'Введение в Data Science на Python', 'beginner', '/files/data_science.pdf', '2025-02-14', 'ru', 4.5, 980),
('Архитектура компьютера', 'video', 'Эндрю Таненбаум', 'Лекции по архитектуре ЭВМ', 'intermediate', '/videos/comp_arch.mp4', '2025-01-10', 'ru', 4.1, 650);

INSERT INTO categories (parent_category_id, "name", description, creation_date, icon) VALUES
(NULL, 'Программирование', 'Языки и технологии разработки', '2025-01-01', '/icons/programming.png'),
(1, 'Python', 'Язык Python и его экосистема', '2025-01-02', '/icons/python.png'),
(1, 'Базы данных', 'SQL, NoSQL, проектирование', '2025-01-03', '/icons/database.png'),
(NULL, 'Наука о данных', 'Data Science, ML, AI', '2025-01-04', '/icons/data_science.png'),
(4, 'Машинное обучение', 'Алгоритмы и библиотеки ML', '2025-01-05', '/icons/ml.png'),
(4, 'Глубокое обучение', 'Нейронные сети и DL', '2025-01-06', '/icons/deeplearning.png'),
(NULL, 'Бизнес и психология', 'Книги по саморазвитию и бизнесу', '2025-01-07', '/icons/business.png'),
(7, 'Психология', 'Научная и популярная психология', '2025-01-08', '/icons/psychology.png'),
(NULL, 'Иностранные языки', 'Курсы и материалы по языкам', '2025-01-09', '/icons/languages.png'),
(9, 'Английский', 'Английский для разных целей', '2025-01-10', '/icons/english.png'),
(NULL, 'Аудио', 'Аудиокниги и подкасты', '2025-01-11', '/icons/audio.png'),
(1, 'JavaScript', 'Язык JavaScript и фреймворки', '2025-02-01', '/icons/js.png');

INSERT INTO content_categories (content_id, category_id) VALUES
(1, 2),   -- Python книга -> Python
(1, 1),   -- Python книга -> Программирование
(2, 5),   -- ML видео -> Машинное обучение
(2, 4),   -- ML видео -> Наука о данных
(3, 1),   -- Чистый код -> Программирование
(4, 3),   -- SQL курс -> Базы данных
(5, 6),   -- Deep Learning книга -> Глубокое обучение
(6, 8),   -- Психология влияния -> Психология
(7, 1),   -- React видео -> Программирование
(7, 12),  -- React видео -> JavaScript
(8, 10),  -- Английский курс -> Английский
(9, 1),   -- Микросервисы -> Программирование
(10, 11), -- Подкаст -> Аудио
(11, 4),  -- Data Science книга -> Наука о данных
(12, 1);  -- Архитектура компьютера -> Программирование

INSERT INTO licenses ("type", rights_holder, start_date, end_date, "cost", restrictions, terms) VALUES
('Exclusive', 'Издательство "Питер"', '2025-01-01', '2027-01-01', 15000.00, 'Только для подписчиков', 'Полный доступ к книгам издательства'),
('Non-exclusive', 'ЛитРес', '2025-02-01', '2026-02-01', 5000.00, 'Не более 100 скачиваний в месяц', 'Аудиокниги по подписке'),
('Creative Commons', 'Автор', '2025-03-01', NULL, 0.00, 'С указанием авторства', 'Свободное распространение'),
('Educational', 'Coursera', '2025-04-01', '2026-04-01', 25000.00, 'Только для зарегистрированных студентов', 'Доступ к курсам платформы'),
('Corporate', 'Skillbox', '2025-05-01', '2026-05-01', 50000.00, 'До 1000 сотрудников', 'Корпоративная подписка'),
('Freeware', 'Open Source Community', '2025-06-01', NULL, 0.00, 'Без ограничений', 'Свободное ПО'),
('Trial', 'Udemy', '2025-07-01', '2025-08-01', 1000.00, 'Пробный период 1 месяц', 'Ограниченный доступ'),
('Subscription', 'OReilly', '2025-08-01', '2026-08-01', 30000.00, 'Ежемесячная оплата', 'Полный каталог OReilly'),
('Individual', 'Автор', '2025-09-01', NULL, 500.00, 'Один пользователь', 'Пожизненная лицензия'),
('Academic', 'MIT Press', '2025-10-01', '2027-10-01', 8000.00, 'Только для вузов', 'Академическая подписка'),
('Developer', 'JetBrains', '2025-11-01', '2026-11-01', 12000.00, 'Для индивидуальных разработчиков', 'Доступ к инструментам'),
('Enterprise', 'Microsoft', '2025-12-01', '2027-12-01', 100000.00, 'Для организаций', 'Корпоративный доступ');

INSERT INTO content_licenses (content_id, license_id) VALUES
(1, 1), (2, 4), (3, 2), (4, 3), (5, 1), (6, 2), (7, 8), (8, 4), (9, 1), (10, 6), (11, 9), (12, 3);

INSERT INTO reviews (user_id, content_id, rating, "text", "date", moderation_status, usefulness, complaints) VALUES
(1, 1, 5, 'Отличная книга для начинающих, всё понятно.', '2025-06-15 10:30:00', 'approved', 12, 0),
(2, 2, 5, 'Курс очень понравился, много практики.', '2025-07-20 14:20:00', 'approved', 8, 1),
(3, 3, 4, 'Хорошая озвучка, но хотелось бы больше примеров.', '2025-06-01 09:15:00', 'approved', 5, 2),
(4, 4, 4, 'Базовый курс, всё по делу.', '2025-08-10 16:40:00', 'approved', 6, 0),
(5, 5, 5, 'Превосходная книга, рекомендую всем DS-специалистам.', '2025-09-20 11:05:00', 'approved', 9, 0),
(6, 6, 3, 'Книга неплохая, но несколько устарела.', '2025-05-01 13:25:00', 'approved', 3, 1),
(7, 7, 5, 'Лучший курс по React, который я видел.', '2025-10-15 18:00:00', 'approved', 15, 0),
(8, 8, 4, 'Полезно для расширения словарного запаса.', '2025-04-10 08:30:00', 'approved', 7, 0),
(9, 9, 5, 'Книга-библия по микросервисам.', '2025-11-20 12:10:00', 'approved', 11, 0),
(10, 10, 4, 'Интересный выпуск, жду следующих.', '2025-12-05 17:45:00', 'approved', 4, 0),
(1, 11, 4, 'Неплохое введение в DS.', '2025-03-01 10:00:00', 'approved', 5, 0),
(2, 12, 3, 'Слишком академично, тяжело воспринимать.', '2025-02-15 11:20:00', 'approved', 2, 3);

INSERT INTO favorites (user_id, content_id, added_date, note, tags, priority) VALUES
(1, 1, '2025-06-16 09:00:00', 'Изучаю Python', 'python, book', 1),
(1, 5, '2025-09-21 10:00:00', 'Глубокое обучение', 'dl, pytorch', 2),
(2, 2, '2025-07-21 11:30:00', 'Машинное обучение', 'ml, course', 1),
(3, 3, '2025-06-02 14:00:00', 'Для работы', 'clean code, audio', 1),
(4, 4, '2025-08-11 08:00:00', 'Повторение SQL', 'sql, database', 2),
(5, 5, '2025-09-22 09:15:00', 'Для диссертации', 'deep learning', 1),
(6, 7, '2025-10-16 20:00:00', 'React advanced', 'react, frontend', 1),
(7, 7, '2025-10-17 12:00:00', 'Очень полезно', 'react', 2),
(8, 8, '2025-04-11 10:00:00', 'Английский для собеседований', 'english, it', 1),
(9, 9, '2025-11-21 15:20:00', 'Микросервисы', 'microservices, architecture', 1),
(10, 10, '2025-12-06 19:00:00', 'Любимый подкаст', 'podcast, dev', 1),
(1, 11, '2025-03-02 09:00:00', 'Data Science intro', 'data science, book', 3);

INSERT INTO external_sources ("name", base_url, api_key, description, status, connection_params, data_format) VALUES
('ЛитРес API', 'https://api.litres.ru', 'litres_key_123', 'Электронные и аудиокниги', 'active', '{"timeout": 30, "rate_limit": 100}', 'json'),
('Coursera Partner', 'https://api.coursera.org', 'coursera_partner_456', 'Образовательные курсы', 'active', '{"auth_type": "oauth2"}', 'json'),
('OReilly Online', 'https://api.oreilly.com', 'oreilly_789', 'Техническая литература', 'active', '{"retries": 3}', 'xml'),
('YouTube Education', 'https://www.googleapis.com/youtube/v3', 'yt_edu_key', 'Образовательные видео', 'active', '{"quota": 10000}', 'json'),
('Audible API', 'https://api.audible.com', 'audible_key_321', 'Аудиокниги', 'active', '{"marketplace": "RU"}', 'json'),
('Stepik API', 'https://stepik.org/api', NULL, 'Онлайн-курсы (публичный доступ)', 'active', '{}', 'json'),
('Национальная электронная библиотека', 'https://rusneb.ru/api', 'neb_key_555', 'Книги и документы', 'inactive', '{"auth_type": "basic"}', 'json'),
('Packt Publishing', 'https://api.packt.com', 'packt_key_999', 'Книги по IT', 'active', '{}', 'json'),
('MIT OpenCourseWare', 'https://ocw.mit.edu/api', NULL, 'Открытые курсы MIT', 'active', '{}', 'xml'),
('SpringerLink', 'https://api.springernature.com', 'springer_123', 'Научные публикации', 'active', '{"journal_limit": 500}', 'json'),
('Safari Books Online', 'https://api.safaribooksonline.com', 'safari_legacy', 'Устаревший API (заменён на OReilly)', 'archived', '{}', 'json');

INSERT INTO purchase_requests (requester_id, content_id, external_source_id, creation_date, status, budget, "comments", suggested_content_text, justification, priority) VALUES
(1, NULL, 1, '2026-04-01 10:00:00', 'pending', 1500.00, 'Книга нужна для команды разработки', 'Clean Code: A Handbook of Agile Software Craftsmanship', 'Высокий спрос среди разработчиков', 2),
(2, 3, 5, '2026-04-02 11:30:00', 'approved', 800.00, NULL, 'Аудиокнига "Чистый код"', 'Расширение аудиокаталога', 3),
(3, NULL, 1, '2026-04-03 09:15:00', 'pending', 2500.00, 'Для библиотеки компании', 'Design Patterns: Elements of Reusable Object-Oriented Software', 'Классика, рекомендуется для архитекторов', 1),
(4, NULL, 6, '2026-04-04 14:20:00', 'rejected', 0.00, 'Бесплатный курс, закупка не требуется', 'Курс "Основы Python" на Stepik', 'Достаточно внутренних материалов', 1),
(5, 5, 3, '2026-04-05 08:45:00', 'approved', 1200.00, NULL, 'Deep Learning with PyTorch (печатное издание)', 'Для отдела Data Science', 2),
(6, NULL, 2, '2026-04-06 16:10:00', 'approved', 3500.00, 'Корпоративная лицензия', 'Machine Learning Specialization (Andrew Ng)', 'Повышение квалификации сотрудников', 2),
(7, 7, 4, '2026-04-07 12:00:00', 'pending', 600.00, 'Видеокурс по React', 'React - The Complete Guide (incl Hooks, React Router, Redux)', 'Актуально для фронтенд-команды', 1),
(8, NULL, 8, '2026-04-08 10:30:00', 'approved', 900.00, NULL, 'Python Crash Course, 2nd Edition', 'Для новых сотрудников', 2),
(9, 9, 3, '2026-04-09 13:45:00', 'pending', 1800.00, NULL, 'Building Microservices, 2nd Edition', 'Обновление библиотеки архитектуры', 2),
(10, NULL, 7, '2026-04-10 09:00:00', 'rejected', 5000.00, 'Слишком высокая стоимость', 'Редкое издание "История вычислительной техники"', 'Не соответствует профилю', 1),
(11, 11, 8, '2026-04-11 11:20:00', 'approved', 700.00, 'Электронная версия', 'Data Science from Scratch, 2nd Edition', 'Базовый учебник', 3),
(1, 12, 9, '2026-04-12 15:30:00', 'pending', 0.00, 'Открытый курс', 'Computer System Architecture (MIT OCW)', 'Бесплатный ресурс, требуется интеграция', 1);
