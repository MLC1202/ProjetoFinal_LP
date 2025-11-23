-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS quizdb;
USE quizdb;

-- Tabela de usuários
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    totalScore INT DEFAULT 0
);

-- Tabelas de perguntas
DROP TABLE IF EXISTS questions_pt;
CREATE TABLE questions_pt (
    id INT PRIMARY KEY,
    question TEXT NOT NULL,
    optionA TEXT NOT NULL,
    optionB TEXT NOT NULL,
    optionC TEXT NOT NULL,
    optionD TEXT NOT NULL,
    correctOption INT NOT NULL
);
DROP TABLE IF EXISTS questions_en;
CREATE TABLE questions_en (
    id INT PRIMARY KEY,
    question TEXT NOT NULL,
    optionA TEXT NOT NULL,
    optionB TEXT NOT NULL,
    optionC TEXT NOT NULL,
    optionD TEXT NOT NULL,
    correctOption INT NOT NULL
);

DROP TABLE IF EXISTS questions_es;
CREATE TABLE questions_es (
    id INT PRIMARY KEY,
    question TEXT NOT NULL,
    optionA TEXT NOT NULL,
    optionB TEXT NOT NULL,
    optionC TEXT NOT NULL,
    optionD TEXT NOT NULL,
    correctOption INT NOT NULL
);

DROP TABLE IF EXISTS questions_fr;
CREATE TABLE questions_fr (
    id INT PRIMARY KEY,
    question TEXT NOT NULL,
    optionA TEXT NOT NULL,
    optionB TEXT NOT NULL,
    optionC TEXT NOT NULL,
    optionD TEXT NOT NULL,
    correctOption INT NOT NULL
);

DROP TABLE IF EXISTS questions_it;
CREATE TABLE questions_it (
    id INT PRIMARY KEY,
    question TEXT NOT NULL,
    optionA TEXT NOT NULL,
    optionB TEXT NOT NULL,
    optionC TEXT NOT NULL,
    optionD TEXT NOT NULL,
    correctOption INT NOT NULL
);

