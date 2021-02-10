# Авторизация

## Получение токена

1. Зайдите в свой аккаунт на https://tinkoff.ru/
2. Перейдите в раздел инвестиций
3. Перейдите в настройки

   * Функция "Подтверждение сделок кодом" должна быть отключена
   * Выпустите токен OpenAPI для биржи и Sandbox. Возможно, система попросит вас авторизоваться еще раз. Не беспокойтесь, это необходимо для подключения робота к торговой платформе.

4. Скопируйте токен и сохраните его. Токен отображается только один раз, просмотреть его позже не получится. Тем не менее вы можете выпускать неограниченное количество токенов.

## Срок жизни токена

Срок жизни токена составляет три месяца с даты последнего использования.

## Отзыв токена

Отозвать токен OpenAPI можно на странице [https://id.tinkoff.ru/account](https://id.tinkoff.ru/account)

## Выполнение запросов

Чтобы выполнить запрос в OpenAPI вам необходимо передавать токен при каждом вызове в HTTP-заголовке, либо в заголовке запроса подключения в случае streaming-протокола.

```
Authorization: Bearer {TOKEN}
```

Пример:

```go
package main

import (
    "encoding/json"
    "fmt"
    "io/ioutil"
    "log"
    "net/http"
    "strings"
    "time"
)

const (
    token   = "just_place_token_here"
    timeout = time.Second * 3
    url     = "https://api-invest.tinkoff.ru/openapi/sandbox/sandbox/register"
)

func main() {
    client := &http.Client{
        Timeout: timeout,
    }

    req, err := http.NewRequest("POST", url, nil)
    if err != nil {
        log.Fatalf("Can't create register http request: %s", err)
    }

    req.Header.Add("Authorization", "Bearer "+token)
    resp, err := client.Do(req)
    if err != nil {
        log.Fatalf("Can't send register request: %s", err)
    }

    defer resp.Body.Close()

    if resp.StatusCode != http.StatusOK {
        log.Fatalf("Register, bad response code '%s' from '%s'", resp.Status, url)
    }

    respBody, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        log.Fatalf("Can't read register response: %s", err)
    }

    type Register struct {
        TrackingID string `json:"trackingId"`
        Status     string `json:"status"`
    }

    var regResp Register
    err = json.Unmarshal(respBody, &regResp)
    if err != nil {
        log.Fatalf("Can't unmarshal register response: '%s' \nwith error: %s", string(respBody), err)
    }

    if strings.ToUpper(regResp.Status) != "OK" {
        log.Fatalf("Register failed, trackingId: '%s'", regResp.TrackingID)
    }

    fmt.Println("Register succeed")
}
```
