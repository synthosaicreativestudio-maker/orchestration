---
name: GoogleSheetsIntegration
description: Работа с Google Sheets — чтение, запись, форматирование через API.
---

# Skill: GoogleSheetsIntegration

Навык для работы с Google Sheets через Python API.

## Когда активируется
- При работе с данными в Google Sheets
- При необходимости автоматизации таблиц
- При интеграции с существующими процессами

## Настройка подключения

### 1. Установка зависимостей
```bash
pip install gspread google-auth
```

### 2. Авторизация через Service Account
```python
import gspread
from google.oauth2.service_account import Credentials

SCOPES = [
    'https://www.googleapis.com/auth/spreadsheets',
    'https://www.googleapis.com/auth/drive'
]

creds = Credentials.from_service_account_file('service_account.json', scopes=SCOPES)
client = gspread.authorize(creds)
```

### 3. Открытие таблицы
```python
# По ID
spreadsheet = client.open_by_key('1Xq6bcxaDV2AEVWGqhaLlFcr6-hTNv0L5frXgPY-z7fU')

# По названию
spreadsheet = client.open('Аналитика')

# Получение листа
worksheet = spreadsheet.worksheet('Лист1')
```

## Операции с данными

### 4. Чтение данных
```python
# Все данные
data = worksheet.get_all_values()

# Все данные как DataFrame
import pandas as pd
df = pd.DataFrame(data[1:], columns=data[0])

# Конкретная ячейка
value = worksheet.acell('A1').value

# Диапазон
values = worksheet.get('A1:D10')
```

### 5. Запись данных
```python
# Одна ячейка
worksheet.update_acell('A1', 'Новое значение')

# Диапазон
worksheet.update('A1:B2', [[1, 2], [3, 4]])

# Добавить строку
worksheet.append_row(['Значение1', 'Значение2', 'Значение3'])

# Пакетная запись (эффективнее)
worksheet.update('A1:Z100', data_list, value_input_option='USER_ENTERED')
```

### 6. Форматирование
```python
# Жирный заголовок
worksheet.format('A1:Z1', {'textFormat': {'bold': True}})

# Цвет фона
worksheet.format('A1:A10', {'backgroundColor': {'red': 0.9, 'green': 0.9, 'blue': 0.9}})

# Числовой формат
worksheet.format('B2:B100', {'numberFormat': {'type': 'NUMBER', 'pattern': '#,##0'}})
```

## Работа с листами

### 7. Управление листами
```python
# Список листов
worksheets = spreadsheet.worksheets()

# Создать лист
new_sheet = spreadsheet.add_worksheet(title='Новый лист', rows=100, cols=20)

# Удалить лист
spreadsheet.del_worksheet(worksheet)

# Очистить лист
worksheet.clear()
```

## Лимиты API
- **100 запросов в 100 секунд** на пользователя
- **Пакетные операции** предпочтительнее одиночных
- **Задержка 1 сек** между запросами для надёжности

## Инструменты
- `gspread` — Python клиент для Google Sheets
- `google-auth` — авторизация
- `pandas` — обработка данных

## Ожидаемый результат
Автоматизированная работа с Google Sheets без ручного копирования данных.
