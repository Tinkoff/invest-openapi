# REST-протокол

Документация: [Swagger]({{GATEWAY_URL}}docs/swagger-ui/index.html)

## Генерация

REST-api использует OpenApi 3.0.0, для генерации клиентов необходимо использовать новую версию swagger-gen.

## Пример генерации

`https://hub.docker.com/r/swaggerapi/swagger-codegen-cli-v3/tags`

```shell
docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli-v3:3.0.10 generate \
    -i {{GATEWAY_URL}}docs/swagger-ui/swagger.yaml \
    -l go \
    -o /local/out/go
```
