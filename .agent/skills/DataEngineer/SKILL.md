---
name: DataEngineer
description: Инженер данных — хранилища, ETL-процессы, инфраструктура для анализа.
---

# Skill: DataEngineer

Роль Data Engineer — подготовка инфраструктуры для анализа данных.

## Когда активируется
- При проектировании потоков данных
- При создании ETL-процессов
- При оптимизации хранения данных
- При автоматизации пайплайнов

## Ключевые компетенции

### 1. ETL-процессы (Extract, Transform, Load)

```python
# EXTRACT — извлечение данных
def extract_from_sheets(spreadsheet_id, sheet_name):
    """Извлекает данные из Google Sheets"""
    worksheet = client.open_by_key(spreadsheet_id).worksheet(sheet_name)
    return worksheet.get_all_values()

# TRANSFORM — преобразование
def transform_data(raw_data):
    """Очищает и преобразует данные"""
    df = pd.DataFrame(raw_data[1:], columns=raw_data[0])
    
    # Приведение типов
    df['price'] = pd.to_numeric(df['price'], errors='coerce')
    df['area'] = pd.to_numeric(df['area'], errors='coerce')
    
    # Фильтрация
    df = df[df['price'] > 0]
    
    # Расчёт производных
    df['price_per_sqm'] = df['price'] / df['area']
    
    return df

# LOAD — загрузка
def load_to_analytics(df, target_sheet):
    """Загружает данные в целевой лист"""
    worksheet = spreadsheet.worksheet(target_sheet)
    worksheet.update('A1', [df.columns.tolist()] + df.values.tolist())
```

### 2. Data Pipeline Architecture
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Sources   │ -> │   Extract   │ -> │  Transform  │ -> │    Load     │
├─────────────┤    ├─────────────┤    ├─────────────┤    ├─────────────┤
│ Google      │    │ API calls   │    │ Cleaning    │    │ Analytics   │
│ Sheets      │    │ Scheduling  │    │ Enrichment  │    │ Sheet       │
│ Avito API   │    │ Batching    │    │ Validation  │    │ Database    │
│ Cian API    │    │ Retry logic │    │ Aggregation │    │ Report      │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

### 3. Data Quality Checks
```python
def validate_data(df):
    """Проверка качества данных"""
    checks = {
        'no_nulls_in_key': df['code'].notna().all(),
        'positive_prices': (df['price'] > 0).all(),
        'valid_areas': (df['area'] > 0).all() & (df['area'] < 1000),
        'valid_dates': pd.to_datetime(df['date'], errors='coerce').notna().all()
    }
    
    failed = [k for k, v in checks.items() if not v]
    if failed:
        raise ValueError(f"Data quality checks failed: {failed}")
    
    return True
```

### 4. Scheduling & Automation
```python
# Google Apps Script триггер
function installTriggers() {
  ScriptApp.newTrigger('startAllFunctions')
    .timeBased()
    .atHour(6)
    .everyDays(1)
    .inTimezone('Asia/Yekaterinburg')
    .create();
}

# Python scheduling
import schedule

schedule.every().day.at("06:00").do(run_etl_pipeline)
schedule.every().day.at("14:00").do(run_etl_pipeline)
```

### 5. Logging & Monitoring
```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def run_pipeline():
    logging.info("Pipeline started")
    try:
        data = extract()
        logging.info(f"Extracted {len(data)} rows")
        
        transformed = transform(data)
        logging.info(f"Transformed to {len(transformed)} rows")
        
        load(transformed)
        logging.info("Pipeline completed successfully")
        
    except Exception as e:
        logging.error(f"Pipeline failed: {e}")
        raise
```

### 6. Data Schema
```sql
-- Схема данных для аналитики недвижимости
CREATE TABLE objects (
    id INT PRIMARY KEY,
    code VARCHAR(20) UNIQUE,
    district VARCHAR(100),
    object_type VARCHAR(50),
    rooms INT,
    area DECIMAL(10,2),
    price DECIMAL(15,2),
    repair_type VARCHAR(50),
    floor INT,
    total_floors INT,
    build_year INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
```

## Инструменты
- `pandas` — обработка данных
- `gspread` — Google Sheets API
- `schedule` — планирование задач
- `logging` — журналирование

## Ожидаемый результат
Надёжный автоматизированный пайплайн с мониторингом и обработкой ошибок.
