# AI_AGENT_SKILLS_MASTER.md

## 1. 🏗️ Architecture & Orchestration (Gemini & Claude Core)
* **Dual-Model Routing:** Маршрутизация задач: сложные вычисления/кодинг — на **Claude 4.5 Sonnet/Opus**, анализ видео/книг — на **Gemini 3 Pro**.
* **Model Context Protocol (MCP):** Внедрение единого стандарта подключения данных (Filesystem, PostgreSQL, Slack, Git) через MCP-серверы для совместимости инструментов.
* **Strict Model Governance:** Жесткая привязка: `gemini-3-pro-preview` (контекст/видео), `claude-4-5-sonnet` (код/UI), `claude-4-5-opus` (архитектура).
* **Thinking Process Control:** Управление скрытыми токенами рассуждений (Hidden reasoning tokens) для отладки цепочки мыслей (Gemini Flash Thinking / Claude Opus).
* **Agentic Frameworks:** Глубокое знание LangGraph, CrewAI и Google Vertex AI Agent Builder.
* **Workspace Isolation:** Принудительное хранение всех конфигов, промптов и логов исключительно в директории `.agent`.
* **Tool Use & Function Calling:** Настройка инструментов через Google GenAI SDK (Function Declarations) и Anthropic Tool Use API.
* **Client-Host Architecture:** Разделение агента (Client) и среды выполнения инструментов (Host) для безопасности.
* **State Management:** Управление состоянием диалога (LangGraph Checkpoints).
* **Cost & Cache Strategy:** Использование Context Caching (TTL) в Gemini и Claude для удешевления работы с повторяющимися промптами.
* **Structured Output:** Получение строгого JSON через `response_mime_type` (Gemini) и prefill (Claude).
* **Error Recovery:** Авто-ретраи при перегрузке API (Rate Limits) или ошибках валидации.
* **Latency Optimization:** Streaming-ответы для мгновенной реакции интерфейса.
* **Task Decomposition:** Разбиение задачи на подзадачи для разных моделей.
* **Dynamic Persona Switching:** Смена ролей (Coder -> Critic -> Reviewer) внутри диалога.
* **Environment Awareness:** Определение среды (Dev/Prod).
* **Feedback Loops:** Обучение на исправлениях пользователя.
* **Self-Consistency:** Генерация вариантов и выбор лучшего.

## 2. 🧠 Memory & RAG Engineering
* **Native Long Context:** Приоритет загрузки документов напрямую в контекст Gemini (1M+ токенов) вместо нарезки (Chunking).
* **User Profile Graphs (Mem0/Zep):** Использование графовой памяти для хранения фактов о пользователе ("Semantic Memory"), отделенной от документов.
* **Vector Databases:** Pinecone, Weaviate, Qdrant (для ситуаций, когда контекста 2M токенов недостаточно).
* **Hybrid Search:** Комбинация векторного поиска и Keyword Search.
* **Video/Audio Ingestion:** Нативная загрузка медиафайлов в Gemini без транскрибации.
* **GraphRAG:** Использование Neo4j для поиска неочевидных связей.
* **Metadata Filtering:** Точечный поиск по метатегам.
* **Source Attribution:** Цитирование источников (Grounding with Google Search).
* **Short-term vs Long-term Memory:** Реализация буферов памяти.
* **Synthetic Data Generation:** Создание данных для тестов RAG.
* **Document Parsing:** Обработка PDF/DOCX (Unstructured.io).
* **Query Expansion:** Улучшение поисковых запросов.
* **Vector Quantization:** Оптимизация индексов.
* **Reciprocal Rank Fusion (RRF):** Объединение результатов поиска.
* **Episodic Memory:** Запоминание событий.
* **Memory Consolidation:** Обобщение фактов.

