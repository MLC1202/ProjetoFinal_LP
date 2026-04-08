# Aktooh - Quiz Educacional Interativo

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Swing](https://img.shields.io/badge/Swing-007396?style=for-the-badge&logo=java&logoColor=white)
![JDBC](https://img.shields.io/badge/JDBC-007396?style=for-the-badge&logo=java&logoColor=white)

Sistema de quiz interativo educacional inspirado no Kahoot, desenvolvido em **Java** com interface grafica **Swing** e persistencia de dados em **MySQL**. O projeto foi criado como trabalho semestral da disciplina de Linguagem de Programacao.

---

## Sumario

- [Sobre o Projeto](#sobre-o-projeto)
- [Funcionalidades](#funcionalidades)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Pre-requisitos](#pre-requisitos)
- [Instalacao e Configuracao](#instalacao-e-configuracao)
- [Como Executar](#como-executar)
- [Modelagem do Banco de Dados](#modelagem-do-banco-de-dados)
- [Screenshots](#screenshots)
- [Documentacao](#documentacao)
- [Equipe](#equipe)
- [Licenca](#licenca)

---

## Sobre o Projeto

O **Aktooh** e uma plataforma de quiz educacional que permite a interacao entre professores e alunos em ambiente de sala de aula. O professor pode criar e gerenciar quizzes personalizados, enquanto os alunos participam respondendo as perguntas e acumulando pontuacao.

### Objetivos
- Criar uma ferramenta educacional interativa e divertida
- Facilitar a avaliacao de conhecimentos de forma dinamica
- Proporcionar feedback imediato para alunos e professores
- Aplicar conceitos de POO, banco de dados e interface grafica

---

## Funcionalidades

### Para Professores
- Criar e gerenciar quizzes personalizados
- Adicionar, editar e remover perguntas do banco de questoes
- Visualizar resultados de todos os alunos
- Selecionar perguntas aleatorias ou especificas para cada quiz

### Para Alunos
- Sistema de login com cadastro automatico
- Participar de quizzes disponiveis
- Sistema de pontuacao por acertos
- Visualizar historico de resultados pessoais

### Gerais
- Interface grafica intuitiva (Java Swing)
- Persistencia de dados em MySQL
- Sistema de autenticacao com validacao de credenciais
- Banco com 50 perguntas pre-cadastradas de conhecimentos gerais

---

## Tecnologias Utilizadas

| Tecnologia | Versao | Descricao |
|------------|--------|-----------|
| Java | 8+ | Linguagem principal do projeto |
| Java Swing | - | Interface grafica desktop |
| MySQL | 8.0+ | Banco de dados relacional |
| JDBC | - | Conexao Java com MySQL |
| MySQL Connector/J | 8.4.0 | Driver de conexao |

---

## Estrutura do Projeto

```
ProjetoFinal_LP/
├── Diagramas/                      # Diagramas do sistema
│   ├── Banco de dados.drawio       # Diagrama ER editavel
│   ├── Banco de dados.png          # Diagrama ER exportado
│   ├── Diagrama Quiz.drawio        # Fluxograma do sistema
│   ├── Diagrama Quiz.png           # Fluxograma exportado
│   ├── Requisitos quiz.drawio      # Requisitos do sistema
│   └── Requisitos quiz.png         # Requisitos exportado
│
├── Projeto_semestral(Quiz)/        # Codigo-fonte principal
│   ├── src/                        # Arquivos .java
│   │   ├── QuizApp.java            # Classe principal (main)
│   │   ├── ConnFactory.java        # Fabrica de conexoes BD
│   │   ├── CrudBD.java             # Operacoes CRUD no banco
│   │   ├── User.java               # Modelo de usuario
│   │   ├── Question.java           # Modelo de pergunta
│   │   ├── QuestionForm.java       # Formulario de perguntas
│   │   ├── ShapeIcon.java          # Icones customizados
│   │   ├── GuiUser.java            # Tela de login
│   │   ├── GuiCentralAluno.java    # Painel central do aluno
│   │   ├── GuiCentralProfessor.java# Painel central do professor
│   │   ├── GuiQuestions.java       # Tela de quiz
│   │   ├── GuiSetQuiz.java         # Criacao de quizzes
│   │   ├── GuiEditQuestions.java   # Edicao de perguntas
│   │   ├── GuiViewResults.java     # Resultados do aluno
│   │   └── GuiViewResultsProfessor.java # Resultados geral
│   │
│   ├── bin/                        # Classes compiladas
│   ├── lib/                        # Dependencias externas
│   │   └── mysql-connector-j-8.4.0.jar
│   │
│   ├── Aktooh.jar                  # Aplicacao empacotada
│   ├── QuizApp_db.sql              # Script de criacao do BD
│   ├── Del_all.sql                 # Script para limpar BD
│   ├── Como_exe.txt                # Instrucoes de execucao
│   ├── Criar_jar.bat               # Script para criar JAR
│   └── README.md                   # Documentacao tecnica
│
├── Relatorio&Apresentacao/         # Documentacao academica
│   ├── Quiz educacional em Java com MySql.pdf
│   ├── Quiz educacional em Java com MySql.pptx
│   ├── relatorio_LP.docx
│   └── relatorio_LP.pdf
│
├── LICENSE                         # Licenca MIT
└── README.md                       # Este arquivo
```

---

## Pre-requisitos

Antes de executar o projeto, certifique-se de ter instalado:

- **Java JDK 8 ou superior**
  - [Download Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
  - [Download OpenJDK](https://openjdk.org/)
  
- **MySQL Server 8.0 ou superior**
  - [Download MySQL](https://dev.mysql.com/downloads/mysql/)
  
- **MySQL Workbench** (opcional, para gerenciar o banco)
  - [Download Workbench](https://dev.mysql.com/downloads/workbench/)

---

## Instalacao e Configuracao

### 1. Clone o repositorio

```bash
git clone https://github.com/MLC1202/ProjetoFinal_LP.git
cd ProjetoFinal_LP
```

### 2. Configure o banco de dados

Abra o MySQL e execute o script de criacao:

```bash
mysql -u root -p < "Projeto_semestral(Quiz)/QuizApp_db.sql"
```

Ou abra o arquivo `QuizApp_db.sql` no MySQL Workbench e execute.

### 3. Configure a conexao

Edite o arquivo `src/ConnFactory.java` com suas credenciais do MySQL:

```java
private static final String URL = "jdbc:mysql://localhost:3306/quizdb";
private static final String USER = "root";      // Seu usuario
private static final String PASSWORD = "senha"; // Sua senha
```

---

## Como Executar

### Opcao 1: Usar o JAR pre-compilado

```bash
cd "Projeto_semestral(Quiz)"
java -jar Aktooh.jar
```

Se houver erro de dependencia, execute com classpath:

```bash
java -cp "Aktooh.jar;lib/mysql-connector-j-8.4.0.jar" QuizApp
```

### Opcao 2: Compilar e executar

```bash
cd "Projeto_semestral(Quiz)/src"

# Compilar
javac -cp "../lib/mysql-connector-j-8.4.0.jar" -d ../bin *.java

# Executar
cd ../bin
java -cp ".;../lib/mysql-connector-j-8.4.0.jar" QuizApp
```

### Opcao 3: Criar JAR completo (fat JAR)

```bash
cd "Projeto_semestral(Quiz)/bin"
mkdir temp && cd temp
jar xf "../Aktooh.jar"
jar xf "../../lib/mysql-connector-j-8.4.0.jar"
jar cfe ../Aktooh_fat.jar QuizApp *
cd ..
java -jar Aktooh_fat.jar
```

---

## Modelagem do Banco de Dados

### Diagrama ER

O banco de dados `quizdb` possui as seguintes tabelas:

| Tabela | Descricao |
|--------|-----------|
| `users` | Armazena usuarios (alunos/professores) |
| `questions` | Banco de perguntas com 4 alternativas |
| `quizzes` | Quizzes criados pelos professores |
| `quiz_questions` | Relacao N:N entre quizzes e perguntas |
| `results` | Historico de resultados dos alunos |

### Estrutura das Tabelas

```sql
-- Usuarios
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    totalScore INT DEFAULT 0
);

-- Perguntas
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question VARCHAR(255) NOT NULL,
    optionA VARCHAR(100) NOT NULL,
    optionB VARCHAR(100) NOT NULL,
    optionC VARCHAR(100) NOT NULL,
    optionD VARCHAR(100) NOT NULL,
    correctOption INT NOT NULL
);

-- Quizzes
CREATE TABLE quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Relacao Quiz-Perguntas
CREATE TABLE quiz_questions (
    quiz_id INT NOT NULL,
    question_id INT NOT NULL,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Resultados
CREATE TABLE results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    quiz_name VARCHAR(255) NOT NULL,
    totalScore INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
```

---


## Documentacao

A pasta `Relatorio&Apresentacao/` contem:

- **relatorio_LP.pdf** - Relatorio completo do projeto
- **Quiz educacional em Java com MySql.pptx** - Apresentacao em slides
- **Diagramas** - Diagramas de requisitos, fluxo e banco de dados

---

## Equipe

| Nome | GitHub |
|------|--------|
| Felipe Fazio da Costa | - |
| Ruth Ramos Romeu | - |
| Matheus Antonio da Luz Cardoso | [@MLC1202](https://github.com/MLC1202) |
| Fernando Godoi Grinevicius | - |
| Jhonas | - |

---

## Licenca

Este projeto esta licenciado sob a Licenca MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

**Desenvolvido como projeto semestral da disciplina de Linguagem de Programacao - 2024**
