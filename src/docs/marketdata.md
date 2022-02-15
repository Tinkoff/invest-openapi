# Протокол

Streaming market-data в качестве протокола транспорта использует WebSocket.


### Ограничения

* Доступно 6 TCP-соединений на одного пользователя.

## candle:subscribe
Подписка на свечи. Обратите внимание, что в случае отсутствия сделок в интервале свечи возможны пробелы в передаваемых данных.

Пример запроса:

```
{
    "event": "candle:subscribe",
    "figi": "{{FIGI}}",
    "interval": "{{INTERVAL}}"
}
```

Формат ответа:


| Параметр | Тип | Обязательность | Описание |
| --- | --- | --- | --- |
| event | string | + | Название события |
| time | string | + | Время в формате RFC3339Nano |
| payload | object | + | Структура свечи |
| payload.o | double | + | Цена открытия |
| payload.c | double | + | Цена закрытия |
| payload.h | double | + | Наибольшая цена |
| payload.l | double | + | Наименьшая цена |
| payload.v | double | + | Объем торгов |
| payload.time | string | + | Время в формате RFC3339 |
| payload.interval | string | + | Interval |
| payload.figi | string | + | FIGI |


Пример ответа:

```
{
    "event": "candle",
    "time": "2019-08-07T15:35:00.029721253Z",
    "payload": {
        "o": 64.0575,
        "c": 64.0575,
        "h": 64.0575,
        "l": 64.0575,
        "v": 156,
        "time": "2019-08-07T15:35:00Z",
        "interval": "5min",
        "figi": "BBG0013HGFT4"
    }
}
```

## candle:unsubscribe

Отписка от свечей

Пример запроса:

```
{
    "event": "candle:unsubscribe",
    "figi": "{{FIGI}}",
    "interval": "{{INTERVAL}}"
}
```

## orderbook:subscribe

Подписка на стакан

Пример запроса:

```
{
    "event": "orderbook:subscribe",
    "figi": "{{FIGI}}",
    "depth": {{DEPTH}}
}
```

Формат ответа:


| Параметр | Тип | Обязательность | Описание |
| --- | --- | --- | --- |
| event | string | + | Название события |
| time | string | + | Время в формате RFC3339Nano |
| payload | object | + | Структура со стаканом |
| payload.depth | int | + | Глубина стакана |
| payload.bids | array[double,double] | + | Массив `[Цена, количество]` предложений цены |
| payload.asks | array[double,double] | + | Массив `[Цена, количество]` запросов цены |
| payload.figi | string | + | FIGI |


Пример ответа:

```
{
    "event": "orderbook",
    "time": "2019-08-07T15:35:00.029721253Z",
    "payload": {
        "figi": "BBG0013HGFT4",
        "depth": 2,
        "bids": [
            [64.3525, 204],
            [64.1975, 276]
        ],
        "asks": [
            [64.38, 227],
            [64.5225, 120]
        ]
    }
}
```

## orderbook:unsubscribe

Отписка от стакана

Пример запроса:

```
{
    "event": "orderbook:unsubscribe",
    "figi": "{{FIGI}}",
    "depth": "{{DEPTH}}"
}
```

## instrument_info:subscribe

Подписка на информацию об инструменте

Пример запроса:

```
{
    "event": "instrument_info:subscribe",
    "figi": "{{FIGI}}"
}
```

Формат ответа:

| Параметр | Тип | Обязательность | Описание |
| --- | --- | --- | --- |
| event | string | + | Название события |
| time | string | + | Время в формате RFC3339Nano |
| payload | object | + | Структура с информацией по инструменту |
| payload.trade_status | string | + | Статус торгов |
| payload.min_price_increment | double | + | Шаг цены |
| payload.lot | double | + | Лот |
| payload.accrued_interest | double | - | НКД. Возвращается только для бондов |
| payload.limit_up | double | - | Верхняя граница заявки. Возвращается только для RTS инструментов |
| payload.limit_down| double | - | Нижняя граница заявки. Возвращается только для RTS инструментов |
| payload.figi | string | + | FIGI |


Пример ответа:

```
{
    "event": "instrument_info",
    "time": "2019-08-07T15:35:00.029721253Z",
    "payload": {
        "figi": "BBG0013HGFT4",
        "trade_status": "normal_trading",
        "min_price_increment": 0.0025,
        "lot": 1000
    }
}
```

## instrument_info:unsubscribe

Отписка от информации об инструменте

Пример запроса:

```
{
    "event": "instrument_info:unsubscribe",
    "figi": "{{FIGI}}"
}
```

## Сообщения об ошибке

К любому запросу можно добавить необязательное поле *request_id*, которое будет использовано в сообщении об ошибке

Формат ответа:

| Параметр | Тип | Обязательность | Описание |
| --- | --- | --- | --- |
| event | string | + | Название события |
| time | string | + | Время в формате RFC3339Nano |
| payload | object | + | Структура с информацией об ошибке |
| payload.error | string | + | Сообщение об ошибке |
| payload.request_id | string | - | ID запроса, если передан при запросе |

Пример запроса:

```
{
    "event": "instrument_info:subscribe",
    "request_id": "123ASD1123",
    "figi": "NOOOOOOO"
}
```

Пример ошибки:

```
{
    "event": "error",
    "time": "2019-08-07T15:35:00.029721253Z",
    "payload": {
        "request_id": "123ASD1123",
        "error": "Subscription instrument_info:subscribe. FIGI NOOOOOOO not found"
    }
}
```

# Описание форматов

### trade_status

```
break_in_trading - торги приостановлены;
normal_trading - торги идут;
not_available_for_trading - торги не идут;
closing_auction - торги в аукционе закрытия;
closing_period - торги в периоде закрытия;
discrete_auction - торги в дискретном аукционе;
opening_period - период открытия торгов;
trading_at_closing_auction_price - торги по цене аукциона закрытия;
dealer_normal_trading - торговля с внутренней ликвидностью брокера;
dealer_break_in_trading - торговля с внутренней ликвидностью брокера приостановлены;
dealer_not_available_for_trading - торговля с внутренней ликвидностью брокера недоступна;
opening_auction - торги в аукционе открытия;
session_assigned - сессия назначена;
session_close - сессия открыта;
session_open - сессия закрыта. 

```


### Interval

```
("1min","2min","3min","5min","10min","15min","30min","hour","2hour","4hour","day","week","month")
```

### Depth

```
0 < DEPTH <= 20
```

# Примеры подключения

```go
package main

import (
    "flag"
    "log"
    "net/http"

    "github.com/gorilla/websocket"
)

var addr = flag.String("addr", "wss://api-invest.tinkoff.ru/openapi/md/v1/md-openapi/ws", "http service address")
var token = flag.String("token", "", "API token")

func main() {
    flag.Parse()

    c, _, err := websocket.DefaultDialer.Dial(*addr, http.Header{"Authorization": {"Bearer " + *token}})
    if err != nil {
        log.Fatal("dial:", err)
    }
    defer c.Close()

    go func() {
        for {
            _, message, err := c.ReadMessage()
            if err != nil {
                log.Println("read: ", err)
                return
            }
            log.Printf("recv: %s\n", message)
        }
    }()

    const sub = `{"event": "orderbook:subscribe", "figi": "BBG0013HGFT4", "depth": 10}`
    err = c.WriteMessage(websocket.TextMessage, []byte(sub))
    if err != nil {
        log.Println("write: ", err)
        return
    }

    select {}
}
```