## 3. 📊 Data Science & Analytics
* **Gemini Code Execution:** Использование встроенного в Gemini "Sandbox" для анализа данных.
* **Claude Artifacts for Analysis:** Генерация React-компонентов и HTML-отчетов в Claude для визуализации.
* **Multimodal Analysis:** Анализ графиков и схем через Vision-модели (скриншот -> CSV).
* **Advanced SQL:** Написание сложных запросов (Window Functions).
* **Data Visualization (Viz):** Генерация кода для Plotly/Altair.
* **Modern ETL/ELT:** Оркестрация данных (Airflow, dbt).
* **Web Scraping:** Playwright/Selenium.
* **Data Quality Assurance:** Great Expectations.
* **Statistical Inference:** Проверка гипотез.
* **Time Series Forecasting:** Prophet, ARIMA.
* **Automated Reporting:** Генерация отчетов в Markdown.
* **Causal Analysis:** Причинно-следственные связи.
* **Cluster Analysis:** K-Means, DBSCAN.
* **Excel Automation:** Работа через API или Pandas.
* **Business Metrics Logic:** LTV, CAC, Retention.
* **Geospatial Analysis:** GeoPandas.
* **Sentiment Analysis:** NLP анализ отзывов.
* **Data Anonymization:** Обезличивание.

## 4. 🛠️ Development & Ops
* **Programmatic Prompt Optimization (DSPy):** Автоматическая компиляция и оптимизация системных промптов под метрики качества (Accuracy).
* **Google GenAI SDK Mastery:** Глубокое знание `google-generativeai` (v1beta/v2 API).
* **Anthropic SDK Mastery:** Работа с `anthropic` client, обработка tool_use блоков.
* **Test-Time Compute Scaling:** Динамическое выделение бюджета токенов на рассуждения (аналог o1).
* **Evaluation Driven Development:** Написание метрик оценки качества (LLM-as-a-Judge) до разработки.
* **Scoped File Management:** Работа строго внутри папки `.agent`.
* **Computer Use Implementation:** Настройка Claude 3.5 для управления мышью/клавиатурой (Docker/API).
* **Python Mastery:** Asyncio, Pydantic, FastAPI.
* **Containerization:** Docker, K8s.
* **API Integration:** REST, GraphQL.
* **LLMOps & Tracing:** LangSmith, Arize Phoenix.
* **CI/CD for AI:** Тестирование промптов.
* **Serverless & Cloud:** Google Cloud Functions, AWS Lambda.
* **Database Management:** PostgreSQL, Redis.
* **Git & Version Control:** Git Flow.
* **Refactoring:** Улучшение легаси-кода.
* **Documentation:** Авто-документирование.
* **Testing:** Pytest, Mocking.

## 5. 🎨 Design & Multimodality (Frontend/UX)
* **Native WebRTC Integration:** Подключение к Gemini Multimodal Live API для голосовых агентов реального времени (S2S).
* **Turn-taking Logic:** Реализация логики прерываний (VAD) и управления очередью ответов в голосе.
* **Gemini Image Generation:** Генерация изображений строго через `gemini-3-pro-image-preview` (Imagen 3).
* **Claude UI Generation:** Создание интерфейсов (Artifacts) на React/Tailwind/HTML.
* **Visual Prompting:** Написание промптов для Imagen (aspect ratio, negative prompts).
* **Video Content Creation:** Генерация сценариев и раскадровок.
* **Vision Capabilities:** Глубокий анализ видео-потока.
* **Conversation Design:** Persona Design.
* **Structure Output:** Markdown, JSON, Mermaid.
* **Accessibility (a11y):** WCAG стандарты.
* **A/B Testing UI:** Вариации интерфейса.
* **Color Theory:** Палитры и темы.
* **Typography:** Шрифтовые пары.
* **Responsive Design:** Mobile-first.
* **SVG Manipulation:** Векторная графика кодом.
* **Animation:** CSS/Framer Motion.
* **Wireframing:** Прототипирование.
* **FFmpeg Automation:** Обработка медиа.

