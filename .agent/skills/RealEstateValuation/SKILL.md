---
name: RealEstateValuation
description: Оценка недвижимости — сравнительный анализ, ликвидность, прогноз сроков продажи.
---

# Skill: RealEstateValuation

Специализированный навык для оценки объектов недвижимости.

## Когда активируется
- При анализе недвижимости
- При расчёте рыночной стоимости
- При прогнозировании сроков продажи

## Методы оценки

### 1. Сравнительный подход (Comparable Sales Method)
Поиск аналогов по критериям:
- **Район** — строгое соответствие
- **Тип объекта** — строгое соответствие
- **Комнаты** — ±1
- **Площадь** — ±20%
- **Год постройки** — ±10 лет
- **Ремонт** — асимметричная логика

### 2. Расчёт справедливой цены
```python
# Усечённое среднее (отбрасываем 10% крайних)
from scipy.stats import trim_mean
fair_price = trim_mean(comparable_prices, 0.1)

# Медиана (более устойчива к выбросам)
fair_price_median = np.median(comparable_prices)
```

### 3. Коэффициент качества
```python
def calculate_quality_score(repair, floor, total_floors, build_year):
    score = 1.0
    
    # Ремонт
    if repair in ['Дизайнерский', 'Евроремонт', 'Современный']:
        score *= 1.10  # +10%
    elif repair in ['Требует ремонта', 'Без ремонта']:
        score *= 0.90  # -10%
    
    # Этаж
    if floor == 1:
        score *= 0.95  # -5% первый этаж
    elif floor == total_floors:
        score *= 0.97  # -3% последний этаж
    
    # Возраст дома
    age = 2026 - build_year
    if age <= 5:
        score *= 1.05  # +5% новостройка
    elif age > 30:
        score *= 0.95  # -5% старый дом
    
    return score
```

### 4. Тип ликвидности
```python
def determine_liquidity_type(active_count, sold_count, demand_per_month):
    if demand_per_month <= 0 or active_count <= 0:
        return 'C-'  # Неопределённо
    
    ratio = (demand_per_month / active_count) * 100
    
    if ratio >= 50:
        return 'A+'  # Высокая ликвидность
    elif ratio >= 30:
        return 'A'   # Хорошая ликвидность
    elif ratio >= 15:
        return 'B'   # Средняя ликвидность
    elif ratio >= 5:
        return 'C'   # Низкая ликвидность
    else:
        return 'C-'  # Очень низкая
```

### 5. Прогноз срока продажи
```python
def estimate_days_on_market(rank, demand_per_month):
    if demand_per_month > 0:
        months = rank / demand_per_month
        return int(months * 30)  # дней
    return 180  # по умолчанию 6 месяцев
```

### 6. Ценовые стратегии
| Стратегия | Формула | Срок |
|-----------|---------|------|
| Быстрая | Рыночная × 0.87 | 1-2 мес |
| Рыночная | Медиана проданных × качество | 3-6 мес |
| Оптимистичная | Рыночная × 1.05 | 6-12 мес |

## Метрики рынка
- **Спрос** = Продажи / Месяцы
- **Прибытие** = Новые объекты / Месяцы
- **Конкуренты** = Активные в районе с аналогичными параметрами
- **Ранг** = Позиция по цене (1 = самый дешёвый)

## Ожидаемый результат
Оценка объекта с разбивкой по стратегиям, прогнозом срока и обоснованием.