-- Inserção de perguntas
INSERT INTO questions_pt (id, question, optionA, optionB, optionC, optionD, correctOption) VALUES
(1, 'Qual é a capital da França?', 'Paris', 'Londres', 'Roma', 'Berlim', 0),
(2, 'Qual é o maior planeta do sistema solar?', 'Terra', 'Marte', 'Júpiter', 'Saturno', 2),
(3, 'Quem escreveu "Dom Quixote"?', 'Machado de Assis', 'Miguel de Cervantes', 'José de Alencar', 'Eça de Queirós', 1),
(4, 'Qual é o elemento químico representado pelo símbolo "O"?', 'Ouro', 'Oxigênio', 'Ozônio', 'Osmium', 1),
(5, 'Quem pintou a Mona Lisa?', 'Vincent van Gogh', 'Michelangelo', 'Leonardo da Vinci', 'Pablo Picasso', 2),
(6, 'Em que ano o homem pisou na Lua pela primeira vez?', '1965', '1969', '1972', '1980', 1),
(7, 'Qual é o animal terrestre mais rápido do mundo?', 'Leopardo', 'Guepardo', 'Tigre', 'Cavalo', 1),
(8, 'Qual é o menor país do mundo?', 'Mônaco', 'Malta', 'Vaticano', 'Liechtenstein', 2),
(9, 'Qual linguagem é usada para desenvolver aplicativos Android nativos?', 'Java', 'Python', 'Swift', 'Kotlin', 0),
(10, 'Quem desenvolveu a Teoria da Relatividade?', 'Isaac Newton', 'Nikola Tesla', 'Albert Einstein', 'Stephen Hawking', 2),
(11, 'Qual é o rio mais longo do mundo?', 'Amazonas', 'Nilo', 'Yangtzé', 'Mississipi', 1),
(12, 'Quem foi o primeiro presidente do Brasil?', 'Getúlio Vargas', 'Marechal Deodoro da Fonseca', 'Juscelino Kubitschek', 'Dom Pedro II', 1),
(13, 'Qual é o continente com mais países?', 'África', 'Ásia', 'Europa', 'América', 0),
(14, 'Qual é a fórmula da água?', 'H2O', 'CO2', 'NaCl', 'O2', 0),
(15, 'Em que país se originou o futebol?', 'Alemanha', 'Brasil', 'Inglaterra', 'Espanha', 2),
(16, 'Quantos planetas há no sistema solar?', '7', '8', '9', '10', 1),
(17, 'Qual é a moeda oficial do Japão?', 'Yuan', 'Won', 'Iene', 'Rupia', 2),
(18, 'Quem pintou o teto da Capela Sistina?', 'Donatello', 'Michelangelo', 'Rafael', 'Leonardo da Vinci', 1),
(19, 'Qual é a montanha mais alta do mundo?', 'K2', 'Everest', 'Mont Blanc', 'Aconcágua', 1),
(20, 'Em que continente está o deserto do Saara?', 'Ásia', 'América', 'África', 'Europa', 2),
(21, 'Qual é o maior oceano do planeta?', 'Atlântico', 'Índico', 'Ártico', 'Pacífico', 3),
(22, 'Qual é o nome do satélite natural da Terra?', 'Sol', 'Marte', 'Lua', 'Estrela', 2),
(23, 'Quem descobriu o Brasil?', 'Pedro Álvares Cabral', 'Cristóvão Colombo', 'Vasco da Gama', 'Fernão de Magalhães', 0),
(24, 'Quantos lados tem um quadrado?', '3', '4', '5', '6', 1),
(25, 'Qual é o plural de “pão”?', 'Pões', 'Pães', 'Pãos', 'Pãez', 1),
(26, 'Quem escreveu "O Pequeno Príncipe"?', 'Antoine de Saint-Exupéry', 'J.K. Rowling', 'Paulo Coelho', 'Monteiro Lobato', 0),
(27, 'Qual é o símbolo químico do ouro?', 'Au', 'Ag', 'O', 'Fe', 0),
(28, 'Qual é o resultado de 7 x 8?', '54', '56', '58', '64', 1),
(29, 'Qual desses animais é um mamífero?', 'Jacaré', 'Tubarão', 'Golfinho', 'Pato', 2),
(30, 'Qual país tem o formato de uma bota?', 'Brasil', 'Itália', 'França', 'Austrália', 1),
(31, 'Quem inventou a lâmpada elétrica?', 'Einstein', 'Newton', 'Thomas Edison', 'Tesla', 2),
(32, 'Qual é a cor da clorofila?', 'Azul', 'Vermelha', 'Verde', 'Amarela', 2),
(33, 'Qual planeta é conhecido como o "planeta vermelho"?', 'Mercúrio', 'Vênus', 'Marte', 'Júpiter', 2),
(34, 'Quem escreveu "A Odisséia"?', 'Sófocles', 'Aristóteles', 'Homero', 'Platão', 2),
(35, 'Qual é o maior mamífero do mundo?', 'Elefante', 'Hipopótamo', 'Baleia azul', 'Rinoceronte', 2),
(36, 'Qual a capital do Japão?', 'Pequim', 'Tóquio', 'Seul', 'Bangkok', 1),
(37, 'Quantas cores tem o arco-íris?', '5', '6', '7', '8', 2),
(38, 'Qual é o idioma oficial da Argentina?', 'Português', 'Espanhol', 'Francês', 'Inglês', 1),
(39, 'Quem foi o criador do Facebook?', 'Bill Gates', 'Steve Jobs', 'Mark Zuckerberg', 'Elon Musk', 2),
(40, 'Qual desses animais é um réptil?', 'Cobra', 'Cavalo', 'Tubarão', 'Gato', 0),
(41, 'Em que continente fica o Brasil?', 'Ásia', 'América do Sul', 'Europa', 'África', 1),
(42, 'Qual é o número pi (π) com duas casas decimais?', '3.12', '3.14', '3.15', '3.16', 1),
(43, 'Qual desses é um instrumento de corda?', 'Violão', 'Pandeiro', 'Flauta', 'Bateria', 0),
(44, 'Quem foi Albert Einstein?', 'Médico', 'Engenheiro', 'Cientista', 'Artista', 2),
(45, 'Em que estado brasileiro fica o Cristo Redentor?', 'São Paulo', 'Bahia', 'Rio de Janeiro', 'Minas Gerais', 2),
(46, 'Qual é o coletivo de lobos?', 'Alcateia', 'Manada', 'Bando', 'Rebanho', 0),
(47, 'Qual é o nome do processo pelo qual as plantas produzem seu alimento?', 'Respiração', 'Digestão', 'Fotossíntese', 'Transpiração', 2),
(48, 'Quantos segundos há em um minuto?', '30', '60', '90', '120', 1),
(49, 'Quem é conhecido como o "Pai da Computação"?', 'Alan Turing', 'Bill Gates', 'Steve Jobs', 'Tim Berners-Lee', 0),
(50, 'Qual é a capital da Austrália?', 'Sydney', 'Melbourne', 'Perth', 'Canberra', 3);

