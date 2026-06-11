CREATE TABLE [LIVRO] (
	[id_livro] int IDENTITY(1,1) NOT NULL,
	[titulo] nvarchar(150) NOT NULL,
	[ISBN] nvarchar(20) UNIQUE,
	[ano_publicado] int,
	[quantidade] int NOT NULL,
	[disponivel] bit NOT NULL,
	[descricao] nvarchar(max),
	[id_categoria] int NOT NULL,
	[id_autor] int NOT NULL,
	PRIMARY KEY ([id_livro])
);
CREATE TABLE [Usuario] (
	[id_usuario] int IDENTITY(1,1) NOT NULL,
	[nome] nvarchar(100) NOT NULL,
	[email] nvarchar(100) NOT NULL UNIQUE,
	[telefone] nvarchar(20),
	[endereco] nvarchar(200) NOT NULL,
	[data_nascimento] date,
	[cpf] nvarchar(14) NOT NULL UNIQUE,
	[tipo_usuario] nvarchar(20) NOT NULL DEFAULT 'aluno',
	[data_cadastro] date NOT NULL,
	PRIMARY KEY ([id_usuario])
);
CREATE TABLE [autor] (
	[id_autor] int IDENTITY(1,1) NOT NULL,
	[nacionalidade] nvarchar(50),
	[nome] nvarchar(100) NOT NULL,
	[data_de_nascimento] date,
	[biografia] nvarchar(max),
	PRIMARY KEY ([id_autor])
);
CREATE TABLE [Emprestimo] (
	[id_emprestimo] int IDENTITY(1,1) NOT NULL,
	[id_usuario] int NOT NULL,
	[id_livro] int NOT NULL,
	[data_de_emprestimo] date NOT NULL,
	[data_de_devolucao] date NOT NULL,
	[status] nvarchar(20) NOT NULL,
	PRIMARY KEY ([id_emprestimo])
);
CREATE TABLE [Categoria] (
	[id_categoria] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome_categoria] nvarchar(50) NOT NULL,
	[descricao] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_categoria])
);
ALTER TABLE [LIVRO] ADD CONSTRAINT [LIVRO_fk7] FOREIGN KEY ([id_categoria]) REFERENCES [Categoria]([id_categoria]);
ALTER TABLE [LIVRO] ADD CONSTRAINT [LIVRO_fk8] FOREIGN KEY ([id_autor]) REFERENCES [autor]([id_autor]);
ALTER TABLE [Emprestimo] ADD CONSTRAINT [Emprestimo_fk1] FOREIGN KEY ([id_usuario]) REFERENCES [Usuario]([id_usuario]);
ALTER TABLE [Emprestimo] ADD CONSTRAINT [Emprestimo_fk2] FOREIGN KEY ([id_livro]) REFERENCES [LIVRO]([id_livro]);