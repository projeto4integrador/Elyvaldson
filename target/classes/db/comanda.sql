-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01-Set-2017 às 06:49
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comanda`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_adcional`
--

CREATE TABLE `web_adicional` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(50) COLLATE utf8_bin NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `web_adcional`
--

INSERT INTO `web_adicional` (`id`, `nome`, `valor`) VALUES
(1, 'Salada', 3.7),
(2, 'Lanches', 20.7),
(3, 'Pizzas', 21.4),
(4, 'Ovo', 1.6),
(5, 'Cebola', 1),
(6, 'Mandioca', 2.4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_caixa`
--

CREATE TABLE `web_caixa` (
  `id` bigint(20) NOT NULL,
  `saldo_inicial` double NOT NULL,
  `saldo_final` double NOT NULL,
  `hora_inicial` datetime NOT NULL,
  `hora_final` datetime NOT NULL,
  `observacao` varchar(500) COLLATE utf8_bin NOT NULL,
  `status` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `web_caixa`
--

INSERT INTO `web_caixa` (`id`, `saldo_inicial`, `saldo_final`, `hora_inicial`, `hora_final`, `observacao`, `status`) VALUES
(1, 100, 120, '2017-08-31 00:00:00', '2017-08-31 00:00:00', 'CAixa11', 'ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_categoria`
--

CREATE TABLE `web_categoria` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `web_categoria`
--

INSERT INTO `web_categoria` (`id`, `descricao`) VALUES
(1, 'Bebidas'),
(2, 'Sobremesa'),
(3, 'Pratos'),
(4, 'Petiscos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_detalhe_adcional`
--

CREATE TABLE `web_detalhe_adcional` (
  `id_categoria` bigint(20) NOT NULL,
  `id_adcional` bigint(20) NOT NULL,
  `observacao` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_detalhe_caixa`
--

CREATE TABLE `web_detalhe_caixa` (
  `id` bigint(11) NOT NULL,
  `id_caixa` bigint(11) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(255) COLLATE utf8_bin NOT NULL,
  `valor_entrada` double NOT NULL,
  `valor_saida` double NOT NULL,
  `observacao` varchar(500) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `web_detalhe_caixa`
--

INSERT INTO `web_detalhe_caixa` (`id`, `id_caixa`, `data`, `descricao`, `valor_entrada`, `valor_saida`, `observacao`) VALUES
(1, 1, '2017-08-31 00:00:00', 'detalhamento caixa', 100, 120, 'detalhamento caixa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_detalhe_pedido`
--

CREATE TABLE `web_detalhe_pedido` (
  `id` bigint(20) NOT NULL,
  `id_produto` bigint(20) NOT NULL,
  `id_pedido` bigint(20) NOT NULL,
  `quantidade` varchar(45) COLLATE utf8_bin NOT NULL,
  `valor_unitario` double NOT NULL,
  `valor_total` double NOT NULL,
  `observacao` varchar(500) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_mesa`
--

CREATE TABLE `web_mesa` (
  `id` bigint(20) NOT NULL,
  `numero` varchar(45) COLLATE utf8_bin NOT NULL,
  `disponivel` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `web_mesa`
--

INSERT INTO `web_mesa` (`id`, `numero`, `disponivel`) VALUES
(1, 'Mesa 1', 'SIM'),
(2, 'Mesa 2', 'SIM'),
(3, 'Mesa 3', 'SIM'),
(4, 'Mesa 4', 'SIM'),
(5, 'Mesa 5', 'SIM'),
(6, 'Mesa 6', 'SIM'),
(7, 'Mesa 7', 'SIM'),
(8, 'Mesa 8', 'SIM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_pedido`
--

CREATE TABLE `web_pedido` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_mesa` bigint(20) NOT NULL,
  `valor_total` double NOT NULL,
  `situacao` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_perfil_acesso`
--

CREATE TABLE `web_perfil_acesso` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `web_perfil_acesso`
--

INSERT INTO `web_perfil_acesso` (`id`, `descricao`) VALUES
(1, 'Administrador'),
(2, 'Garçom'),
(3, 'Atendente'),
(4, 'Caixa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_preparo`
--

CREATE TABLE `web_preparo` (
  `id` bigint(20) NOT NULL,
  `id_pedido` bigint(20) NOT NULL,
  `id_mesa` bigint(20) NOT NULL,
  `id_produto` bigint(20) NOT NULL,
  `observacao` varchar(500) COLLATE utf8_bin NOT NULL,
  `hora` datetime NOT NULL,
  `status` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_produto`
--

CREATE TABLE `web_produto` (
  `id` bigint(20) NOT NULL,
  `id_categoria` bigint(20) NOT NULL,
  `descricao` varchar(50) COLLATE utf8_bin NOT NULL,
  `valor` double NOT NULL,
  `situacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `web_produto`
--

INSERT INTO `web_produto` (`id`, `id_categoria`, `descricao`, `valor`, `situacao`) VALUES
(1, 1, 'Refrigerante lata 350 ml', 4, 0),
(2, 1, 'Refrigerante 600 ml', 5, 0),
(3, 1, 'Cerveja lata', 4, 0),
(4, 1, '�?gua mineral', 2.5, 0),
(5, 1, 'Refrigerante 2 L', 6, 0),
(6, 2, 'Três chocolates', 5, 0),
(7, 2, 'Petit gateau', 8.6, 0),
(8, 3, 'Prato da segunda feira - Picadinho com batata', 13.8, 0),
(9, 3, 'Prato da terça feira - Linguiça aurora com ovo', 13.8, 0),
(10, 3, 'Prato da quarta feira - Bisteca com ovo', 13.8, 0),
(11, 3, 'Prata da quinta feira - Frango ao molho com batata', 13.8, 0),
(12, 3, 'Prata da sexta feira - Linguiça aurora simples', 13.8, 0),
(13, 4, 'Porção de Cenoura', 5.9, 0),
(14, 4, 'Porção de Carne - Espetinho', 9.9, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_usuario`
--

CREATE TABLE `web_usuario` (
  `id` bigint(20) NOT NULL,
  `id_perfil_acesso` bigint(20) NOT NULL,
  `nome` varchar(45) COLLATE utf8_bin NOT NULL,
  `usuario` varchar(25) COLLATE utf8_bin NOT NULL,
  `senha` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `web_usuario`
--

INSERT INTO `web_usuario` (`id`, `id_perfil_acesso`, `nome`, `usuario`, `senha`) VALUES
(1, 1, 'André Luiz', 'andre', '1234'),
(2, 2, 'Marcelo Castro', 'marcelo', '1234'),
(3, 3, 'Natasha Martins', 'nat', '1234'),
(4, 4, 'Lanna Sofia', 'lanna', '1234'),
(5, 2, 'Alice Natario', 'alice', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `web_adcional`
--
ALTER TABLE `web_adcional`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_caixa`
--
ALTER TABLE `web_caixa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_categoria`
--
ALTER TABLE `web_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_detalhe_adcional`
--
ALTER TABLE `web_detalhe_adcional`
  ADD KEY `fk_adcional_id` (`id_adcional`),
  ADD KEY `fk_categoria_detalhe_id` (`id_categoria`);

--
-- Indexes for table `web_detalhe_caixa`
--
ALTER TABLE `web_detalhe_caixa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_caixa_id` (`id_caixa`);

--
-- Indexes for table `web_detalhe_pedido`
--
ALTER TABLE `web_detalhe_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_id` (`id_pedido`),
  ADD KEY `fk_produto_id` (`id_produto`);

--
-- Indexes for table `web_mesa`
--
ALTER TABLE `web_mesa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_pedido`
--
ALTER TABLE `web_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mesa_id` (`id_mesa`),
  ADD KEY `fk_usuario_id` (`id_usuario`);

--
-- Indexes for table `web_perfil_acesso`
--
ALTER TABLE `web_perfil_acesso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_preparo`
--
ALTER TABLE `web_preparo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_pedido` (`id_pedido`),
  ADD KEY `fk_id_mesa` (`id_mesa`),
  ADD KEY `fk_id_produto` (`id_produto`);

--
-- Indexes for table `web_produto`
--
ALTER TABLE `web_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria_id` (`id_categoria`);

--
-- Indexes for table `web_usuario`
--
ALTER TABLE `web_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_perfil_acesso_id` (`id_perfil_acesso`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `web_adcional`
--
ALTER TABLE `web_adcional`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `web_caixa`
--
ALTER TABLE `web_caixa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `web_categoria`
--
ALTER TABLE `web_categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `web_detalhe_caixa`
--
ALTER TABLE `web_detalhe_caixa`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `web_detalhe_pedido`
--
ALTER TABLE `web_detalhe_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `web_mesa`
--
ALTER TABLE `web_mesa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `web_pedido`
--
ALTER TABLE `web_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `web_perfil_acesso`
--
ALTER TABLE `web_perfil_acesso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `web_preparo`
--
ALTER TABLE `web_preparo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `web_produto`
--
ALTER TABLE `web_produto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `web_usuario`
--
ALTER TABLE `web_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `web_detalhe_adcional`
--
ALTER TABLE `web_detalhe_adcional`
  ADD CONSTRAINT `fk_adcional_id` FOREIGN KEY (`id_adcional`) REFERENCES `web_adcional` (`id`),
  ADD CONSTRAINT `fk_categoria_detalhe_id` FOREIGN KEY (`id_categoria`) REFERENCES `web_categoria` (`id`);

--
-- Limitadores para a tabela `web_detalhe_caixa`
--
ALTER TABLE `web_detalhe_caixa`
  ADD CONSTRAINT `fk_caixa_id` FOREIGN KEY (`id_caixa`) REFERENCES `web_caixa` (`id`);

--
-- Limitadores para a tabela `web_detalhe_pedido`
--
ALTER TABLE `web_detalhe_pedido`
  ADD CONSTRAINT `fk_pedido_id` FOREIGN KEY (`id_pedido`) REFERENCES `web_pedido` (`id`),
  ADD CONSTRAINT `fk_produto_id` FOREIGN KEY (`id_produto`) REFERENCES `web_produto` (`id`);

--
-- Limitadores para a tabela `web_pedido`
--
ALTER TABLE `web_pedido`
  ADD CONSTRAINT `fk_mesa_id` FOREIGN KEY (`id_mesa`) REFERENCES `web_mesa` (`id`),
  ADD CONSTRAINT `fk_usuario_id` FOREIGN KEY (`id_usuario`) REFERENCES `web_usuario` (`id`);

--
-- Limitadores para a tabela `web_preparo`
--
ALTER TABLE `web_preparo`
  ADD CONSTRAINT `fk_id_mesa` FOREIGN KEY (`id_mesa`) REFERENCES `web_mesa` (`id`),
  ADD CONSTRAINT `fk_id_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `web_pedido` (`id`),
  ADD CONSTRAINT `fk_id_produto` FOREIGN KEY (`id_produto`) REFERENCES `web_produto` (`id`);

--
-- Limitadores para a tabela `web_produto`
--
ALTER TABLE `web_produto`
  ADD CONSTRAINT `fk_categoria_id` FOREIGN KEY (`id_categoria`) REFERENCES `web_categoria` (`id`);

--
-- Limitadores para a tabela `web_usuario`
--
ALTER TABLE `web_usuario`
  ADD CONSTRAINT `fk_perfil_acesso_id` FOREIGN KEY (`id_perfil_acesso`) REFERENCES `web_perfil_acesso` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