INSERT INTO questions_en (id, question, optionA, optionB, optionC, optionD, correctOption) VALUES
(1, 'What is the capital of France?', 'Paris', 'London', 'Rome', 'Berlin', 0),
(2, 'What is the largest planet in the solar system?', 'Earth', 'Mars', 'Jupiter', 'Saturn', 2),
(3, 'Who wrote "Don Quixote"?', 'Machado de Assis', 'Miguel de Cervantes', 'José de Alencar', 'Eça de Queirós', 1),
(4, 'Which chemical element is represented by the symbol "O"?', 'Gold', 'Oxygen', 'Ozone', 'Osmium', 1),
(5, 'Who painted the Mona Lisa?', 'Vincent van Gogh', 'Michelangelo', 'Leonardo da Vinci', 'Pablo Picasso', 2),
(6, 'In what year did man first set foot on the Moon?', '1965', '1969', '1972', '1980', 1),
(7, 'What is the fastest land animal in the world?', 'Leopard', 'Cheetah', 'Tiger', 'Horse', 1),
(8, 'What is the smallest country in the world?', 'Monaco', 'Malta', 'Vatican City', 'Liechtenstein', 2),
(9, 'Which language is used to develop native Android apps?', 'Java', 'Python', 'Swift', 'Kotlin', 0),
(10, 'Who developed the Theory of Relativity?', 'Isaac Newton', 'Nikola Tesla', 'Albert Einstein', 'Stephen Hawking', 2),
(11, 'What is the longest river in the world?', 'Amazon', 'Nile', 'Yangtze', 'Mississippi', 1),
(12, 'Who was the first president of Brazil?', 'Getúlio Vargas', 'Marshal Deodoro da Fonseca', 'Juscelino Kubitschek', 'Dom Pedro II', 1),
(13, 'Which continent has the most countries?', 'Africa', 'Asia', 'Europe', 'America', 0),
(14, 'What is the chemical formula of water?', 'H2O', 'CO2', 'NaCl', 'O2', 0),
(15, 'In which country did soccer originate?', 'Germany', 'Brazil', 'England', 'Spain', 2),
(16, 'How many planets are in the solar system?', '7', '8', '9', '10', 1),
(17, 'What is the official currency of Japan?', 'Yuan', 'Won', 'Yen', 'Rupee', 2),
(18, 'Who painted the ceiling of the Sistine Chapel?', 'Donatello', 'Michelangelo', 'Raphael', 'Leonardo da Vinci', 1),
(19, 'What is the highest mountain in the world?', 'K2', 'Everest', 'Mont Blanc', 'Aconcagua', 1),
(20, 'On which continent is the Sahara Desert located?', 'Asia', 'America', 'Africa', 'Europe', 2),
(21, 'What is the largest ocean on Earth?', 'Atlantic', 'Indian', 'Arctic', 'Pacific', 3),
(22, 'What is the name of Earth’s natural satellite?', 'Sun', 'Mars', 'Moon', 'Star', 2),
(23, 'Who discovered Brazil?', 'Pedro Álvares Cabral', 'Christopher Columbus', 'Vasco da Gama', 'Ferdinand Magellan', 0),
(24, 'How many sides does a square have?', '3', '4', '5', '6', 1),
(25, 'What is the plural of “pão” (bread)?', 'Pões', 'Pães', 'Pãos', 'Pãez', 1),
(26, 'Who wrote "The Little Prince"?', 'Antoine de Saint-Exupéry', 'J.K. Rowling', 'Paulo Coelho', 'Monteiro Lobato', 0),
(27, 'What is the chemical symbol for gold?', 'Au', 'Ag', 'O', 'Fe', 0),
(28, 'What is the result of 7 x 8?', '54', '56', '58', '64', 1),
(29, 'Which of these animals is a mammal?', 'Alligator', 'Shark', 'Dolphin', 'Duck', 2),
(30, 'Which country has the shape of a boot?', 'Brazil', 'Italy', 'France', 'Australia', 1),
(31, 'Who invented the electric light bulb?', 'Einstein', 'Newton', 'Thomas Edison', 'Tesla', 2),
(32, 'What is the color of chlorophyll?', 'Blue', 'Red', 'Green', 'Yellow', 2),
(33, 'Which planet is known as the “red planet”?', 'Mercury', 'Venus', 'Mars', 'Jupiter', 2),
(34, 'Who wrote "The Odyssey"?', 'Sophocles', 'Aristotle', 'Homer', 'Plato', 2),
(35, 'What is the largest mammal in the world?', 'Elephant', 'Hippopotamus', 'Blue whale', 'Rhinoceros', 2),
(36, 'What is the capital of Japan?', 'Beijing', 'Tokyo', 'Seoul', 'Bangkok', 1),
(37, 'How many colors are in a rainbow?', '5', '6', '7', '8', 2),
(38, 'What is the official language of Argentina?', 'Portuguese', 'Spanish', 'French', 'English', 1),
(39, 'Who created Facebook?', 'Bill Gates', 'Steve Jobs', 'Mark Zuckerberg', 'Elon Musk', 2),
(40, 'Which of these animals is a reptile?', 'Snake', 'Horse', 'Shark', 'Cat', 0),
(41, 'On which continent is Brazil located?', 'Asia', 'South America', 'Europe', 'Africa', 1),
(42, 'What is the value of pi (π) to two decimal places?', '3.12', '3.14', '3.15', '3.16', 1),
(43, 'Which of these is a string instrument?', 'Guitar', 'Tambourine', 'Flute', 'Drums', 0),
(44, 'Who was Albert Einstein?', 'Doctor', 'Engineer', 'Scientist', 'Artist', 2),
(45, 'In which Brazilian state is Christ the Redeemer located?', 'São Paulo', 'Bahia', 'Rio de Janeiro', 'Minas Gerais', 2),
(46, 'What is the collective noun for wolves?', 'Pack', 'Herd', 'Flock', 'Group', 0),
(47, 'What is the name of the process by which plants produce their food?', 'Respiration', 'Digestion', 'Photosynthesis', 'Transpiration', 2),
(48, 'How many seconds are in one minute?', '30', '60', '90', '120', 1),
(49, 'Who is known as the “Father of Computing”?', 'Alan Turing', 'Bill Gates', 'Steve Jobs', 'Tim Berners-Lee', 0),
(50, 'What is the capital of Australia?', 'Sydney', 'Melbourne', 'Perth', 'Canberra', 3);