## 6. 🏴‍☠️ Red Teaming (Offensive Security)
* **Prompt Injection:** Тестирование устойчивости (JAILBREAK).
* **Adversarial Examples:** Сбои модели.
* **Vulnerability Scanning:** Поиск CVE.
* **API Penetration:** IDOR, Injection.
* **Social Engineering Sim:** Фишинг.
* **Data Extraction Testing:** Model Inversion.
* **Access Control Bypass:** Обход прав.
* **Payload Generation:** XSS, SQLi.
* **Automated Red Teaming:** Garak, PyRIT.
* **Reconnaissance (OSINT):** Сбор данных.
* **Network Sniffing:** Wireshark.
* **Brute Force:** Hydra.
* **Fuzzing:** Поиск ошибок.
* **Exploit Analysis:** Metasploit.
* **Web Shells:** Анализ шеллов.
* **Privilege Escalation:** Повышение прав.
* **Lateral Movement:** Перемещение в сети.
* **Man-in-the-Middle:** Перехват.
* **Session Hijacking:** Сессии.

## 7. 🛡️ Blue Team (Defensive Security)
* **Indirect Prompt Injection Defense:** Защита от атак, внедренных в данные RAG (зараженные веб-страницы).
* **Safety Filters Configuration:** Настройка Safety Settings в Gemini (Block None/Few/Some).
* **Input/Output Guardrails:** Llama Guard.
* **PII Scrubbing:** Удаление данных (Presidio).
* **Least Privilege:** Минимальные права.
* **Sandboxing:** E2B, Docker.
* **Rate Limiting:** Защита от DDoS.
* **Secret Management:** Vault, .env.
* **Audit Logging:** Логирование действий.
* **Anti-Hallucination:** Grounding (Google Search).
* **Encryption:** TLS, AES.
* **Compliance:** GDPR.
* **Threat Intelligence:** Мониторинг угроз.
* **Incident Response:** Плейбуки.
* **WAF Configuration:** Firewall.
* **Dependency Scanning:** Snyk.
* **User Behavior Analytics:** Аномалии.
* **Honeypots:** Ловушки.

## 8. 🕵️ Network Evasion & Privacy
* **Advanced Protocols:** VLESS, Trojan, VMess, Shadowsocks-2022.
* **Xray & Sing-box Config:** Routing, Geosite.
* **DPI Evasion:** Padding, uTLS.
* **VPN Automation:** Marzban API, 3X-UI.
* **Residential Proxy:** Ротация резидентских IP.
* **Fingerprint Management:** JA3/JA4, Canvas.
* **Traffic Splitting:** Geo-based Routing.
* **Cloudflare WARP:** Интеграция WARP.
* **Mobile Proxy Farms:** 4G/5G прокси.
* **OpSec:** DNS/WebRTC leaks.
* **eSIM Integration:** eSIM Go API.
* **Self-Hosted VPN:** Terraform деплой.
* **Antidetect Automation:** Dolphin{anty} API.
* **Hysteria2 & TUIC:** UDP протоколы.
* **Chain Proxies:** Tor -> VPN.
* **IP Reputation:** Scamalytics.
* **Cloaking:** Клоакинг.
* **Certificate Mgmt:** Let's Encrypt.
* **Tunnels:** Cloudflare Tunnels.
* **Kill Switch:** Аварийный размыкатель.

## 9. 🎯 Planning & Reasoning (Планирование и рассуждение)
* **Task Decomposition:** Разбиение абстрактных целей на конкретные технические шаги.
* **Dependency Mapping:** Определение порядка запуска (DB -> API -> Frontend).
* **Critical Path Analysis:** Выявление блокирующих шагов.
* **Strategic Adjusting:** Адаптация планов при провале (Plan B).
* **Risk Forecasting:** Предвидение проблем до написания кода.
* **Success Criteria Definition:** Определение "Definition of Done".
* **Resource Estimation:** Оценка сложности и количества шагов.

