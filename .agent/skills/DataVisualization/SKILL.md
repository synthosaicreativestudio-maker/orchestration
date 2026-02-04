---
name: DataVisualization
description: Визуализация данных — графики, диаграммы, heatmaps, интерактивные отчёты.
---

# Skill: DataVisualization

Навык создания информативных и красивых визуализаций данных.

## Когда активируется
- При запросах типа "Покажи график", "Визуализируй", "Построй диаграмму"
- После анализа данных для наглядности результатов
- При подготовке отчётов

## Инструкции для агента

### 1. Базовая настройка
```python
import matplotlib.pyplot as plt
import seaborn as sns

plt.style.use('seaborn-v0_8-whitegrid')
plt.rcParams['figure.figsize'] = (12, 6)
plt.rcParams['font.size'] = 12
```

### 2. Линейный график (динамика)
```python
plt.figure(figsize=(12, 6))
plt.plot(df['date'], df['price'], label='Цена', linewidth=2)
plt.fill_between(df['date'], df['price'], alpha=0.3)
plt.xlabel('Дата')
plt.ylabel('Цена, руб.')
plt.title('Динамика цен')
plt.legend()
plt.savefig('price_trend.png', dpi=150, bbox_inches='tight')
```

### 3. Гистограмма (распределение)
```python
plt.figure(figsize=(10, 6))
plt.hist(df['price'], bins=30, edgecolor='white', alpha=0.7)
plt.axvline(df['price'].median(), color='red', linestyle='--', label='Медиана')
plt.xlabel('Цена')
plt.ylabel('Количество')
plt.legend()
```

### 4. Box plot (выбросы)
```python
plt.figure(figsize=(10, 6))
sns.boxplot(data=df, x='district', y='price')
plt.xticks(rotation=45)
```

### 5. Heatmap (корреляции)
```python
plt.figure(figsize=(10, 8))
corr = df.corr()
sns.heatmap(corr, annot=True, cmap='RdYlGn', center=0, fmt='.2f')
plt.title('Матрица корреляций')
```

### 6. Scatter plot (зависимости)
```python
plt.figure(figsize=(10, 6))
plt.scatter(df['area'], df['price'], alpha=0.5, c=df['rooms'], cmap='viridis')
plt.colorbar(label='Комнаты')
plt.xlabel('Площадь, м²')
plt.ylabel('Цена, руб.')
```

### 7. Интерактивные графики (Plotly)
```python
import plotly.express as px
fig = px.scatter(df, x='area', y='price', color='district', 
                 hover_data=['rooms', 'repair'])
fig.write_html('interactive_chart.html')
```

## Правила хорошей визуализации
1. **Одна идея — один график**
2. **Подписи осей** обязательны
3. **Легенда** при нескольких линиях
4. **Единицы измерения** в подписях
5. **Цвета** должны быть различимы

## Инструменты
- `matplotlib` — базовые графики
- `seaborn` — статистические визуализации
- `plotly` — интерактивные графики

## Ожидаемый результат
Информативные графики, сохранённые в формате PNG (150 dpi) или HTML.
