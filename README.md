# Trabalho prático Unidade 2 Kubernetes

# Jogo de Adivinhação com Flask

Este é um simples jogo de adivinhação desenvolvido utilizando o framework Flask. O jogador deve adivinhar uma senha criada aleatoriamente, e o sistema fornecerá feedback sobre o número de letras corretas e suas respectivas posições.

## Funcionalidades

- Criação de um novo jogo com uma senha fornecida pelo usuário.
- Adivinhe a senha e receba feedback se as letras estão corretas e/ou em posições corretas.
- As senhas são armazenadas  utilizando base64.
- As adivinhações incorretas retornam uma mensagem com dicas.
  
## Requisitos

- Docker
- Git
- Kubernetes

---
## Instalação

Clonar o repositório
```bash
git clone https://github.com/brunoportilho/guess_game_k8s.git
```

Navegar até a pasta
```bash
cd guess_game_k8s
```
Para subir a aplicação, use o comando abaixo:
```bash
kubectl apply -f .
```
Acessar a aplicação via browser na URL http://localhost:30080
---
## Como Jogar

### 1. Criar um novo jogo

- Acesse a url acima

- Digite uma frase secreta

- Envie

- Salve o game-id


### 2. Adivinhar a senha

- Vá para o endponint breaker

- Entre com o game_id que foi gerado pelo Creator

- Tente adivinhar

---
## Estrutura do Código

### Rotas:

- **`/create`**: Cria um novo jogo. Armazena a senha codificada em base64 e retorna um `game_id`.
- **`/guess/<game_id>`**: Permite ao usuário adivinhar a senha. Compara a adivinhação com a senha armazenada e retorna o resultado.

### Classes Importantes:

- **`Guess`**: Classe responsável por gerenciar a lógica de comparação entre a senha e a tentativa do jogador.
- **`WrongAttempt`**: Exceção personalizada que é levantada quando a tentativa está incorreta.

### Repositório

- **yaml Docker Compose:** Arquivo `docker-compose.yml` localizado na raiz do projeto, utilizado para subir a aplicação.
- **Backend:** Localizado na raiz do projeto, usado para montar a imagem com serviços do backend `backend.Dockerfile`
- **Frontend:** Localizado na ./frontend, responsavel por montar a imagem Docker com os serviçõs do frontend `frontend.Dockerfile`
- **Configuração do NGINX:** Localizado na ./frontend, é copiado para o NGINX no momento de criação e contém as configurações de rotas e balanceamento de carga. `nginx.conf`

---
## Melhorias implementadas

- Facilidade de Atualização: aplicação rodando em container Docker, pode ser atualizada rapidamente.
- Adicionado NGINX para proxy reverso e balanceamento de carga.
- Reinicio de container implementado com `restart: always`.
- Volume persistente para o Banco de Dados PostgreSQL `pg_data`

---
## Em caso de qualquer alteração de código:
Qualquer alteração realizada no código pode ser aplicada executando os comandos abaixo: 

```bash
docker-compose up -d --pull always
```