INSERT INTO questions_es (id, question, optionA, optionB, optionC, optionD, correctOption) VALUES
(1, '¿Cuál es la capital de Francia?', 'París', 'Londres', 'Roma', 'Berlín', 0),
(2, '¿Cuál es el planeta más grande del sistema solar?', 'Tierra', 'Marte', 'Júpiter', 'Saturno', 2),
(3, '¿Quién escribió "Don Quijote"?', 'Machado de Assis', 'Miguel de Cervantes', 'José de Alencar', 'Eça de Queirós', 1),
(4, '¿Qué elemento químico está representado por el símbolo "O"?', 'Oro', 'Oxígeno', 'Ozono', 'Osmio', 1),
(5, '¿Quién pintó la Mona Lisa?', 'Vincent van Gogh', 'Miguel Ángel', 'Leonardo da Vinci', 'Pablo Picasso', 2),
(6, '¿En qué año llegó el hombre a la Luna por primera vez?', '1965', '1969', '1972', '1980', 1),
(7, '¿Cuál es el animal terrestre más rápido del mundo?', 'Leopardo', 'Guepardo', 'Tigre', 'Caballo', 1),
(8, '¿Cuál es el país más pequeño del mundo?', 'Mónaco', 'Malta', 'Vaticano', 'Liechtenstein', 2),
(9, '¿Qué lenguaje se utiliza para desarrollar aplicaciones nativas de Android?', 'Java', 'Python', 'Swift', 'Kotlin', 0),
(10, '¿Quién desarrolló la Teoría de la Relatividad?', 'Isaac Newton', 'Nikola Tesla', 'Albert Einstein', 'Stephen Hawking', 2),
(11, '¿Cuál es el río más largo del mundo?', 'Amazonas', 'Nilo', 'Yangtsé', 'Misisipi', 1),
(12, '¿Quién fue el primer presidente de Brasil?', 'Getúlio Vargas', 'Mariscal Deodoro da Fonseca', 'Juscelino Kubitschek', 'Dom Pedro II', 1),
(13, '¿Qué continente tiene más países?', 'África', 'Asia', 'Europa', 'América', 0),
(14, '¿Cuál es la fórmula del agua?', 'H2O', 'CO2', 'NaCl', 'O2', 0),
(15, '¿En qué país se originó el fútbol?', 'Alemania', 'Brasil', 'Inglaterra', 'España', 2),
(16, '¿Cuántos planetas hay en el sistema solar?', '7', '8', '9', '10', 1),
(17, '¿Cuál es la moneda oficial de Japón?', 'Yuan', 'Won', 'Yen', 'Rupia', 2),
(18, '¿Quién pintó el techo de la Capilla Sixtina?', 'Donatello', 'Miguel Ángel', 'Rafael', 'Leonardo da Vinci', 1),
(19, '¿Cuál es la montaña más alta del mundo?', 'K2', 'Everest', 'Mont Blanc', 'Aconcagua', 1),
(20, '¿En qué continente se encuentra el desierto del Sahara?', 'Asia', 'América', 'África', 'Europa', 2),
(21, '¿Cuál es el océano más grande del planeta?', 'Atlántico', 'Índico', 'Ártico', 'Pacífico', 3),
(22, '¿Cuál es el nombre del satélite natural de la Tierra?', 'Sol', 'Marte', 'Luna', 'Estrella', 2),
(23, '¿Quién descubrió Brasil?', 'Pedro Álvares Cabral', 'Cristóbal Colón', 'Vasco da Gama', 'Fernando de Magallanes', 0),
(24, '¿Cuántos lados tiene un cuadrado?', '3', '4', '5', '6', 1),
(25, '¿Cuál es el plural de “pão”?', 'Pões', 'Pães', 'Pãos', 'Pãez', 1),
(26, '¿Quién escribió "El Principito"?', 'Antoine de Saint-Exupéry', 'J.K. Rowling', 'Paulo Coelho', 'Monteiro Lobato', 0),
(27, '¿Cuál es el símbolo químico del oro?', 'Au', 'Ag', 'O', 'Fe', 0),
(28, '¿Cuál es el resultado de 7 x 8?', '54', '56', '58', '64', 1),
(29, '¿Cuál de estos animales es un mamífero?', 'Caimán', 'Tiburón', 'Delfín', 'Pato', 2),
(30, '¿Qué país tiene forma de bota?', 'Brasil', 'Italia', 'Francia', 'Australia', 1),
(31, '¿Quién inventó la lámpara eléctrica?', 'Einstein', 'Newton', 'Thomas Edison', 'Tesla', 2),
(32, '¿De qué color es la clorofila?', 'Azul', 'Rojo', 'Verde', 'Amarillo', 2),
(33, '¿Qué planeta es conocido como el "planeta rojo"?', 'Mercurio', 'Venus', 'Marte', 'Júpiter', 2),
(34, '¿Quién escribió "La Odisea"?', 'Sófocles', 'Aristóteles', 'Homero', 'Platón', 2),
(35, '¿Cuál es el mamífero más grande del mundo?', 'Elefante', 'Hipopótamo', 'Ballena azul', 'Rinoceronte', 2),
(36, '¿Cuál es la capital de Japón?', 'Pekín', 'Tokio', 'Seúl', 'Bangkok', 1),
(37, '¿Cuántos colores tiene el arco iris?', '5', '6', '7', '8', 2),
(38, '¿Cuál es el idioma oficial de Argentina?', 'Portugués', 'Español', 'Francés', 'Inglés', 1),
(39, '¿Quién creó Facebook?', 'Bill Gates', 'Steve Jobs', 'Mark Zuckerberg', 'Elon Musk', 2),
(40, '¿Cuál de estos animales es un reptil?', 'Serpiente', 'Caballo', 'Tiburón', 'Gato', 0),
(41, '¿En qué continente se encuentra Brasil?', 'Asia', 'Sudamérica', 'Europa', 'África', 1),
(42, '¿Cuál es el valor de pi (π) con dos decimales?', '3.12', '3.14', '3.15', '3.16', 1),
(43, '¿Cuál de estos es un instrumento de cuerda?', 'Guitarra', 'Pandereta', 'Flauta', 'Batería', 0),
(44, '¿Quién fue Albert Einstein?', 'Médico', 'Ingeniero', 'Científico', 'Artista', 2),
(45, '¿En qué estado brasileño se encuentra el Cristo Redentor?', 'São Paulo', 'Bahía', 'Río de Janeiro', 'Minas Gerais', 2),
(46, '¿Cuál es el colectivo de lobos?', 'Manada', 'Rebaño', 'Bandada', 'Grupo', 0),
(47, '¿Cómo se llama el proceso por el cual las plantas producen su alimento?', 'Respiración', 'Digestión', 'Fotosíntesis', 'Transpiración', 2),
(48, '¿Cuántos segundos hay en un minuto?', '30', '60', '90', '120', 1),
(49, '¿Quién es conocido como el "Padre de la Computación"?', 'Alan Turing', 'Bill Gates', 'Steve Jobs', 'Tim Berners-Lee', 0),
(50, '¿Cuál es la capital de Australia?', 'Sídney', 'Melbourne', 'Perth', 'Canberra', 3);