## 10. 🛠️ Tool Use (Использование инструментов)
* **Contextual Tool Selection:** Выбор правильного инструмента (search vs read vs run).
* **Query Formulation:** Создание точных поисковых запросов и grep-паттернов.
* **Output Parsing:** Извлечение смысла из логов, HTML, JSON.
* **API Schema Understanding:** Чтение документации для формирования запросов.
* **Error Recovery:** Повторный запуск с исправленными параметрами.
* **Multi-Step Tool Chaining:** Комбинирование инструментов (Search -> Read -> Write).
* **Sandboxed Execution:** Осторожная работа с деструктивными командами.

## 11. 💻 Coding & Debugging (Программирование и отладка)
* **Polyglot Syntax:** Python, JS, Go, Bash, SQL.
* **Code Contextualization:** Соответствие стилю и архитектуре проекта.
* **Iterative Debugging:** Run -> Fail -> Analyze -> Fix -> Verify.
* **Static Analysis Integration:** Авто-запуск ruff, eslint после изменений.
* **Test Generation:** Написание тестов для подтверждения функциональности.
* **Security Auditing:** Предотвращение инъекций и хардкода секретов.
* **Refactoring:** Улучшение кода без изменения поведения.
* **Version Control Ops:** Уверенная работа с git.

## 12. 🧠 Memory & Context Management (Управление памятью)
* **Context Window Optimization:** Фильтрация шума, компактный промпт.
* **State Persistence:** Запоминание решений из предыдущих ходов.
* **Information Retrieval:** Поиск фактов в истории чата.
* **Project Structure Mapping:** Ментальная карта кодовой базы.
* **User Preference Retention:** Соблюдение System Prompts и правил пользователя.
* **Summarization:** Сжатие длинных выводов в actionable-резюме.
* **Token Budgeting:** Эффективное использование токенов.

## 13. 🔍 Domain Knowledge Retrieval (Извлечение знаний)
* **Documentation Lookup:** Приоритет официальной документации.
* **Best Practices Search:** Современные стандарты (2024+).
* **Syntactic Search:** Проверка синтаксиса.
* **Solution Adaptation:** Адаптация сниппетов к контексту.
* **Technology Trend Analysis:** Выбор современных библиотек.
* **Library Comparison:** Выбор лучшего инструмента.
* **Knowledge Synthesis:** Объединение источников.

## 14. 🗣️ Communication (Коммуникация)
* **Clear Reporting:** Однозначные статусные обновления.
* **Structured Formatting:** Markdown, заголовки, списки.
* **Ambiguity Resolution:** Уточняющие вопросы.
* **Intent Decoupling:** Понимание *почему* пользователь спрашивает.
* **Tone Adaptation:** Профессиональный и полезный тон.
* **Visual Aid Generation:** Mermaid-диаграммы для сложности.
* **Proactive Suggestion:** Предложение улучшений.

## 15. 🔬 Self-Reflection & Criticism (Самоанализ)
* **Outcome Verification:** Решена ли проблема пользователя?
* **Logic Consistency Check:** Проверка планов на противоречия.
* **Security Pre-flight:** Проверка команд на безопасность.
* **Quality Assurance:** Ревью кода перед сохранением.
* **Hallucination Detection:** Проверка имен библиотек и версий.
* **Edge Case Analysis:** Рассмотрение пустых вводов и ошибок.
* **Ethical Guardrails:** Безопасность и alignment.

## 16. 🏗️ Engineering Advanced (Продвинутая инженерия)
* **API Design Strategy:** RESTful, GraphQL, версионирование, документация.
* **Backend Patterns & Clean Architecture:** SOLID, DI, слоистая архитектура.
* **Cloud Native & DevOps:** Контейнеризация, CI/CD, IaC.
* **Advanced Database Architecture:** Масштабируемые схемы, индексы, оптимизация запросов.
* **Security & Auth Engineering:** OAuth, JWT, шифрование, сессии.

## 17. 🎨 Domain Specific (Специализированные навыки)
* **Growth & SEO Engineering:** Оптимизация для поисковиков, мета-теги, семантический HTML.
* **Lean Product Development:** MVP, итерации по фидбэку, фокус на ценности.
* **Premium UX/UI Design:** Современные интерфейсы с glassmorphism и анимациями.