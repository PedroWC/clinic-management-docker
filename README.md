# clinic-management-docker

Este repositório central contém submódulos que representam uma API e um PWA, cada um armazenado em seus respectivos repositórios Git. Este README fornece instruções sobre como clonar o repositório central com seus submódulos e como atualizar esses submódulos.

## Estrutura de Diretórios

Após clonar o repositório central com os submódulos, a estrutura de diretórios será a seguinte:

```
repositorio-central/
├── clinic-management/      # Conteúdo do repositório da API
└── clinic-management-pwa/  # Conteúdo do repositório do PWA
```

## Clonagem do Repositório Central com Submódulos

Para clonar este repositório central juntamente com todos os submódulos (API e PWA), utilize o seguinte comando:

```bash
git clone --recurse-submodules git@github.com:PedroWC/clinic-management-docker.git
```

Este comando garantirá que os submódulos sejam clonados juntamente com o repositório central.

## Atualização dos Submódulos

Para atualizar os submódulos para a versão mais recente dos seus respectivos repositórios originais, utilize o seguinte comando:

```bash
git submodule update --remote
```

Este comando atualizará os submódulos para refletir as mudanças mais recentes nos repositórios da API e do PWA.

## Inicialização dos Submódulos

Se você já clonou o repositório central sem a opção `--recurse-submodules`, você pode inicializar e atualizar os submódulos com os seguintes comandos:

```bash
git submodule init
git submodule update
```

## Rodando os Containers Docker
Este repositório inclui um arquivo docker-compose.yml para configurar e iniciar os containers Docker necessários para a API e o PWA. Siga os passos abaixo para rodar os containers:

1. Certifique-se de ter o Docker e o Docker Compose instalados em sua máquina.

2. No diretório raiz do repositório, execute o seguinte comando para iniciar os containers:

```bash
docker-compose up --build
```
Este comando irá construir as imagens Docker necessárias e iniciar os containers para o banco de dados, a API e o frontend.

3. Acesse os serviços nas seguintes URLs:

- API: http://localhost:8080
- Frontend: http://localhost:3000
4. Para parar e remover os containers, utilize o comando:

```bash
docker-compose down
```

## Documento de Requisitos
Você pode acessar o documento de requisitos do projeto através do seguinte link: [Requisitos](./REQUIREMENTS.md)