INSERT INTO questions_fr (id, question, optionA, optionB, optionC, optionD, correctOption) VALUES
(1, 'Quelle est la capitale de la France ?', 'Paris', 'Londres', 'Rome', 'Berlin', 0),
(2, 'Quelle est la plus grande planète du système solaire ?', 'Terre', 'Mars', 'Jupiter', 'Saturne', 2),
(3, 'Qui a écrit "Don Quichotte" ?', 'Machado de Assis', 'Miguel de Cervantes', 'José de Alencar', 'Eça de Queirós', 1),
(4, 'Quel élément chimique est représenté par le symbole "O" ?', 'Or', 'Oxygène', 'Ozone', 'Osmium', 1),
(5, 'Qui a peint la Joconde ?', 'Vincent van Gogh', 'Michel-Ange', 'Léonard de Vinci', 'Pablo Picasso', 2),
(6, 'En quelle année l’homme a-t-il marché sur la Lune pour la première fois ?', '1965', '1969', '1972', '1980', 1),
(7, 'Quel est l’animal terrestre le plus rapide au monde ?', 'Léopard', 'Guépard', 'Tigre', 'Cheval', 1),
(8, 'Quel est le plus petit pays du monde ?', 'Monaco', 'Malte', 'Vatican', 'Liechtenstein', 2),
(9, 'Quel langage est utilisé pour développer des applications Android natives ?', 'Java', 'Python', 'Swift', 'Kotlin', 0),
(10, 'Qui a développé la théorie de la relativité ?', 'Isaac Newton', 'Nikola Tesla', 'Albert Einstein', 'Stephen Hawking', 2),
(11, 'Quel est le fleuve le plus long du monde ?', 'Amazone', 'Nil', 'Yangtsé', 'Mississippi', 1),
(12, 'Qui a été le premier président du Brésil ?', 'Getúlio Vargas', 'Maréchal Deodoro da Fonseca', 'Juscelino Kubitschek', 'Dom Pedro II', 1),
(13, 'Quel est le continent qui compte le plus de pays ?', 'Afrique', 'Asie', 'Europe', 'Amérique', 0),
(14, 'Quelle est la formule de l’eau ?', 'H2O', 'CO2', 'NaCl', 'O2', 0),
(15, 'Dans quel pays le football est-il né ?', 'Allemagne', 'Brésil', 'Angleterre', 'Espagne', 2),
(16, 'Combien de planètes y a-t-il dans le système solaire ?', '7', '8', '9', '10', 1),
(17, 'Quelle est la monnaie officielle du Japon ?', 'Yuan', 'Won', 'Yen', 'Roupie', 2),
(18, 'Qui a peint le plafond de la chapelle Sixtine ?', 'Donatello', 'Michel-Ange', 'Raphaël', 'Léonard de Vinci', 1),
(19, 'Quelle est la plus haute montagne du monde ?', 'K2', 'Everest', 'Mont Blanc', 'Aconcagua', 1),
(20, 'Sur quel continent se trouve le désert du Sahara ?', 'Asie', 'Amérique', 'Afrique', 'Europe', 2),
(21, 'Quel est le plus grand océan du monde ?', 'Atlantique', 'Indien', 'Arctique', 'Pacifique', 3),
(22, 'Quel est le nom du satellite naturel de la Terre ?', 'Soleil', 'Mars', 'Lune', 'Étoile', 2),
(23, 'Qui a découvert le Brésil ?', 'Pedro Álvares Cabral', 'Christophe Colomb', 'Vasco de Gama', 'Fernand de Magellan', 0),
(24, 'Combien de côtés a un carré ?', '3', '4', '5', '6', 1),
(25, 'Quel est le pluriel de “pão” (pain) ?', 'Pões', 'Pães', 'Pãos', 'Pãez', 1),
(26, 'Qui a écrit "Le Petit Prince" ?', 'Antoine de Saint-Exupéry', 'J.K. Rowling', 'Paulo Coelho', 'Monteiro Lobato', 0),
(27, 'Quel est le symbole chimique de l’or ?', 'Au', 'Ag', 'O', 'Fe', 0),
(28, 'Quel est le résultat de 7 x 8 ?', '54', '56', '58', '64', 1),
(29, 'Lequel de ces animaux est un mammifère ?', 'Crocodile', 'Requin', 'Dauphin', 'Canard', 2),
(30, 'Quel pays a la forme d’une botte ?', 'Brésil', 'Italie', 'France', 'Australie', 1),
(31, 'Qui a inventé l’ampoule électrique ?', 'Einstein', 'Newton', 'Thomas Edison', 'Tesla', 2),
(32, 'De quelle couleur est la chlorophylle ?', 'Bleu', 'Rouge', 'Vert', 'Jaune', 2),
(33, 'Quelle planète est connue comme la “planète rouge” ?', 'Mercure', 'Vénus', 'Mars', 'Jupiter', 2),
(34, 'Qui a écrit "L’Odyssée" ?', 'Sophocle', 'Aristote', 'Homère', 'Platon', 2),
(35, 'Quel est le plus grand mammifère du monde ?', 'Éléphant', 'Hippopotame', 'Baleine bleue', 'Rhinocéros', 2),
(36, 'Quelle est la capitale du Japon ?', 'Pékin', 'Tokyo', 'Séoul', 'Bangkok', 1),
(37, 'Combien de couleurs y a-t-il dans un arc-en-ciel ?', '5', '6', '7', '8', 2),
(38, 'Quelle est la langue officielle de l’Argentine ?', 'Portugais', 'Espagnol', 'Français', 'Anglais', 1),
(39, 'Qui a créé Facebook ?', 'Bill Gates', 'Steve Jobs', 'Mark Zuckerberg', 'Elon Musk', 2),
(40, 'Lequel de ces animaux est un reptile ?', 'Serpent', 'Cheval', 'Requin', 'Chat', 0),
(41, 'Sur quel continent se trouve le Brésil ?', 'Asie', 'Amérique du Sud', 'Europe', 'Afrique', 1),
(42, 'Quelle est la valeur de pi (π) à deux décimales ?', '3.12', '3.14', '3.15', '3.16', 1),
(43, 'Lequel de ces instruments est à cordes ?', 'Guitare', 'Tambourin', 'Flûte', 'Batterie', 0),
(44, 'Qui était Albert Einstein ?', 'Médecin', 'Ingénieur', 'Scientifique', 'Artiste', 2),
(45, 'Dans quel État brésilien se trouve le Christ Rédempteur ?', 'São Paulo', 'Bahia', 'Rio de Janeiro', 'Minas Gerais', 2),
(46, 'Quel est le nom du groupe de loups ?', 'Meute', 'Troupeau', 'Volée', 'Groupe', 0),
(47, 'Comment s’appelle le processus par lequel les plantes produisent leur nourriture ?', 'Respiration', 'Digestion', 'Photosynthèse', 'Transpiration', 2),
(48, 'Combien de secondes y a-t-il dans une minute ?', '30', '60', '90', '120', 1),
(49, 'Qui est connu comme le “père de l’informatique” ?', 'Alan Turing', 'Bill Gates', 'Steve Jobs', 'Tim Berners-Lee', 0),
(50, 'Quelle est la capitale de l’Australie ?', 'Sydney', 'Melbourne', 'Perth', 'Canberra', 3);

