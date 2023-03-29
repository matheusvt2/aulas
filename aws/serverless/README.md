# Serverless Framework

[https://www.serverless.com/](https://www.serverless.com/)

## O que é?

O Serverless Framework ajuda você a desenvolver e implantar funções do AWS Lambda, juntamente com os recursos de infraestrutura da AWS necessários. É uma CLI que oferece estrutura, automação e práticas recomendadas prontas para uso, permitindo que você se concentre na construção de arquiteturas sofisticadas, orientadas a eventos e sem servidor, compostas por Funções e Eventos.

## Prática

### Configuração inicial

#### Instalação

```bash
npm install -g serverless
```

### Desenho solução

![Arquitetura](docs/img/arquitetura.svg "Arquitetura")

### Proposta A

Primeiramente vamos iniciar o projeto utilizando a cli do framework serverless.

`$ serverless create --template aws-python3`

Você pode utilizar o comando `serverless create --help` para ver as opções de templates ou visitar a [documentação](https://www.serverless.com/framework/docs/providers/aws/cli-reference/create).

Agora para subir essa configuração de SQS + lambda + SQS, basta utilizarmos o comando abaixo:

`serverless deploy --stage dev`

Ao finalizar a criação, perceba que 2 arquivos foram gerados, o `handler.py` que é o código que iremos utilizar na função lambda e o arquivo `serverless.yml` que vai servir como um documento de criação desses serviços.

* Lambda: **meutestesqs-dev-lambda-hello** composto pela seguinte regra `${service}-${env}-${functions.name}`.
* SQS1: **fila-entrada** composto pela seguinte regra `${resources.Resources.name}`.
* SQS2: **fila-saida** composto pela seguinte regra `${resources.Resources.name}`.
* S3 Bucket: **meutestesqs-dev-serverlessdeploymentbucket-{UUID}** composto pela seguinte regra `${service}-${env}-${functions.name}deploymentbucket-${UUID}`.
* CloudFormation Stack: **meutestesqs-dev** composto pela seguinte regra `${service}-${env}`.

Para deletar os recursos criados, basta utilizarmos o seguinte comando:

`serverless remove --stage dev`

### Proposta B

[Video Referência](https://www.youtube.com/watch?v=BUydgDGMZW8)

Novamente, vamos iniciar o projeto utilizando a cli do framework serverles.

`$ serverless create --template aws-python3`

Iremos alterar o arquivo handler somente na linha 7, retirando a variável `event` e deixando um texto no lugar:  `"input": "Evento"`.

No arquivo `serverless.yml` iremos retirar parte dos comentários e adicionar algumas informações como **region**, **versionFunctions**, **memorySize** e descomentar a seção refente ao **functions.lambda-hello.events**, que será responsável por criar o serviço no API Gateway. Também criaremos o bloco **custom** para informar qual profile da AWS a CLI utilizará para fazer o deploy conforme [referência](https://www.serverless.com/framework/docs/providers/aws/guide/credentials#using-the-aws-profile-option).

Agora para subir essa configuração de API Gateway + Lambda em dev, basta utilizarmos o comando abaixo:

`serverless deploy --stage dev`

Foram criados os seguintes serviços na aws:

* Lambda: **meutesteapi-dev-lambda-hello** composto pela seguinte regra `${service}-${env}-${functions.name}`.
* API Gateway: **dev-meutesteapi** composto pela seguinte regra `${env}-${service}`
* S3 Bucket: **meutesteapi-dev-serverlessdeploymentbucket-{UUID}**  pela seguinte regra `${service}-${env}-${functions.name}deploymentbucket-${UUID}`
* CloudFormation Stack: **meutesteapi-dev** composto pela seguinte regra `${service}-${env}`.

Para deletar os recursos criados, basta utilizarmos o seguinte comando:

`serverless remove --stage dev`

## Referências

* [Serverless Docs](https://www.serverless.com/framework/docs)
