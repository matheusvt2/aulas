# Terraform

## O que é?

O Terraform é uma ferramenta de infraestrutura como código (IAC) que permite definir recursos na nuvem em arquivos de configuração legíveis por humanos que você pode criar versões, reutilizar e compartilhar. O Terraform pode gerenciar componentes de baixo nível, como computação, armazenamento e recursos de rede, bem como componentes de alto nível, como entradas DNS e recursos SaaS.

## Conceitos

O Terraform cria e gerencia recursos em plataformas de nuvem e outros serviços por meio de suas interfaces de programação de aplicativos (APIs). Os provedores permitem que o Terraform funcione com praticamente qualquer plataforma ou serviço com uma API acessível.

O fluxo de trabalho principal do Terraform consiste em três estágios:

* Write: você define os recursos, que podem estar em vários provedores e serviços de nuvem. Por exemplo, você pode criar uma configuração para implantar um aplicativo em máquinas virtuais em uma rede Virtual Private Cloud (VPC) com grupos de segurança e um balanceador de carga.
* Plan: o Terraform cria um plano de execução descrevendo a infraestrutura que ele criará, atualizará ou destruirá com base na infraestrutura existente e em sua configuração.
* Apply: Após a aprovação, o Terraform executa as operações propostas na ordem correta, respeitando quaisquer dependências de recursos. Por exemplo, se você atualizar as propriedades de uma VPC e alterar o número de máquinas virtuais nessa VPC, o Terraform recriará a VPC antes de dimensionar as máquinas virtuais.

## Prática

### Configuração inicial

#### Instalação

##### Linux

```bash
$ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

$ wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

$ gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

$ sudo apt update

$ sudo apt-get install terraform
```

##### Windows [Chocolatey](https://chocolatey.org/)

```cmd
>  choco install terraform
```

#### Configuração do provider

Primeiramente temos que ter o awscli instalado no computador. Após isso, basta configurarmos o arquivo de configuração do cli com as credencias da conta AWS.

Linux: /home/<usuário>/.aws/credentials

Windows: C:\Users\<usuário>\.aws\credentials

```text
[conta-aws]
    aws_access_key_id = <ACCESKEYID>
    aws_secret_access_key = <SECRETACCESSKEY>
```

#### Configuração do Terraform

Apesar do Terraform não ter um arquivo de configurações, podemos, como boa prática, adicionar um arquivo `config.tf` na mesma pasta do arquivo `main.tf` e colocar ali informações sobre qual conta aws utilizar, qual vai ser o método de armazenamento do arquivo de estado da infraestrutura, entre outros.

### Inicialização

Após configurado o CLI e o arquivo `config.tf`  podemos inicialiar o terraform dando o seguinte comando:

```bash
terraform init
```

Finalizando o comando, você verá que foram adicionados uma pasta `.terraform` e um arquivo `.terraform.lock.hcl`. A primeira é referente aos módulos e plugins instalados, no caso, instalamos o `hashicorp/aws`. O segundo é referente a **versão** dos plugins que estamos utilizando.

### Planejamento

```bash
terraform plan
```

### Aplicar

```bash
terraform apply
```

Note que ao aplicar as mudanças, surgirão 2 arquivos: `terraform.tfstate` e `terraform.tfstate.backup`, contendo as informações de **estado** da infraestrutura (que será atualizado após cada `terraform apply` ou `terraform destroy`).

### Destruir

```bash
terraform destroy
```

### Outros

#### Variáveis

Podemos configurar variáveis fora do arquivo principal, como islustrado no arquivo `hom\variables.tf`

#### Outputs

Podemos configurar as saídas que aparecerão ao realizar um ´ , como islustrado no arquivo `hom\variables.tf`

#### Seleção de diretórios

Podemos selecionar qual pasta rodar os comandos do terraform utilizando o parâmentro `-chdir`.

```bash
terraform -chdir=hom/ init
```

## Referências

* [Intro](https://developer.hashicorp.com/terraform/intro)
* [Get Started](https://developer.hashicorp.com/terraform/tutorials/aws-get-started?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)
* [Chocolatey](https://chocolatey.org/)
* [hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws/latest)
