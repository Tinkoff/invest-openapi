# REST-протокол

Документация: [Swagger](https://tinkoffcreditsystems.github.io/invest-openapi/swagger-ui/)

## Ограничение количества запросов

| Ресурс      | Количество запросов | Интервал ограничения |
| :---------- | :------------------ | :------------------- |
| /sandbox    | 120                 | 1 минута             |
| /portfolio  | 120                 | 1 минута             |
| /market     | 120                 | 1 минута             |
| /orders     | 120                 | 1 минута             |
| /operations | 120                 | 1 минута             |


При превышении лимита запросов возвращается ошибка `429 Error: Too Many Requests`

## Генерация

REST-api использует OpenApi 3.0.0, для генерации клиентов необходимо использовать новую версию [swagger-gen](https://github.com/swagger-api/swagger-codegen/tree/3.0.0).

swagger.yaml доступен по адресу `https://tinkoffcreditsystems.github.io/invest-openapi/swagger-ui/swagger.yaml`.
