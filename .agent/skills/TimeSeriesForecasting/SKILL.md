---
name: TimeSeriesForecasting
description: Прогнозирование временных рядов — тренды, сезонность, ARIMA, Prophet.
---

# Skill: TimeSeriesForecasting

Навык для анализа и прогнозирования временных рядов.

## Когда активируется
- При запросах типа "Спрогнозируй", "Какой будет тренд", "Предскажи цены"
- При работе с данными, содержащими временные метки
- При анализе динамики показателей

## Инструкции для агента

### 1. Подготовка данных
```python
import pandas as pd
df['date'] = pd.to_datetime(df['date'])
df.set_index('date', inplace=True)
df = df.resample('M').mean()  # Агрегация по месяцам
```

### 2. Декомпозиция
```python
from statsmodels.tsa.seasonal import seasonal_decompose
result = seasonal_decompose(df['value'], model='additive', period=12)
# result.trend, result.seasonal, result.resid
```

### 3. Скользящие средние
```python
# Simple Moving Average
df['SMA_7'] = df['value'].rolling(window=7).mean()

# Exponential Moving Average  
df['EMA_7'] = df['value'].ewm(span=7).mean()
```

### 4. ARIMA модель
```python
from statsmodels.tsa.arima.model import ARIMA
model = ARIMA(df['value'], order=(p, d, q))
# p — авторегрессия, d — разности, q — скользящее среднее
fitted = model.fit()
forecast = fitted.forecast(steps=12)
```

### 5. Определение параметров ARIMA
```python
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
# ACF — для q, PACF — для p
# d — количество дифференцирований для стационарности
```

### 6. Prophet (для сложных временных рядов)
```python
from prophet import Prophet
df_prophet = df.reset_index()
df_prophet.columns = ['ds', 'y']
model = Prophet()
model.fit(df_prophet)
future = model.make_future_dataframe(periods=12, freq='M')
forecast = model.predict(future)
```

### 7. Оценка качества прогноза
```python
from sklearn.metrics import mean_absolute_error, mean_squared_error
MAE = mean_absolute_error(actual, predicted)
RMSE = mean_squared_error(actual, predicted, squared=False)
MAPE = (abs((actual - predicted) / actual)).mean() * 100
```

## Инструменты
- `statsmodels` — ARIMA, декомпозиция
- `prophet` — Facebook Prophet
- `pandas` — обработка дат
- `sklearn.metrics` — метрики качества

## Ожидаемый результат
Прогноз с указанием доверительного интервала и метрик качества (MAE, RMSE, MAPE).