INSERT INTO questions_it (id, question, optionA, optionB, optionC, optionD, correctOption) VALUES
(1, 'Qual è la capitale della Francia?', 'Parigi', 'Londra', 'Roma', 'Berlino', 0),
(2, 'Qual è il pianeta più grande del sistema solare?', 'Terra', 'Marte', 'Giove', 'Saturno', 2),
(3, 'Chi ha scritto "Don Chisciotte"?', 'Machado de Assis', 'Miguel de Cervantes', 'José de Alencar', 'Eça de Queirós', 1),
(4, 'Quale elemento chimico è rappresentato dal simbolo "O"?', 'Oro', 'Ossigeno', 'Ozono', 'Osmio', 1),
(5, 'Chi ha dipinto la Gioconda?', 'Vincent van Gogh', 'Michelangelo', 'Leonardo da Vinci', 'Pablo Picasso', 2),
(6, 'In quale anno l’uomo è sbarcato sulla Luna per la prima volta?', '1965', '1969', '1972', '1980', 1),
(7, 'Qual è l’animale terrestre più veloce del mondo?', 'Leopardo', 'Ghepardo', 'Tigre', 'Cavallo', 1),
(8, 'Qual è il paese più piccolo del mondo?', 'Monaco', 'Malta', 'Vaticano', 'Liechtenstein', 2),
(9, 'Quale linguaggio si usa per sviluppare app Android native?', 'Java', 'Python', 'Swift', 'Kotlin', 0),
(10, 'Chi ha sviluppato la teoria della relatività?', 'Isaac Newton', 'Nikola Tesla', 'Albert Einstein', 'Stephen Hawking', 2),
(11, 'Qual è il fiume più lungo del mondo?', 'Amazzonia', 'Nilo', 'Yangtze', 'Mississippi', 1),
(12, 'Chi è stato il primo presidente del Brasile?', 'Getúlio Vargas', 'Maresciallo Deodoro da Fonseca', 'Juscelino Kubitschek', 'Dom Pedro II', 1),
(13, 'Quale continente ha più paesi?', 'Africa', 'Asia', 'Europa', 'America', 0),
(14, 'Qual è la formula dell’acqua?', 'H2O', 'CO2', 'NaCl', 'O2', 0),
(15, 'In quale paese è nato il calcio?', 'Germania', 'Brasile', 'Inghilterra', 'Spagna', 2),
(16, 'Quanti pianeti ci sono nel sistema solare?', '7', '8', '9', '10', 1),
(17, 'Qual è la valuta ufficiale del Giappone?', 'Yuan', 'Won', 'Yen', 'Rupia', 2),
(18, 'Chi ha dipinto il soffitto della Cappella Sistina?', 'Donatello', 'Michelangelo', 'Raffaello', 'Leonardo da Vinci', 1),
(19, 'Qual è la montagna più alta del mondo?', 'K2', 'Everest', 'Monte Bianco', 'Aconcagua', 1),
(20, 'In quale continente si trova il deserto del Sahara?', 'Asia', 'America', 'Africa', 'Europa', 2),
(21, 'Qual è l’oceano più grande del mondo?', 'Atlantico', 'Indiano', 'Artico', 'Pacifico', 3),
(22, 'Come si chiama il satellite naturale della Terra?', 'Sole', 'Marte', 'Luna', 'Stella', 2),
(23, 'Chi ha scoperto il Brasile?', 'Pedro Álvares Cabral', 'Cristoforo Colombo', 'Vasco da Gama', 'Ferdinando Magellano', 0),
(24, 'Quanti lati ha un quadrato?', '3', '4', '5', '6', 1),
(25, 'Qual è il plurale di “pão” (pane)?', 'Pões', 'Pães', 'Pãos', 'Pãez', 1),
(26, 'Chi ha scritto "Il Piccolo Principe"?', 'Antoine de Saint-Exupéry', 'J.K. Rowling', 'Paulo Coelho', 'Monteiro Lobato', 0),
(27, 'Qual è il simbolo chimico dell’oro?', 'Au', 'Ag', 'O', 'Fe', 0),
(28, 'Quanto fa 7 x 8?', '54', '56', '58', '64', 1),
(29, 'Quale di questi animali è un mammifero?', 'Coccodrillo', 'Squalo', 'Delfino', 'Anatra', 2),
(30, 'Quale paese ha la forma di uno stivale?', 'Brasile', 'Italia', 'Francia', 'Australia', 1),
(31, 'Chi ha inventato la lampadina elettrica?', 'Einstein', 'Newton', 'Thomas Edison', 'Tesla', 2),
(32, 'Di che colore è la clorofilla?', 'Blu', 'Rosso', 'Verde', 'Giallo', 2),
(33, 'Quale pianeta è conosciuto come il "pianeta rosso"?', 'Mercurio', 'Venere', 'Marte', 'Giove', 2),
(34, 'Chi ha scritto "L’Odissea"?', 'Sofocle', 'Aristotele', 'Omero', 'Platone', 2),
(35, 'Qual è il più grande mammifero del mondo?', 'Elefante', 'Ippopotamo', 'Balena blu', 'Rinoceronte', 2),
(36, 'Qual è la capitale del Giappone?', 'Pechino', 'Tokyo', 'Seul', 'Bangkok', 1),
(37, 'Quanti colori ha l’arcobaleno?', '5', '6', '7', '8', 2),
(38, 'Qual è la lingua ufficiale dell’Argentina?', 'Portoghese', 'Spagnolo', 'Francese', 'Inglese', 1),
(39, 'Chi ha creato Facebook?', 'Bill Gates', 'Steve Jobs', 'Mark Zuckerberg', 'Elon Musk', 2),
(40, 'Quale di questi animali è un rettile?', 'Serpente', 'Cavallo', 'Squalo', 'Gatto', 0),
(41, 'In quale continente si trova il Brasile?', 'Asia', 'Sud America', 'Europa', 'Africa', 1),
(42, 'Qual è il valore di pi greco (π) con due decimali?', '3.12', '3.14', '3.15', '3.16', 1),
(43, 'Quale di questi è uno strumento a corde?', 'Chitarra', 'Tamburello', 'Flauto', 'Batteria', 0),
(44, 'Chi era Albert Einstein?', 'Medico', 'Ingegnere', 'Scienziato', 'Artista', 2),
(45, 'In quale stato brasiliano si trova il Cristo Redentore?', 'São Paulo', 'Bahia', 'Rio de Janeiro', 'Minas Gerais', 2),
(46, 'Qual è il nome del gruppo di lupi?', 'Branco', 'Mandria', 'Stormo', 'Gregge', 0),
(47, 'Come si chiama il processo con cui le piante producono il loro cibo?', 'Respirazione', 'Digestione', 'Fotosintesi', 'Traspirazione', 2),
(48, 'Quanti secondi ci sono in un minuto?', '30', '60', '90', '120', 1),
(49, 'Chi è conosciuto come il "padre dell’informatica"?', 'Alan Turing', 'Bill Gates', 'Steve Jobs', 'Tim Berners-Lee', 0),
(50, 'Qual è la capitale dell’Australia?', 'Sydney', 'Melbourne', 'Perth', 'Canberra', 3);

-- Tabela de quizzes
DROP TABLE IF EXISTS quizzes;
CREATE TABLE quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Tabela de associação quiz-pergunta
DROP TABLE IF EXISTS quiz_questions;
CREATE TABLE quiz_questions (
    quiz_id INT NOT NULL,
    question_id INT NOT NULL,
    
    -- Mantemos a FK do quiz, pois a tabela 'quizzes' existe
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
    
    -- APAGAMOS a linha abaixo. O MySQL não vai mais verificar se a pergunta existe.
    -- FOREIGN KEY (question_id) REFERENCES questions(id) 
);


-- Tabela de resultados (corrigida)
DROP TABLE IF EXISTS results;
CREATE TABLE results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    quiz_name VARCHAR(255) NOT NULL,
    totalScore INT NOT NULL,	
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Consultas para verificação
SELECT * FROM users;
SELECT * FROM questions_pt; -- <-- Use uma tabela específica para testar
SELECT * FROM questions_fr;
SELECT * FROM quizzes;
SELECT * FROM results;
DESCRIBE questions_pt;      -- <-- Use uma tabel