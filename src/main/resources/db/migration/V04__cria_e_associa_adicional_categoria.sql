--
-- Estrutura da tabela web_adicional_categoria
--

CREATE TABLE web_adicional_categoria (
  id_categoria bigint(20) NOT NULL,
  id_adicional bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for table web_adicional_categoria
--
ALTER TABLE web_adicional_categoria
  ADD KEY fk_adicional (id_adicional),
  ADD KEY fk_categoria (id_categoria);

--
-- Limitadores para a tabela web_adicional_categoria
--
ALTER TABLE web_adicional_categoria
  ADD CONSTRAINT fk_adicional FOREIGN KEY (id_adicional) REFERENCES web_adicional (id),
  ADD CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES web_categoria (id);

--
-- Extraindo dados da tabela web_adicional_categoria
--

INSERT INTO web_adicional_categoria (id_categoria, id_adicional) VALUES
(1, 2),
(1, 4),
(1, 5),
(1, 6),
(2, 13),
(2, 10),
(2, 8),
(3, 13),
(4, 1),
(4, 4),
(4, 5),
(4, 12),
(5, 1),
(5, 4),
(5, 5),
(5, 12),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 11),
(6, 12),
(6, 10);