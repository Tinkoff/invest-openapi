# Тинькофф Инвестиции OpenAPI


<br><br>

# Внимание, доступна новая версия [Tinkoff Invest API](https://github.com/Tinkoff/investAPI) 
## Поддержка текущей версии будет прекращена в 2022 году, рекомендуем переходить на новую версию.

<br>

Основные изменения в [новой версии](https://github.com/Tinkoff/investAPI):
* Поддержка всех нововведений, которых не было в текущей openAPI: мультисчетов, фьючерсов, стоп-ордеров и т.д.;
* Поддержка токена для конкретного счета и режима “только для чтения”;
* Полноценная “песочница” для тестирования стратегий, которая теперь знает о текущих рыночных котировках;
* Существенно обогащенный список методов и формат возвращаемых данных;
* Гибкая система разграничения лимитов на запросы;
* Новый производительный протокол gRPC, совмещающий как единичные запросы, так и стримы;
* Добавлены стримы с исполнением сделок клиента;

Документация по новой API и контракты доступны по ссылке https://github.com/Tinkoff/investAPI

<br><br>


# Об openapi v1 [deprecated]

OpenAPI — HTTP-интерфейс для взаимодействия с торговой платформой [Тинькофф Инвестиции](https://www.tinkoff.ru/invest/).

OpenAPI позволяет вам выставлять лимитные заявки, просматривать информацию по своему портфелю и получать market-data через streaming.

[Документация для разработчиков](https://tinkoff.github.io/invest-openapi/)

# Зачем нужен этот репозиторий?

В Issues вы можете задать вопрос или найти ответ, если вопрос уже был задан другими пользователями.

В Releases мы будем добавлять информацию о релизах.

В директории `src/` хранится документация в формате Markdown. Описание REST-протокола можно отредактировать в `src/docs/swagger-ui/swagger.yaml`.

Если вы встретили неточность или хотели бы что-то дополнить, то мы будем рады принять от вас pull request.

# Работа в Тинькофф Инвестициях
 
Вы разработчик и есть интерес к финтеху и инвестициям?
Приходите работать к нам: https://www.tinkoff.ru/career/vacancies/invest/

# Официальные SDK

[Java](https://github.com/Tinkoff/invest-openapi-java-sdk)

[C#](https://github.com/Tinkoff/invest-openapi-csharp-sdk)

[Go](https://github.com/Tinkoff/invest-openapi-go-sdk)

[NodeJS](https://github.com/Tinkoff/invest-openapi-js-sdk)

# Неофициальные SDK

[Python @daxartio](https://github.com/daxartio/tinvest)

[Python @Awethon](https://github.com/Awethon/open-api-python-client)

[Python @Fatal1ty](https://github.com/Fatal1ty/tinkoff-api)

[Python @asakharov](https://github.com/asakharov/tinkoff_invest)

[PHP @jamesRUS52](https://github.com/jamesRUS52/tinkoff-invest)

[PHP @dzhdmitry](https://github.com/dzhdmitry/tinkoff-invest-api)

[Dart @greymag](https://github.com/greymag/tinkoff-invest-openapi-dart-sdk)

# Неофициальные утилиты

[Tiny client for Tinkoff OpenAPI](https://github.com/foxweb/tinkyclient) (Ruby)

[Streaming Data Saver](https://github.com/a0s/tinkoff-invest-dumper) (Go)

# Полезные ссылки

[Telegram-канал](https://t.me/tinkoffinvestopenapi)
