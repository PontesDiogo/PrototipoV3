-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 05-Dez-2022 às 15:17
-- Versão do servidor: 8.0.27
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `prototipo_tcc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB ;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`email`, `senha`, `nome`, `telefone`, `endereco`, `dataNasc`, `cidade`) VALUES
('teste@teste.com', '123456', 'Teste', 998888777, 'Rua teste', '2004-12-01', 'Tietê');

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidata`
--

DROP TABLE IF EXISTS `candidata`;
CREATE TABLE IF NOT EXISTS `candidata` (
  `fk_Aluno_email` varchar(100) DEFAULT NULL,
  `fk_Vagas_id` int DEFAULT NULL,
  `status` text,
  KEY `FK_Candidata_1` (`fk_Aluno_email`),
  KEY `FK_Candidata_2` (`fk_Vagas_id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int NOT NULL,
  `fk_Aluno_email` varchar(100) DEFAULT NULL,
  `fk_Vagas_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Chat_1` (`fk_Aluno_email`),
  KEY `FK_Chat_2` (`fk_Vagas_id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curriculo`
--

DROP TABLE IF EXISTS `curriculo`;
CREATE TABLE IF NOT EXISTS `curriculo` (
  `id` int NOT NULL,
  `fk_Aluno_email` varchar(100) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `escolaridade` varchar(100) DEFAULT NULL,
  `cursos` varchar(100) DEFAULT NULL,
  `experienciaProfissional` varchar(200) DEFAULT NULL,
  `infoAdicionais` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Curriculo_2` (`fk_Aluno_email`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cnpj` int DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) NOT NULL,
  `telefone` int DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formacao`
--

DROP TABLE IF EXISTS `formacao`;
CREATE TABLE IF NOT EXISTS `formacao` (
  `id` int NOT NULL,
  `fk_Curriculo_id` int DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `formAno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Formacao_1` (`fk_Curriculo_id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
CREATE TABLE IF NOT EXISTS `mensagem` (
  `fk_Chat_id` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `texto` varchar(300) DEFAULT NULL,
  `remetente` varchar(50) DEFAULT NULL,
  KEY `FK_Mensagem_1` (`fk_Chat_id`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vagas`
--

DROP TABLE IF EXISTS `vagas`;
CREATE TABLE IF NOT EXISTS `vagas` (
  `id` int NOT NULL,
  `fk_Empresa_id` int DEFAULT NULL,
  `vagaTitulo` varchar(50) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `dataAnuncio` date DEFAULT NULL,
  `vagasNum` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Vagas_2` (`fk_Empresa_id`)
) ENGINE=InnoDB ;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `candidata`
--
ALTER TABLE `candidata`
  ADD CONSTRAINT `FK_Candidata_1` FOREIGN KEY (`fk_Aluno_email`) REFERENCES `aluno` (`email`),
  ADD CONSTRAINT `FK_Candidata_2` FOREIGN KEY (`fk_Vagas_id`) REFERENCES `vagas` (`id`);

--
-- Limitadores para a tabela `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `FK_Chat_1` FOREIGN KEY (`fk_Aluno_email`) REFERENCES `aluno` (`email`),
  ADD CONSTRAINT `FK_Chat_2` FOREIGN KEY (`fk_Vagas_id`) REFERENCES `vagas` (`id`);

--
-- Limitadores para a tabela `curriculo`
--
ALTER TABLE `curriculo`
  ADD CONSTRAINT `FK_Curriculo_2` FOREIGN KEY (`fk_Aluno_email`) REFERENCES `aluno` (`email`);

--
-- Limitadores para a tabela `formacao`
--
ALTER TABLE `formacao`
  ADD CONSTRAINT `FK_Formacao_1` FOREIGN KEY (`fk_Curriculo_id`) REFERENCES `curriculo` (`id`);

--
-- Limitadores para a tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `FK_Mensagem_1` FOREIGN KEY (`fk_Chat_id`) REFERENCES `chat` (`id`);

--
-- Limitadores para a tabela `vagas`
--
ALTER TABLE `vagas`
  ADD CONSTRAINT `FK_Vagas_2` FOREIGN KEY (`fk_Empresa_id`) REFERENCES `empresa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
