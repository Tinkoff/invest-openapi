# Окружения

Каждое из окружений использует свой вид токена авторизации. Получив токен для Sandbox, вы не сможете использовать его для работы с REST API биржи.

Это сделано для того, чтобы обезопасить процесс тестирования и случайно не начать торговать на бирже.

При этом streaming market-data может работать с любыми видами токенов.

## Production

REST: `https://api-invest.tinkoff.ru/openapi/`

Streaming: `wss://api-invest.tinkoff.ru/openapi/md/v1/md-openapi/ws`

## Sandbox

REST: `https://api-invest.tinkoff.ru/openapi/sandbox`

Sandbox позволяет вам попробовать свои торговые стратегии, при этом не тратя реальные средства. Протокол взаимодействия полностью совпадает с Production окружением.

Ограничения:

* Сделки исполняются моментально
* Сделки исполняются в полном объеме
* Сделки исполняются по любой цене
* Комиссии при покупке/продаже не учитываются
* Доходность всегда считается нулевой

Для того чтобы начать использовать Sandbox, необходимо вызвать [метод регистрации](https://tinkoffcreditsystems.github.io/invest-openapi/swagger-ui/#/sandbox/post_sandbox_register)

### Управление Sandbox

* `sandbox/register` — регистрация в sandbox, создание валютных позиций
* `sandbox/currencies/balance` — выставление баланса по валютным позициям
* `sandbox/positions/balance` — выставление баланса по не-валютным позициям
* `sandbox/clean` — очистка позиций
