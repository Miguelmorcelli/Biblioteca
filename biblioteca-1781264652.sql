CREATE TABLE IF NOT EXISTS `LIVRO` (
	`id_livro` int AUTO_INCREMENT NOT NULL,
	`titulo` varchar(150) NOT NULL,
	`ISBN` varchar(20) UNIQUE,
	`ano_publicado` int,
	`quantidade` int NOT NULL,
	`disponivel` boolean NOT NULL,
	`descricao` text,
	`id_categoria` int NOT NULL,
	`id_autor` int NOT NULL,
	PRIMARY KEY (`id_livro`)
);
CREATE TABLE IF NOT EXISTS `Usuario` (
	`id_usuario` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(100) NOT NULL,
	`email` varchar(100) NOT NULL UNIQUE,
	`telefone` varchar(20),
	`endereco` varchar(200) NOT NULL,
	`data_nascimento` date,
	`cpf` varchar(14) NOT NULL UNIQUE,
	`tipo_usuario` varchar(20) NOT NULL DEFAULT 'aluno',
	`data_cadastro` date NOT NULL,
	PRIMARY KEY (`id_usuario`)
);
CREATE TABLE IF NOT EXISTS `autor` (
	`id_autor` int AUTO_INCREMENT NOT NULL,
	`nacionalidade` varchar(50),
	`nome` varchar(100) NOT NULL,
	`data_de_nascimento` date,
	`biografia` text,
	PRIMARY KEY (`id_autor`)
);
CREATE TABLE IF NOT EXISTS `Emprestimo` (
	`id_emprestimo` int AUTO_INCREMENT NOT NULL,
	`id_usuario` int NOT NULL,
	`id_livro` int NOT NULL,
	`data_de_emprestimo` date NOT NULL,
	`data_de_devolucao` date NOT NULL,
	`status` varchar(20) NOT NULL,
	PRIMARY KEY (`id_emprestimo`)
);
CREATE TABLE IF NOT EXISTS `Categoria` (
	`id_categoria` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_categoria` varchar(50) NOT NULL,
	`descricao` text NOT NULL,
	PRIMARY KEY (`id_categoria`)
);
ALTER TABLE `LIVRO` ADD CONSTRAINT `LIVRO_fk7` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria`(`id_categoria`);
ALTER TABLE `LIVRO` ADD CONSTRAINT `LIVRO_fk8` FOREIGN KEY (`id_autor`) REFERENCES `autor`(`id_autor`);
ALTER TABLE `Emprestimo` ADD CONSTRAINT `Emprestimo_fk1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario`(`id_usuario`);
ALTER TABLE `Emprestimo` ADD CONSTRAINT `Emprestimo_fk2` FOREIGN KEY (`id_livro`) REFERENCES `LIVRO`(`id_livro`);