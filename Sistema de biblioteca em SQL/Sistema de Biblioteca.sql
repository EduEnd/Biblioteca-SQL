CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE Funcionarios(
   id_funcio INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_funcio),
   nome VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   senha VARCHAR(50)NOT NULL,
   cpf VARCHAR(50)NOT NULL,
   endereco VARCHAR(50)NOT NULL,
   telefone VARCHAR(50)NOT NULL
);
INSERT INTO Funcionarios(nome,email,senha,cpf,endereco,telefone)
VALUES('João Jesus','joaoj34@hotmail.com','0400','937.589.710-98','Rua Tancredo Neves','74936469881'),
      ('Paulo Santos','paulinho@gmail.com','2892','819.653.970-34','Rua Anísio Marques','74981278490'),
	  ('Carlos Matos','carlaomatos2020@hotmail.com','2000','776.460.430-52','Rua São Jorge','74988654802');
SELECT *FROM Funcionarios;

CREATE TABLE Livros (
    id_livro INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(  id_livro ),
    isbn VARCHAR(50) NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    idioma VARCHAR(50) NOT NULL,
    qtd INTEGER,
    ano_pub INTEGER,
    edicao INTEGER,
    registro INT, FOREIGN KEY(registro)REFERENCES Funcionarios(id_funcio)
);
INSERT INTO Livros(isbn,titulo,idioma,qtd, ano_pub,edicao,registro)
VALUES ('9788598078304','Crepúsculo','português', 5, '2006', 1,1),
       ('9788532523051','Harry Potter e a Pedra Filosofal', 'português', 8, '2000', 1,2),
	   ('9788595081512', 'O Pequeno Príncipe','português', 3,'2018', 1,3);
SELECT *FROM Livros; 

CREATE TABLE Autor (
    id_autor INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_autor),
    nome VARCHAR(50)NOT NULL,
    origem VARCHAR(50)NOT NULL
);
INSERT INTO Autor(nome,origem)
VALUES('Stephen Meyer','Argentina'),
	  ('J. K. Rowling','Lapão'),
      ('Antoine de Saint Exupéry','Francês');
SELECT *FROM Autor;

CREATE TABLE Editora (
    id_editora INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_editora),
    nome VARCHAR(50)NOT NULL
);
INSERT INTO Editora(nome)
VALUES('Intrínseca'),
      ('Rocco'), 
      ('HarperCollins');
SELECT *FROM Editora;
      
CREATE TABLE Genero (
    id_genero INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_genero),
    genero VARCHAR(50)NOT NULL
);
INSERT INTO Genero(genero)
VALUES('Romance'),
      ('Fantasia'),
      ('Novela');
SELECT *FROM Genero;
      
CREATE TABLE Aluno (
    matricula INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(matricula),
    nome VARCHAR(50)NOT NULL,
    email_institucional VARCHAR(50)NOT NULL,
    cpf VARCHAR(50)NOT NULL,
    endereco VARCHAR(50)NOT NULL,
    telefone VARCHAR(50)NOT NULL
);
INSERT INTO Aluno(nome,email_institucional,cpf,endereco,telefone)
VALUES('Marcos Silva','20201ireads0001@ifba.edu.br','724.005.290-78','Rua Juarez Garcia da Silva','7499934455122'),
      ('Rosa Albuquerque','20201ireads0002@ifba.edu.br','503.733.510-89','Rua Oliveira Ribeiro','7499954321034'),
	  ('Ana Souza','20201ireads0003@ifba.edu.br','172.390.070-22','Rua Copacabana','7999345678456');
SELECT *FROM Aluno;
      
CREATE TABLE Cliente(
   id_cliente INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_cliente),
   nome VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   senha VARCHAR(50)NOT NULL,
   cpf VARCHAR(50)NOT NULL,
   endereco VARCHAR(50)NOT NULL,
   telefone VARCHAR(50)NOT NULL
);
INSERT INTO Cliente(nome,email,senha,cpf,endereco,telefone)
VALUES('Julia Machado','julinha_12@hotmail.com','33333','180.457.520-84','Avenida São Benedito','749991356749'),
      ('Rosa Albuquerque','albuquerque_rah@gmail.com','12345','173.325.650-48','Rua das Andirobas','749994445556'),
      ('Filipe Pato','fefe_pato19@gmail.com','91919','736.221.130-90','Rua Espírito Santo ','749996759034'); 
SELECT *FROM Cliente;      
      
CREATE TABLE Autor_livro(
   id_autor INT, FOREIGN KEY(id_autor)REFERENCES Autor(id_autor),
   id_livro INT, FOREIGN KEY(id_livro)REFERENCES Livros(id_livro),
   PRIMARY KEY(id_autor,id_livro)
);
INSERT INTO Autor_livro(id_autor,id_livro)
VALUES(1,1),(2,2),(3,3);
SELECT * FROM Autor_livro;

CREATE TABLE Editora_Livro(
id_livro INT , id_editora INT, 
FOREIGN KEY(id_livro) REFERENCES Livros(id_livro), 
FOREIGN KEY(id_editora) REFERENCES Editora(id_editora),
PRIMARY KEY(id_editora,id_livro));
INSERT INTO Editora_Livro (id_livro,id_editora) VALUES (1,1),(2,2),(3,3);
SELECT * FROM Editora_Livro;

CREATE TABLE Genero_livro(
   id_genero int, FOREIGN KEY(id_genero)REFERENCES Genero(id_genero),
   id_livro int, FOREIGN KEY(id_livro)REFERENCES Livros(id_livro),
   PRIMARY KEY(id_genero,id_livro)
);
 INSERT INTO Genero_livro(id_livro,id_genero)
 VALUES (1,1),(2,2),(3,3);
SELECT *FROM Genero_livro;

CREATE TABLE Aluguel(
  id_aluguel INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_aluguel),
  id_livro INT, FOREIGN KEY(id_livro)REFERENCES Livros(id_livro),
  matricula INT, FOREIGN KEY(matricula)REFERENCES Aluno(matricula),
  data_emprestimo VARCHAR(20)NOT NULL,
  data_devolucao VARCHAR(20)NOT NULL,
  situacao VARCHAR(20)NOT NULL
);
   INSERT INTO Aluguel(id_livro, matricula, data_emprestimo, data_devolucao, situacao)
   VALUES(1,1,'15/01/2023','22/01/2023','devolvido'),
         (2,2,'23/03/2023','30/03/2023','atrasado'),
         (3,3,'07/02/2023','14/02/2023','no prazo');
SELECT *FROM Aluguel;         
   
CREATE TABLE Vendas(
  id_vendas INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_vendas),
  id_livro INT, FOREIGN KEY(id_livro) REFERENCES Livros(id_livro),  
  id_cliente INT, FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente), 
  valor FLOAT
 );
INSERT INTO Vendas (id_livro, id_cliente, valor) 
VALUES (1,1,5.99),
	   (2,2,25.99),
       (3,3,15.00);
SELECT * FROM Vendas;

  CREATE TABLE Doacao(
   id_doacao INT NOT NULL AUTO_INCREMENT,PRIMARY KEY (id_doacao),
   id_livro INT, FOREIGN KEY(id_livro) REFERENCES Livros(id_livro),
   matricula INT NOT NULL, FOREIGN KEY(matricula)REFERENCES Aluno(matricula),
   qtd INT
);
INSERT INTO Doacao (id_livro, matricula, qtd) 
VALUES (1,1,5),
	   (2,2,2),
       (3,3,5);
SELECT * FROM Doacao;