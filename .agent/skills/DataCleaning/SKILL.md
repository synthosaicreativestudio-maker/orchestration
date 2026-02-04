---
name: DataCleaning
description: Очистка и подготовка данных — пропуски, дубликаты, нормализация, типы.
---

# Skill: DataCleaning

Навык для очистки и подготовки данных к анализу.

## Когда активируется
- При получении "грязных" данных
- Перед любым анализом
- При ошибках из-за некорректных данных

## Инструкции для агента

### 1. Первичная диагностика
```python
import pandas as pd

# Общая информация
df.info()
df.shape

# Пропуски
df.isnull().sum()
df.isnull().sum() / len(df) * 100  # процент пропусков

# Дубликаты
df.duplicated().sum()
```

### 2. Обработка пропусков
```python
# Удаление строк с пропусками (если мало)
df.dropna(subset=['critical_column'])

# Заполнение медианой (для числовых)
df['price'].fillna(df['price'].median(), inplace=True)

# Заполнение модой (для категориальных)
df['district'].fillna(df['district'].mode()[0], inplace=True)

# Интерполяция (для временных рядов)
df['value'].interpolate(method='linear', inplace=True)
```

### 3. Удаление дубликатов
```python
df.drop_duplicates(subset=['id'], keep='first', inplace=True)
```

### 4. Приведение типов
```python
df['price'] = pd.to_numeric(df['price'], errors='coerce')
df['date'] = pd.to_datetime(df['date'], format='%Y-%m-%d')
df['rooms'] = df['rooms'].astype(int)
```

### 5. Нормализация строк
```python
df['district'] = df['district'].str.strip().str.lower()
df['repair'] = df['repair'].str.replace('[\n\r\t]', ' ', regex=True)
```

### 6. Обработка выбросов
```python
# Замена выбросов на границы
Q1, Q3 = df['price'].quantile([0.25, 0.75])
IQR = Q3 - Q1
lower, upper = Q1 - 1.5*IQR, Q3 + 1.5*IQR
df['price'] = df['price'].clip(lower, upper)
```

### 7. Feature Engineering
```python
# Цена за м²
df['price_per_sqm'] = df['price'] / df['area']

# Возраст дома
df['house_age'] = 2026 - df['build_year']

# Бинарные признаки
df['is_first_floor'] = (df['floor'] == 1).astype(int)
```

## Чеклист очистки данных
- [ ] Проверить типы данных
- [ ] Обработать пропуски
- [ ] Удалить дубликаты
- [ ] Проверить диапазоны значений
- [ ] Нормализовать строки
- [ ] Обработать выбросы

## Инструменты
- `pandas` — основная библиотека
- `numpy` — числовые операции

## Ожидаемый результат
Чистый датасет, готовый к анализу, с отчётом о выполненных преобразованиях.
