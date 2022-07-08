-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Jul-2022 às 01:21
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_definitivo6`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nivel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nivel`) VALUES
(1, 'admin'),
(2, 'Assitente'),
(3, 'Coordenador'),
(4, 'Auxiliar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `backlog`
--

CREATE TABLE `backlog` (
  `id` int(11) NOT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `ocorrencias_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `producao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`) VALUES
(1, 'Asssistente de Logística'),
(2, 'Coordenadora de Logística'),
(3, 'Asssistente de Logística'),
(4, 'Supervisor de Operações Logísticas Interior'),
(5, 'Encarregada de Expedição'),
(6, 'Assistente da qualidade'),
(7, 'Auxiliar de Logística'),
(8, 'Diretora'),
(9, 'Assistente Financeiro'),
(10, 'Coordenadora de RH');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `data`, `telefone`, `email`, `cnpj`, `foto`, `usuarios_id`, `setores_id`) VALUES
(7, 'HAPVIDA', '2021-07-03 00:04:14', NULL, NULL, NULL, NULL, 7, 3),
(8, 'GFL', '2021-07-05 19:01:25', NULL, NULL, NULL, NULL, 7, 1),
(9, 'DBA', '2021-07-05 19:25:30', NULL, NULL, NULL, NULL, 7, 1),
(10, 'NT LOG', '2021-07-05 19:35:18', NULL, NULL, NULL, NULL, 7, 1),
(14, 'FLASH', '2022-04-20 17:37:34', NULL, NULL, NULL, NULL, 4, 3),
(15, 'VITALMED', '2022-04-20 17:38:00', NULL, NULL, NULL, NULL, 4, 3),
(16, 'ACM', '2022-04-20 17:38:13', NULL, NULL, NULL, NULL, 4, 3),
(17, 'UNIMED', '2022-04-20 17:38:26', NULL, NULL, NULL, NULL, 4, 3),
(18, 'HUMANA', '2022-04-20 17:38:40', NULL, NULL, NULL, NULL, 4, 3),
(19, 'ODORATA', '2022-04-20 17:38:54', NULL, NULL, NULL, NULL, 4, 3),
(20, 'ACOMAC', '2022-04-20 17:39:09', NULL, NULL, NULL, NULL, 4, 3),
(21, 'SINTEMA', '2022-04-20 17:39:21', NULL, NULL, NULL, NULL, 4, 3),
(22, 'MARY KAY', '2022-04-20 17:39:40', NULL, NULL, NULL, NULL, 4, 3),
(23, 'UNIHOSP', '2022-05-04 14:51:29', NULL, NULL, NULL, NULL, 4, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucao`
--

CREATE TABLE `devolucao` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `producao_id` int(11) NOT NULL,
  `ocorrencias_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `qtd` varchar(45) DEFAULT NULL,
  `producao_id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregadores`
--

CREATE TABLE `entregadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(225) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `agencia` varchar(45) DEFAULT NULL,
  `conta` varchar(45) DEFAULT NULL,
  `pix` varchar(100) DEFAULT NULL,
  `cnh` varchar(45) DEFAULT NULL,
  `renavam` varchar(45) DEFAULT NULL,
  `apelido` varchar(100) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `admissao` timestamp NULL DEFAULT NULL,
  `recisao` timestamp NULL DEFAULT NULL,
  `valor_boleto` decimal(10,2) DEFAULT NULL,
  `valor_cartao` decimal(10,2) DEFAULT NULL,
  `valor_pequeno` decimal(10,2) DEFAULT NULL,
  `valor_grande` decimal(10,2) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `forma_pagamento_id` int(11) NOT NULL,
  `veiculos_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregadores`
--

INSERT INTO `entregadores` (`id`, `nome`, `telefone`, `cpf`, `email`, `banco`, `agencia`, `conta`, `pix`, `cnh`, `renavam`, `apelido`, `tipo`, `status`, `admissao`, `recisao`, `valor_boleto`, `valor_cartao`, `valor_pequeno`, `valor_grande`, `usuarios_id`, `forma_pagamento_id`, `veiculos_id`, `regioes_id`) VALUES
(70, 'ADEMIR NERES MARTINS', '(98) 98832-8985', '887.223.683-53', 'ademirneresmartins@gmail.com ', 'BAnco do BArsil', '77777', '9898898-52', '8888878111', '04116086016', '585140316', 'ademir', 'CLT', 1, '2022-02-18 14:53:46', '2022-02-18 14:53:46', '0.00', '0.00', '0.00', '11.00', 4, 4, 1, 79),
(73, 'ANTONIO WILLIAN SANTOS', '(98) 98745-1262', '836.359.203-04', 'antoniowilliansantosslz@gmail.com', 'bradesco', '6578-1', '10162-1', '', '03253697497', '204196841', 'ANTONIO WILLIAN', 'CLT', 1, '2022-02-24 20:37:14', '2022-02-24 20:37:14', '0.00', '0.00', '1.40', '5.00', 4, 4, 1, 74),
(78, 'JOSE ORLANDO DOS SANTOS E SANTOS', '(98) 98770-0584', '005.560.203-75', 'joseorlandodossantos@gmail.com', '', '', '', '', '', '', 'JOSE ORLANDO', 'PJ', 1, '2022-02-21 18:48:01', '2022-02-21 18:48:01', '0.00', '0.00', '2.00', '5.00', 4, 4, 5, 74),
(80, 'JOSE RONILDO BARBOSA DOS SANTOS', '(98) 98195-5189', '044.801.853-56', 'joseronildobarbosa@gmail.com', '', '', '', '', '', '', 'JOSE RONILDO', 'CLT', 1, '2022-03-23 14:55:32', '2022-03-23 14:55:32', '0.00', '0.00', '2.30', '5.00', 4, 4, 1, 79),
(82, 'THEOBALDO MARCOS PAIXÃO JUNIOR', '(98) 99614-9699', '874.914.783-87', 'theobaldomarcospaixaojunior@gmail.com', '', '', '', '', '', '', 'MARCOS JUNIOR', 'PJ', 1, '2022-02-21 20:04:56', '2022-02-21 20:04:56', '2.00', '2.00', '0.00', '0.00', 4, 4, 5, 74),
(83, 'ANTONIO MARCOS SODRÉ DE SOUSA', '(98) 98844-7819', '853.301.403-15', 'antoniomarcossodredesousa@gmail.com', '237-Bradesco', '1168-1', '515340-7', '', '04979590869', '1106502571', 'SODRÉ', 'PJ', 1, '2022-02-22 17:47:53', '2022-02-22 17:47:53', '0.80', '0.00', '2.00', '5.00', 4, 4, 1, 74),
(85, 'FELIPE MARTINS SOARES', '', '617.113.643-39', '', '237-Bradesco', '3929-2', '4110-6', '', '', '', 'FELIPE MARTINS ', 'PJ', 1, '2022-02-22 18:21:36', '2022-02-22 18:21:36', '0.00', '1.50', '0.00', '0.00', 4, 4, 5, 74),
(87, 'NECIVALDO SILVA DA SILVA', '(98) 98808-9520', '405.097.293-04', 'necivaldosilvadasilva@gmail.com', '237-Bradesco', '1319-6', '0505090-1', '', '05634136131', '00389199001', 'NECIVALDO', 'PJ', 1, '2022-02-22 18:43:50', '2022-02-22 18:43:50', '0.00', '0.00', '2.00', '5.00', 4, 4, 1, 74),
(88, 'ANTONIO SILVESTRE CAMPOS PINHEIRO', '(98) 98116-5398', '904.199.603-68', 'antoniosilvestrepinheiro@gmail.com', 'Caixa Econômica Federal', '1037', '62790-9', '(98)98608-1880', '04000792697', '01080960012', 'SILVESTRE', 'CLT', 1, '2022-03-28 20:07:01', '2022-03-28 20:07:01', '0.80', '0.00', '2.00', '5.00', 4, 5, 1, 74),
(89, 'CRISTIAN FELIPE SILVA LOBÃO', '(98) 98531-0264', '070.579.103-39', '', '', '', '', '070.579.103-39', '', '', 'CRISTIAN FELIPE', 'PJ', 1, '2022-02-22 19:02:15', '2022-02-22 19:02:15', '0.00', '0.00', '5.00', '5.00', 4, 5, 2, 74),
(90, 'NATANAILSON CELSO MENDONÇA DA SILVA', '(98) 98811-4241', '013.064.813-25', 'natanailsonmendonca@gmail.com', 'itau', '7861', '34851-9', 'natanailson.c@gmail.com', '05919708880', '00128974443', 'NATANAILSON', 'PJ', 1, '2022-02-22 19:36:49', '2022-02-22 19:36:49', '1.00', '0.00', '2.00', '5.00', 4, 5, 1, 74),
(91, 'DENILSON MARTINS DA SILVA', '(98) 98861-5312', '893.163.713-68', 'denilsonmartinsdasilvaslz@gmail.com', 'Caixa Econômica Federal', '1521', '113302-8', '893.163.713-68', '00124571214', '1101794400', 'DENILSON MARTINS', 'CLT', 1, '2022-02-22 19:46:41', '2022-02-22 19:46:41', '0.00', '0.00', '1.40', '5.00', 4, 5, 1, 74),
(92, 'VALDEZ MORAES DOS SANTOS', '(98) 98415-7682', '224.990.753-68', 'valdezmoraesdossantos@gmail.com', 'Caixa Econômica Federal', '1576', '60252-0', '224.990.753-68', '00149663140', '301493910', 'VALDEZ ', 'CLT', 1, '2022-02-22 19:58:27', '2022-02-22 19:58:27', '0.00', '0.00', '2.00', '5.00', 4, 5, 2, 74),
(95, 'JAILSON MAURO GARCEZ FERRAZ', '(98) 99972-8732', '509.400.663-00', 'jailsonmaurogarcezferraz@gmail.com', '', '', '', '', '', '', 'JAILSON', 'PJ', 1, '2022-02-24 18:00:19', '2022-02-24 18:00:19', '1.00', '1.00', '0.00', '0.00', 4, 4, 5, 74),
(96, 'ALESSANDRO FREIRE CALDAS', '(98) 98604-8499', '602.008.083-89', 'alessandrofreirecaldas@gmail.com', 'bradesco', '6578-1', '5331-7', '', '05357337623', '478680708', 'alessandro', 'CLT', 1, '2022-02-24 18:35:33', '2022-02-24 18:35:33', '0.00', '0.00', '1.40', '5.00', 4, 4, 1, 74),
(97, 'CLODOALDO FERREIRA DE SOUSA', '(98) 98802-8265', '760.774.383-91', 'clodoaldoferreiradesousa@gmail.com', 'bradesco', '1037-5', '31687-3', '', '05621877892', '294487816', 'CLODOALDO', 'CLT', 1, '2022-02-24 18:41:24', '2022-02-24 18:41:24', '0.00', '0.00', '1.40', '5.00', 4, 4, 1, 74),
(98, 'DENILSON COSTA VIEIRA', '(98) 98919-7942', '905.517.963-91', 'denilsoncostavieiraslz@gmail.com', 'bradesco', '6578-1', '5301-5', '', '05392508183', '00396239900', 'DENILSON COSTA', 'PJ', 1, '2022-02-24 18:46:27', '2022-02-24 18:46:27', '0.00', '0.00', '1.40', '5.00', 4, 4, 1, 74),
(99, 'DOMINGOS EDSON SILVA SANTOS', '(98) 98535-9358', '778.668.513-87', 'dedsonsilvasantos@gmail.com', 'bradesco', '1037', '0031685-7', '', '01807326089', '771299125', 'EDSON', 'CLT', 1, '2022-02-24 18:51:39', '2022-02-24 18:51:39', '0.00', '0.00', '1.40', '5.00', 4, 4, 1, 74),
(100, 'GILMAR VALE BARBOSA', '(98) 98828-3399', '515.549.333-15', 'gilmarvalebarbosa@gmail.com', 'bradesco Next - 237', '3728', '755858-9', '', '00272413365', '338307397', 'GILMAR ', 'CLT', 1, '2022-02-24 18:54:56', '2022-02-24 18:54:56', '0.00', '0.00', '1.40', '5.00', 4, 4, 1, 74),
(101, 'JOSE VITAL BARBOSA', '(98) 99121-9154', '822.080.423-87', 'josevitalbarbosaslz@gmail.com', 'bradesco', '2121-0', '0028905-1', '', '04551162730', '01145650152', 'JOSE VITAL', 'CLT', 1, '2022-02-24 18:59:26', '2022-02-24 18:59:26', '0.00', '0.00', '1.40', '5.00', 4, 4, 2, 74),
(102, 'MAURO SERGIO COSTA SILVA', '(98) 99287-8892', '696.293.403-30', 'mauro.21@gmail.com', 'bradesco Next - 237', '6176', '494455-0', '', '02953646513', '299467058', 'MAURO', 'CLT', 1, '2022-02-24 19:06:06', '2022-02-24 19:06:06', '0.00', '0.00', '1.40', '5.00', 4, 4, 1, 74),
(103, 'SERGIO LUIS DE MORAES ALVES', '(98) 98841-9932', '238.779.363-34', 'sergioluismoraesalves@gmail.com', 'bradesco', '1037-5', '22812-5', '', '02930004285', '209581581', 'SERGIO', 'CLT', 1, '2022-02-24 19:14:32', '2022-02-24 19:14:32', '0.00', '0.00', '1.40', '5.00', 4, 4, 1, 74),
(106, 'DELNILSON BRANDÃO', '(98) 99148-3701', '601.572.923-63', 'denilsonbrandaoslz@gmail.com', 'bradesco', '6578-1', '9719-5', '', '04118936651', '120011492', 'DELNILSON BRANDÃO', 'CLT', 1, '2022-02-24 19:44:52', '2022-02-24 19:44:52', '0.00', '0.00', '1.40', '5.00', 4, 4, 1, 74),
(129, 'GABRIEL CARVALHO DOS SANTOS', '(98) 98844-0252', '607.128.813-44', 'gabrielcarvalhodossantosslz@gmail.com', 'bradesco', '1167', '0032668-2', '', '07229902247', '1092781126', 'GABRIEL', 'CLT', 1, '2022-02-25 19:12:14', '2022-02-25 19:12:14', '0.00', '1.00', '1.00', '1.00', 4, 4, 1, 74),
(130, 'FRANCISCO DAS CHAGAS SILVA MORAES', '(98) 98703-1343', '663.596.863-68', 'franciscodaschagassilvamoraes@gmail.com', 'bradesco', '1180-0', '1002553-2', '', '03663708731', '470066598', 'chico', 'CLT', 1, '2022-02-25 19:15:31', '2022-02-25 19:15:31', '0.00', '1.00', '1.00', '1.00', 4, 4, 1, 74),
(131, 'ANTONIO JOSÉ FONSECA DA SILVA', '(98) 99151-2121', '999.724.173-87', 'antoniojfonsecadasilva@gmail.com', 'bradesco', '3750-8', '459376-6', '', '03819097297', '01251602824', 'JOSÉ FONSECA', 'CLT', 1, '2022-02-25 19:22:36', '2022-02-25 19:22:36', '1.00', '1.00', '1.00', '1.00', 4, 4, 1, 74),
(132, 'ARLEAN COSTA SOUSA', '(98) 98212-9841', '036.923.303-40', 'arleancostasousa@gmail.com', 'Caixa Econômica Federal', '1739', '33151-0', '98982129841', '06062482500', '463336577', 'arlean', 'CLT', 1, '2022-02-25 19:27:04', '2022-02-25 19:27:04', '1.00', '1.00', '1.00', '1.00', 4, 5, 1, 74),
(133, 'JOELSON CAMPOS SERRA', '(98) 98831-1259', '850.214.583-53', 'joelsoncamposserraslz@gmail.com', 'Caixa Econômica Federal', '1576', '68469-1', '850.214.583-53', '03130178244', '251024172', 'joelson', 'CLT', 1, '2022-02-25 19:32:40', '2022-02-25 19:32:40', '0.00', '1.00', '1.00', '1.00', 4, 5, 2, 74),
(134, 'RAIMUNDO NONATO FERREIRA LIMA JUNIOR', '(98) 98868-4192', '972.096.433-20', 'raimundononatoferreiralimajr@gmail.com', 'bradesco', '6578-1', '0015359-1', '', '04717582504', '134811585', 'raimundo junior', 'CLT', 1, '2022-02-25 19:40:01', '2022-02-25 19:40:01', '0.00', '0.00', '1.00', '1.00', 4, 4, 2, 74),
(135, 'BRUNO LUIS SILVA FRANÇA', '(98) 98814-9882', '645.881.493-34', 'brunoluissilvafrancaslz@gmail.com', 'Caixa Econômica Federal', '4324', '01076520-0', '645.881.493-34', '04690887661', '1010449904', 'bruno frança', 'CLT', 1, '2022-02-25 19:45:45', '2022-02-25 19:45:45', '0.00', '0.00', '1.00', '1.00', 4, 5, 2, 74),
(136, 'MARCOS ANTONIO CARDOSO FONSECA', '(98) 98847-5760', '023.713.263-05', 'marcosantoniocfonseca@gmail.com', 'bradesco', '6578-1', '10832-4', '', '04690451294', '1095162656', 'marcos fonseca', 'CLT', 1, '2022-03-02 16:09:06', '2022-03-02 16:09:06', '1.00', '1.00', '1.00', '1.00', 4, 4, 1, 74),
(137, 'MARCOS ANTONIO PEREIRA SANTOS', '(98) 98892-5943', '450.157.163-20', 'marcosantoniopsantosslz@gmail.com', 'bradesco', '6578-1', '5466-6', '', '01968927823', '1036186960', 'marquinhos', 'CLT', 1, '2022-03-02 16:34:31', '2022-03-02 16:34:31', '0.00', '0.00', '1.00', '1.00', 4, 4, 2, 74),
(138, 'CLAUDENILSON FIGUEIREDO MENDONÇA', '(98) 99993-8027', '651.078.533-15', 'claudenilsonfigueiredomendonca@gmail.com', 'bradesco', '3925-0', '0437775-3', '', '', '', 'CLAUDENILSON ', 'CLT', 1, '2022-03-02 16:44:14', '2022-03-02 16:44:14', '1.00', '1.00', '0.00', '0.00', 4, 4, 5, 74),
(139, 'JORGE LUIS FERREIRA MARTINS', '(98) 99613-3690', '207.116.203-00', 'jorgeluisferreiramartinsslz@gmail.com', 'Caixa Econômica Federal', '27', '61733-3', '', '', '', 'JORGE LUIS ', 'CLT', 1, '2022-03-02 17:05:01', '2022-03-02 17:05:01', '1.00', '1.00', '0.00', '0.00', 4, 5, 5, 74),
(140, 'JOSE CARLOS RODRIGUES DE SOUZA JUNIOR', '(98) 98341-6420', '931.244.303-87', 'josecarlosrodriguessjunior@gmail.com', 'bradesco', '3750-8', '56969-0', '', '', '', 'carlos', 'CLT', 1, '2022-03-02 17:19:40', '2022-03-02 17:19:40', '1.00', '1.00', '0.00', '0.00', 4, 4, 5, 74),
(141, 'JOSE ROBERTO DA SILVA CRUZ', '(98) 98468-8301', '508.666.643-00', 'joserobertodasilvacruzslz@gmail.com', 'bradesco', '3929-2', '0022753-6', '', '', '', 'roberto', 'CLT', 1, '2022-03-02 17:39:36', '2022-03-02 17:39:36', '1.00', '1.00', '0.00', '0.00', 4, 4, 5, 74),
(142, 'CESAR CRISTIAN MOTA FONSECA', '(98) 98175-3179', '038.837.133-17', '', '', '', '', '', '07453672795', ' 00883919605', 'CESAR CRISTIAN', 'PJ', 1, '2022-03-02 18:20:59', '2022-03-02 18:20:59', '0.00', '0.00', '5.00', '5.00', 4, 4, 2, 74),
(143, 'ANTONIO GILBERTO OLIVEIRA DOS SANTOS', '(98) 98182-9041', '875.046.003-00', '', 'Caixa Econômica Federal', '3519', '3620-9', '(98) 991340077 ', '02989719900', '1105291577', 'ANTONIO GILBERTO ', 'PJ', 1, '2022-03-02 18:29:32', '2022-03-02 18:29:32', '1.00', '0.00', '4.00', '4.00', 4, 5, 2, 80),
(144, 'ANTONIO RENILSON VASCONCELOS PAIVA', '(98) 98282-7886', '331.388.853-49', '', 'Caixa Econômica Federal', '', '', '475.082.803-34', '02771152478', '01091387505', 'ANTONIO RENILSON ', 'CLT', 1, '2022-03-02 18:50:59', '2022-03-02 18:50:59', '1.00', '0.00', '4.00', '4.00', 4, 5, 2, 76),
(145, 'aline dos santos silva', '(99) 98431-3160', '054.428.973-02', '', 'banco do brasil', '2992-4', '43518518-0', '(99) 98431-3160', '06029761001', '01117204267', 'aline', 'CLT', 1, '2022-03-02 19:03:49', '2022-03-02 19:03:49', '1.00', '0.00', '4.00', '4.00', 4, 5, 2, 76),
(147, 'ANTONIO RENILSON VASCONCELOS PAIVA', '(98) 98282-7886', '331.388.853-49', '', 'Caixa Econômica Federal', '', '', '475.082.803-34', '02771152478', '01091387505', 'renilson', 'PJ', 1, '2022-05-05 14:32:31', '2022-05-05 14:32:31', '1.00', '0.00', '4.00', '4.00', 4, 5, 2, 78),
(149, 'CAIANNE CASTRO BRITO DOS SANTOS', '(99) 99231-5373', '059.886.703-18', '', '336-C6 BANK', '', '', 'caiannecastro@gmail.com', '', '', 'CAIANNE', 'CLT', 1, '2022-05-05 15:06:41', '2022-05-05 15:06:41', '1.00', '0.00', '4.00', '4.00', 4, 5, 5, 76),
(150, 'NOELSON RIBEIRO DA COSTA', '(98) 98749-5064', '007.440.273-06', '', 'nu pagamentos s.a.', '', '', '00744027306', '04528026719', '00996600655', 'noelson', 'CLT', 1, '2022-05-05 15:08:34', '2022-05-05 15:08:34', '0.00', '0.00', '0.00', '0.00', 4, 5, 3, 74),
(151, 'ANTONIA CELIA DE SÁ SILVA', '(99) 99208-5131', '602.680.033-60', '', 'banco do brasil', '', '', '34590404320', '05710215940', '01120615434', 'celia', 'PJ', 1, '2022-05-05 15:18:58', '2022-05-05 15:18:58', '1.00', '0.00', '4.00', '4.00', 4, 5, 1, 76),
(152, 'DOGIVAL SILVA', '(98) 98454-9453', '046.176.453-90', '', 'Caixa Econômica Federal', '2063 ', '30211-3', '04617645390', '05141933402', '199468834', 'DOGIVAL ', 'PJ', 1, '2022-05-05 16:15:56', '2022-05-05 16:15:56', '1.00', '0.00', '4.00', '4.00', 4, 5, 1, 79),
(153, 'FREDSON SANTOS E SANTOS', '(98) 99154-8239', '020.656.173-30', '', 'nubank', '1', '35787192-6', '020.656.173-30', '06880002460', '539380423', 'FREDSON', 'PJ', 1, '2022-05-05 16:22:16', '2022-05-05 16:22:16', '1.50', '0.00', '4.00', '4.00', 4, 5, 1, 77),
(154, 'GILMAR SILVA CORREIA', '(98) 98777-2972', '003.077.453-50', '', 'Caixa Econômica Federal', '2063', '00055037-0', '026.513.983-06  ', '', '', 'gilmar correia', 'PJ', 1, '2022-05-05 16:30:59', '2022-05-05 16:30:59', '1.00', '0.00', '4.00', '4.00', 4, 5, 5, 79),
(157, 'RIVALDO MOREIRA DE HOLANDA', '(98) 98836-4515', '630.224.602-44', '', '', '', '', '', '03533058132', '01291577316', 'rivaldo holanda', 'PJ', 1, '2022-05-05 17:18:35', '2022-05-05 17:18:35', '0.00', '0.00', '2.00', '0.00', 4, 4, 1, 74),
(158, 'JOELSON DE JESUS CARDOSO SILVA', '(98) 98836-4515', '604.978.323-30', '', 'Caixa Econômica Federal', '1576', '146834-8', '', '05692233040', '01129177014', 'joelson de jesus', 'CLT', 1, '2022-05-05 17:26:48', '2022-05-05 17:26:48', '0.00', '0.00', '0.00', '0.00', 4, 4, 1, 74),
(159, 'MANOEL DE JESUS DA SILVA', '(99) 98178-7160', '493.440.483-04', '', 'Caixa Econômica Federal', '', '', '493.440.483-04', '00990755497', '01195340815', 'MANOEL de jesus', 'PJ', 1, '2022-05-05 17:41:45', '2022-05-05 17:41:45', '1.00', '0.00', '4.00', '4.00', 4, 5, 2, 76),
(160, 'MARCELO SILVA DE CARVALHO ', '(98) 98404-2907', '058.897.803-52', '', 'nubank', '', '', '(98) 984042907', '', '', 'MARCELO SILVA ', 'CLT', 1, '2022-05-06 16:19:37', '2022-05-06 16:19:37', '1.00', '0.00', '4.00', '4.00', 4, 5, 5, 77),
(161, 'Josue do Nascimento Mesquita', '(98) 98136-4108', '013.398.453-26', '', 'Caixa Econômica Federal', '3126', '00039973-1', '(98) 981364108', '', '', 'JOSUE MESQUITA', 'CLT', 1, '2022-05-06 16:54:14', '2022-05-06 16:54:14', '1.00', '0.00', '4.00', '4.00', 4, 5, 5, 76),
(162, 'LUIS INACIO COUTO NETO', '(98) 98521-6821', '649.757.623-15', '', 'Caixa Econômica Federal', '', '', '64975762315', '', '', 'inacio', 'PJ', 1, '2022-05-06 17:00:29', '2022-05-06 17:00:29', '1.00', '0.00', '4.00', '4.00', 4, 5, 5, 79),
(163, 'ROBERTO DA SILVA OLIVEIRA', '(98) 98484-8507', '050.482.273-01', '', 'banco do brasil', '1027-8', '32435-3', '(98) 984848507', '', '', 'ROBERTO  OLIVEIRA', 'PJ', 1, '2022-05-06 17:46:10', '2022-05-06 17:46:10', '1.00', '0.00', '4.00', '4.00', 4, 5, 5, 77),
(164, 'Evaldo Moizinho Mendes', '(98) 99609-2407', '892.421.303-20', '', 'bradesco', '1181-9', '1000721-6', '', '03658431101', '01227385894', 'EVALDO', 'PJ', 1, '2022-05-06 18:33:58', '2022-05-06 18:33:58', '1.00', '0.00', '1.50', '1.50', 4, 4, 2, 79),
(165, 'EVANIO CASTRO FREITAS', '(99) 98135-6294', '027.887.983-77', '', 'bradesco', '1036', '623138-1', '', '', '', 'EVANIO', 'PJ', 1, '2022-05-06 18:37:17', '2022-05-06 18:37:17', '0.00', '0.00', '4.00', '4.00', 4, 4, 5, 76),
(166, 'VANDERLEY DE OZINO SILVA SANTOS', '(98) 99229-4269', '619.596.723-80', '', 'Caixa Econômica Federal', '4480', '20189-1', '619.596.723-80', '06205885433', '01106235239', 'VANDERLEY ', 'CLT', 1, '2022-05-06 19:00:06', '2022-05-06 19:00:06', '1.00', '0.00', '4.00', '4.00', 4, 5, 1, 79),
(167, 'FABIANA DE ALMEIDA CARDOSO', '(99) 98145-4961', '962.260.053-00', '', 'bradesco', '1142-8', '0008010-1', '', '06744005198', '00209855444', 'FABIANA', 'PJ', 1, '2022-05-06 19:32:00', '2022-05-06 19:32:00', '1.00', '0.00', '4.00', '4.00', 4, 4, 2, 76),
(168, 'HAIRTON PEREIRA MATILDE', '(98) 99101-5701', '018.593.973-28', '', 'bradesco', '1080-4', '1001485-9', '', '', '', 'HAIRTON', 'PJ', 1, '2022-05-06 19:45:52', '2022-05-06 19:45:52', '1.00', '0.00', '4.00', '4.00', 4, 4, 5, 76),
(169, 'MAURO ROBERTO SOUZA MESQUITA', '(99) 98173-6013', '580.772.003-20', '', 'bradesco Next - 237', '7160-9', '6477106-0', '', '', '', 'MAURO MESQUITA ', 'PJ', 1, '2022-05-06 19:57:34', '2022-05-06 19:57:34', '1.00', '0.00', '3.00', '3.00', 4, 4, 5, 76),
(170, 'RAIFRAN DE OLIVEIRA', '(99) 98202-9334', '045.170.423-16', '', 'bradesco', '3750', '540482-7', '', '', '', 'RAIFRAN', 'PJ', 1, '2022-05-06 20:08:31', '2022-05-06 20:08:31', '1.00', '0.00', '4.00', '4.00', 4, 4, 5, 76),
(171, 'CARLOS AUGUSTO', '', '', '', '', '', '', '', '', '', 'CARLINHOS', 'CLT', 1, '2022-05-19 17:33:51', '2022-05-19 17:33:51', '0.00', '0.00', '0.00', '0.00', 4, 4, 5, 74),
(172, 'HARRISON IGOR DA SILVA CHAGAS', '(98) 98605-9046', '056.408.663-06', '', 'bradesco', '408', '34962-3', '', '06666645925', '01279365584', 'igor', 'CLT', 1, '2022-05-24 15:25:48', '2022-05-24 15:25:48', '0.00', '0.00', '0.00', '0.00', 4, 4, 3, 74),
(173, 'BRUNO FELIPE CHAVES COSTA VALE', '(98) 99110-7677', '045.844.183-06', '', 'bradesco', '1052-9', '0555604-0', '', '04543682599', '00923836020', 'BRUNO FELIPE', 'CLT', 1, '2022-05-25 18:10:08', '2022-05-25 18:10:08', '1.00', '0.00', '4.00', '4.00', 4, 4, 2, 80),
(174, 'LUCAS BEZERRA MARINHO', '(98) 99117-3642', '065.098.253-33', '', '', '', '', '', '06949319707', '00340724005', 'LUCAS', 'CLT', 1, '2022-06-16 12:14:15', '2022-06-16 12:14:15', '0.00', '0.00', '0.00', '0.00', 4, 4, 1, 74),
(175, 'CLEILTON - GEANNE', '', '', '', '', '', '', '', '', '', 'CLEILTON', 'PJ', 1, '2022-06-20 20:14:31', '2022-06-20 20:14:31', '0.00', '0.00', '4.00', '4.00', 4, 5, 5, 76);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador_rota`
--

CREATE TABLE `entregador_rota` (
  `id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL,
  `rotas_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador_servicos`
--

CREATE TABLE `entregador_servicos` (
  `id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregador_servicos`
--

INSERT INTO `entregador_servicos` (`id`, `entregadores_id`, `servicos_id`) VALUES
(319, 149, 3),
(320, 149, 5),
(342, 70, 5),
(343, 145, 3),
(344, 145, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador_setores`
--

CREATE TABLE `entregador_setores` (
  `id` int(11) NOT NULL,
  `entregadores_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregador_setores`
--

INSERT INTO `entregador_setores` (`id`, `entregadores_id`, `setores_id`, `valor`) VALUES
(41, 78, 1, 1),
(43, 80, 1, 1),
(45, 82, 3, 1),
(46, 83, 1, 1),
(47, 83, 3, 1),
(50, 85, 3, 1),
(52, 87, 1, 1),
(53, 88, 1, 1),
(54, 88, 3, 1),
(55, 89, 1, 1),
(56, 90, 1, 1),
(57, 90, 3, 1),
(58, 91, 1, 1),
(59, 91, 3, 1),
(60, 92, 1, 1),
(64, 95, 3, 1),
(65, 96, 1, 1),
(66, 96, 3, 1),
(67, 97, 1, 1),
(68, 97, 3, 1),
(69, 98, 1, 1),
(70, 98, 3, 1),
(71, 99, 1, 1),
(72, 99, 3, 1),
(73, 100, 1, 1),
(74, 100, 3, 1),
(75, 101, 1, 1),
(76, 101, 3, 1),
(77, 102, 1, 1),
(78, 102, 3, 1),
(79, 103, 1, 1),
(80, 103, 3, 1),
(85, 106, 1, 1),
(86, 106, 3, 1),
(91, 129, 1, 1),
(92, 129, 3, 1),
(93, 130, 1, 1),
(94, 130, 3, 1),
(95, 131, 1, 1),
(96, 131, 3, 1),
(97, 132, 1, 1),
(98, 132, 3, 1),
(99, 133, 1, 1),
(100, 133, 3, 1),
(101, 134, 1, 1),
(102, 135, 1, 1),
(103, 136, 1, 1),
(104, 136, 3, 1),
(105, 137, 1, 1),
(106, 138, 3, 1),
(107, 139, 3, 1),
(108, 140, 3, 1),
(109, 141, 3, 1),
(110, 142, 1, 1),
(111, 143, 1, 1),
(112, 143, 3, 1),
(119, 147, 1, 1),
(120, 147, 3, 1),
(125, 150, 1, 1),
(126, 150, 3, 1),
(127, 151, 1, 1),
(128, 151, 3, 1),
(129, 152, 1, 1),
(130, 152, 3, 1),
(131, 153, 1, 1),
(132, 153, 3, 1),
(133, 154, 1, 1),
(134, 154, 3, 1),
(139, 157, 1, 1),
(140, 158, 1, 1),
(141, 158, 3, 1),
(142, 159, 1, 1),
(143, 159, 3, 1),
(148, 162, 1, 1),
(149, 162, 3, 1),
(150, 163, 1, 1),
(151, 163, 3, 1),
(152, 164, 1, 1),
(153, 164, 3, 1),
(154, 165, 1, 1),
(157, 167, 1, 1),
(158, 167, 3, 1),
(159, 168, 1, 1),
(160, 168, 3, 1),
(161, 169, 1, 1),
(162, 169, 3, 1),
(163, 170, 1, 1),
(164, 170, 3, 1),
(167, 73, 1, 1),
(168, 73, 3, 1),
(169, 171, 3, 1),
(170, 172, 1, 1),
(171, 172, 3, 1),
(174, 166, 1, 1),
(175, 166, 3, 1),
(176, 174, 1, 1),
(177, 174, 3, 1),
(178, 161, 1, 1),
(179, 161, 3, 1),
(182, 144, 1, 1),
(183, 144, 3, 1),
(184, 173, 1, 1),
(185, 173, 3, 1),
(186, 175, 1, 1),
(187, 160, 1, 1),
(188, 160, 3, 1),
(199, 149, 1, 1),
(200, 149, 3, 1),
(224, 70, 1, 1),
(225, 145, 1, 1),
(226, 145, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id`, `nome`) VALUES
(4, 'Dinheiro'),
(5, 'Pix');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gaiolas`
--

CREATE TABLE `gaiolas` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `nome` varchar(45) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `gaiolas`
--

INSERT INTO `gaiolas` (`id`, `data`, `nome`, `qtd`) VALUES
(39, '2022-01-27 23:00:54', 'ROTA 01 - PAÇO ', 0),
(40, '2022-02-04 23:07:54', 'ROTA 02 - ELDORADO', 0),
(41, '2022-02-04 23:07:54', 'ROTA 03 - RECANTO', 0),
(42, '2022-02-04 23:07:54', 'ROTA 04 - VINHAIS ', 0),
(43, '2022-02-04 23:07:54', 'ROTA 05 - ANIL ', 0),
(44, '2022-02-04 23:07:54', 'ROTA 06 - VILA PALMEIRA', 0),
(45, '2022-02-04 23:07:54', 'ROTA 07 - COROADINHO', 0),
(46, '2022-02-04 23:07:54', 'ROTA 08 - SÃO FRANCISCO', 0),
(47, '2022-02-04 23:07:54', 'ROTA 09 - PONTA DO FAROL ', 0),
(48, '2022-02-04 23:07:54', 'ROTA 10 - CIDADE OPERÁRIA', 0),
(49, '2022-02-04 23:07:54', 'ROTA 100 - BACABAL', 0),
(50, '2022-02-04 23:07:54', 'ROTA 101 - LAGO DA PEDRA', 0),
(51, '2022-02-04 23:07:54', 'ROTA 102 - BARRA DO CORDA', 0),
(52, '2022-02-04 23:07:54', 'ROTA 103 - COROATÁ ', 0),
(53, '2022-02-04 23:07:54', 'ROTA 104 - COLINAS', 0),
(54, '2022-02-04 23:07:54', 'ROTA 105 - DOM PEDRO ', 0),
(55, '2022-02-04 23:07:54', 'ROTA 106 - PRES. DUTRA/TUNTUM', 0),
(56, '2022-02-04 23:07:54', 'ROTA 107 - PEDREIRAS/TRIZIDELA', 0),
(57, '2022-02-04 23:07:54', 'ROTA 108 - SÃO MATEUS ', 0),
(58, '2022-02-04 23:07:54', 'ROTA 109 - ROSÁRIO', 0),
(59, '2022-02-04 23:07:54', 'ROTA 11 - COHATRAC', 0),
(60, '2022-02-04 23:07:54', 'ROTA 110 - BARREIRINHAS', 0),
(61, '2022-02-04 23:07:54', 'ROTA 111 - ZÉ DOCA', 0),
(62, '2022-02-04 23:07:54', 'ROTA 112 - SANTA INÊ', 0),
(63, '2022-02-04 23:07:54', 'ROTA 113 - SANTA LUZIA', 0),
(64, '2022-02-04 23:07:54', 'ROTA 114 - VIANA/ARARI', 0),
(65, '2022-02-04 23:07:54', 'ROTA 115 - SÃO BENTO ', 0),
(66, '2022-02-04 23:07:54', 'ROTA 116 - PINHEIRO', 0),
(67, '2022-02-04 23:07:54', 'ROTA 117 - CURURUPU', 0),
(68, '2022-02-04 23:07:54', 'ROTA 12 - LIBERDADE/CENTRO ', 0),
(69, '2022-02-04 23:07:54', 'ROTA 121 - CAROLINA/ESTREITO/GRAJAÚ/J.LISBOA', 0),
(70, '2022-02-04 23:07:54', 'ROTA 122 - IMPERATRIZ', 0),
(71, '2022-02-04 23:07:54', 'ROTA 123 - BALSAS', 0),
(72, '2022-02-04 23:07:54', 'ROTA 124 - AÇAILÂNDIA', 0),
(73, '2022-02-04 23:07:54', 'ROTA 13 - COHAB', 0),
(74, '2022-02-04 23:07:54', 'ROTA 14 - ARAÇAGY', 0),
(75, '2022-02-04 23:07:54', 'ROTA 15 - BR', 0),
(76, '2022-02-04 23:07:54', 'ROTA 16 - SÃO CRISTÓVÃO', 0),
(77, '2022-02-04 23:07:54', 'ROTA 17 - ANJO DA GUARDA', 0),
(78, '2022-02-04 23:07:54', 'ROTA 18 - RENASCENÇA', 0),
(79, '2022-02-04 23:07:54', 'ROTA 19 - TURU', 0),
(80, '2022-02-04 23:07:54', 'ROTA 20 - OLHO DÁGUA', 0),
(81, '2022-02-04 23:07:54', 'ROTA 50 - CANTINHO DO CÉU', 0),
(82, '2022-02-04 23:07:54', 'ROTA 51 - DIVINÉIA ', 0),
(83, '2022-02-04 23:07:54', 'ROTA 52 - CENTRO', 0),
(84, '2022-02-04 23:07:54', 'ROTA 53 - VILA EMBRATE', 0),
(85, '2022-02-04 23:07:54', 'ROTA 54 - TIRIRICAL', 0),
(86, '2022-02-04 23:07:54', 'ROTA 55 - PONTA DA AREIA', 0),
(87, '2022-02-04 23:07:54', 'ROTA 56 - FORQUILHA', 0),
(88, '2022-02-04 23:07:54', 'ROTA 57 - CIDADE OLÍMPICA', 0),
(89, '2022-02-04 23:07:54', 'ROTA 58 - SÃO JOSÉ DE RIBAMAR', 0),
(90, '2022-02-22 16:32:27', 'ROTA 500', 0),
(91, '2022-02-22 16:33:10', 'ROTA 501', 0),
(92, '2022-02-22 16:33:46', 'ROTA 502', 0),
(93, '2022-02-22 16:34:12', 'ROTA 503', 70),
(94, '2022-02-22 16:34:30', 'ROTA 504', 0),
(95, '2022-02-22 16:34:59', 'ROTA 505', 0),
(96, '2022-02-22 16:35:20', 'ROTA 506', 0),
(97, '2022-02-22 16:35:42', 'ROTA 507', 0),
(98, '2022-02-22 16:36:07', 'ROTA 508', 0),
(99, '2022-02-22 16:36:33', 'ROTA 509', 0),
(100, '2022-02-22 16:36:54', 'ROTA 510', 0),
(101, '2022-02-22 16:37:17', 'ROTA 511', 0),
(102, '2022-02-22 16:37:45', 'ROTA 512', 0),
(103, '2022-02-22 16:38:08', 'ROTA 513', 0),
(104, '2022-02-22 16:38:32', 'ROTA 514', 0),
(105, '2022-02-22 16:38:59', 'ROTA 515', 0),
(106, '2022-02-22 16:39:27', 'ROTA 516', 0),
(107, '2022-02-22 16:39:47', 'ROTA 517', 0),
(108, '2022-02-22 16:40:17', 'ROTA 518', 0),
(109, '2022-02-22 16:40:46', 'ROTA 519', 0),
(110, '2022-02-22 16:41:20', 'ROTA 520', 0),
(111, '2022-02-22 17:31:19', 'ROTA 21 - RIBAMAR', 0),
(112, '2022-02-22 17:31:35', 'ROTA 22 - SHOPPING', 0),
(113, '2022-02-22 17:32:55', 'ROTA 118 - itapecuru', 0),
(114, '2022-02-22 17:33:16', 'rota 119 - chapadinha', 0),
(115, '2022-02-22 17:33:28', 'ROTA 120 - tutóia', 0),
(116, '2022-06-10 11:42:04', 'rota - grande ilha', 0),
(117, '2022-06-27 16:03:11', 'Central de entregas', -60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ocorrencias`
--

INSERT INTO `ocorrencias` (`id`, `nome`) VALUES
(1, 'Endereço não encotrado'),
(2, 'Dificil acesso'),
(3, 'Moto apreendida'),
(6, 'Ausente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `producao`
--

CREATE TABLE `producao` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `receber_id` int(11) NOT NULL,
  `regioes_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `rotas_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `receber`
--

CREATE TABLE `receber` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `disponivel` int(11) DEFAULT NULL,
  `clientes_id` int(11) NOT NULL,
  `gaiolas_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `regioes`
--

CREATE TABLE `regioes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `regioes`
--

INSERT INTO `regioes` (`id`, `nome`) VALUES
(74, 'GRANDE ILHA'),
(76, 'COCAIS'),
(77, 'LENÇÓIS'),
(78, 'CENTRAL'),
(79, 'BAIXADA'),
(80, 'CHAPADA'),
(81, 'SUL DO MARANHÃO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `retorno`
--

CREATE TABLE `retorno` (
  `id` int(11) NOT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `ocorrencias_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `producao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `retorno_gaiola`
--

CREATE TABLE `retorno_gaiola` (
  `id` int(11) NOT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `qtd` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entregadores_id` int(11) NOT NULL,
  `ocorrencias_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `producao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rotas`
--

CREATE TABLE `rotas` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `nome` varchar(45) DEFAULT NULL,
  `regioes_id` int(11) NOT NULL,
  `gaiolas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `rotas`
--

INSERT INTO `rotas` (`id`, `data`, `nome`, `regioes_id`, `gaiolas_id`) VALUES
(13, '2022-02-04 22:48:05', 'ROTA 01 - PAÇO ', 74, 39),
(14, '2022-02-04 22:48:05', 'ROTA 02 - ELDORADO', 74, 40),
(15, '2022-02-04 22:48:05', 'ROTA 03 - RECANTO', 74, 41),
(16, '2022-02-04 22:48:05', 'ROTA 04 - VINHAIS', 74, 42),
(17, '2022-02-04 22:48:05', 'ROTA 05 - ANIL  ', 74, 43),
(18, '2022-02-04 22:48:05', 'ROTA 06 - VILA PALMEIRA', 74, 44),
(19, '2022-02-04 22:48:05', 'ROTA 07 - COROADINHO', 74, 45),
(20, '2022-02-04 22:48:05', 'ROTA 08 - SÃO FRANCISCO', 74, 46),
(21, '2022-02-04 22:48:05', 'ROTA 09 - PONTA DO FAROL', 74, 47),
(22, '2022-02-04 22:48:05', 'ROTA 10 - CIDADE OPERÁRIA', 74, 48),
(23, '2022-02-04 22:48:05', 'ROTA 100 - BACABAL', 76, 49),
(24, '2022-02-04 22:48:05', 'ROTA 101 - LAGO DA PEDRA', 76, 50),
(25, '2022-02-04 22:48:05', 'ROTA 102 - BARRA DO CORDA', 76, 51),
(26, '2022-02-04 22:48:05', 'ROTA 103 - COROATÁ', 76, 52),
(27, '2022-02-04 22:48:05', 'ROTA 104 - COLINAS', 76, 53),
(28, '2022-02-04 22:48:05', 'ROTA 105 - DOM PEDRO', 76, 54),
(29, '2022-02-04 22:48:05', 'ROTA 106 - PRES. DUTRA / TUMTUM', 76, 55),
(30, '2022-02-04 22:48:05', 'ROTA 107 - PEDREIRAS / TRIZIDELA', 76, 56),
(31, '2022-02-04 22:48:05', 'ROTA 108 - SÃO MATEUS', 76, 57),
(32, '2022-02-04 22:48:05', 'ROTA 109 - ROSÁRIO', 77, 58),
(33, '2022-02-04 22:48:05', 'ROTA 11 - COHATRAC ', 74, 59),
(34, '2022-02-04 22:48:05', 'Rota 110 - BARRERINHAS', 77, 60),
(35, '2022-02-04 22:48:05', 'ROTA 111 - ZÉ DOCA', 78, 61),
(36, '2022-02-04 22:48:05', 'ROTA 112 - SANTA INÊS/ PINDARÉ', 78, 62),
(37, '2022-02-04 22:48:05', 'ROTA 113 - SANTA LUZIA', 78, 63),
(38, '2022-02-04 22:48:05', 'ROTA 114 - VIANA / ARARI', 79, 64),
(39, '2022-02-04 22:48:05', 'ROTA 115 - SÃO BENTO', 79, 65),
(40, '2022-02-04 22:48:05', 'ROTA 116 - PINHEIRO', 79, 66),
(41, '2022-02-04 22:48:05', 'ROTA 117 - CURURUPU', 79, 67),
(42, '2022-02-04 22:48:05', 'ROTA 12 - LIBERDADE', 74, 68),
(43, '2022-02-04 22:48:05', 'ROTA 121 - CAROLINA/ESTREITO/GRAJAÚ/J.LISBOA/', 81, 69),
(44, '2022-02-04 22:48:05', 'ROTA 122 - IMPERATRIZ', 81, 70),
(45, '2022-02-04 22:48:05', 'ROTA 123 - BALSAS', 81, 71),
(46, '2022-02-04 22:48:05', 'ROTA 122 - IMPERATRIZ', 81, 70),
(47, '2022-02-04 22:48:05', 'ROTA 124 - AÇAILÂNDIA ', 81, 72),
(48, '2022-02-04 22:48:05', 'ROTA 13 - COHAB', 74, 73),
(49, '2022-02-04 22:48:05', 'ROTA 14 - ARAÇAGY', 74, 74),
(50, '2022-02-04 22:48:05', 'ROTA 15 - BR', 74, 75),
(51, '2022-02-04 22:48:05', 'ROTA 16 - SÃO CRISTÓVÃO', 74, 76),
(52, '2022-02-04 22:48:05', 'ROTA 17 - ANJO DA GUARDA', 74, 77),
(53, '2022-02-04 22:48:05', 'ROTA 18 - RENASCENÇA', 74, 78),
(54, '2022-02-04 22:48:05', 'ROTA 19 - TURU ', 74, 79),
(55, '2022-02-04 22:48:05', 'ROTA 20 - OLHO DÁGUA', 74, 80),
(56, '2022-02-04 22:48:05', 'ROTA 50 - CANTINHO DO CÉU ', 74, 81),
(57, '2022-02-04 22:48:05', 'ROTA 51 - DIVINÉIA', 74, 82),
(58, '2022-02-04 22:48:05', 'ROTA 52 - CENTRO', 74, 83),
(59, '2022-02-04 22:48:05', 'ROTA 53 - VILA EMBRATEL', 74, 84),
(60, '2022-02-04 22:48:05', 'ROTA 54 - TIRIRICAL', 74, 85),
(61, '2022-02-04 22:48:05', 'ROTA 55 - PONTA DA AREIA', 74, 86),
(62, '2022-02-04 22:48:05', 'ROTA 56 - FORQUILHA', 74, 87),
(63, '2022-02-04 22:48:05', 'ROTA 57 - CIDADE OLÍMPICA', 74, 88),
(64, '2022-02-04 22:48:05', 'ROTA 58 - SÃO JOSÉ DE RIBAMAR', 74, 89),
(66, '2022-02-22 16:44:38', 'ROTA 500 - ARLEAN', 74, 90),
(67, '2022-02-22 16:45:10', 'ROTA 501 - ANTONIO JOSE', 74, 91),
(68, '2022-02-22 16:45:32', 'ROTA 502 - JOSÉ CARLOS', 74, 92),
(69, '2022-02-22 16:50:13', 'ROTA 503 - GILMAR', 74, 93),
(70, '2022-02-22 16:52:44', 'ROTA 504 - VITAL', 74, 94),
(71, '2022-02-22 16:54:20', 'ROTA 505 - EDSON', 74, 95),
(72, '2022-02-22 16:55:02', 'ROTA 506 - ROBERTO', 74, 96),
(73, '2022-02-22 16:55:43', 'ROTA 507 - ANTONIO JOSE', 74, 97),
(74, '2022-02-22 16:58:44', 'ROTA 508 - DENILSON COSTA', 74, 98),
(75, '2022-02-22 16:59:23', 'ROTA 509 - NATAN', 74, 99),
(76, '2022-02-22 17:00:34', 'ROTA 510 - MARTINS', 74, 100),
(77, '2022-02-22 17:03:01', 'ROTA 511 - CLAUDENILSON', 74, 101),
(78, '2022-02-22 17:04:51', 'ROTA 512 - CARLINHOS', 74, 102),
(79, '2022-02-22 17:07:41', 'ROTA 513 - SERGIO', 74, 103),
(80, '2022-02-22 17:09:52', 'ROTA 514 - MAURO', 74, 104),
(81, '2022-02-22 17:11:06', 'ROTA 515 - WILLIAN', 74, 105),
(82, '2022-02-22 17:11:50', 'ROTA 516 - JAILSON', 74, 106),
(83, '2022-02-22 17:14:40', 'ROTA 517 - JORGE LUIS', 74, 107),
(84, '2022-02-22 17:15:37', 'ROTA 518 - CLODOALDO', 74, 108),
(85, '2022-02-22 17:17:31', 'ROTA 519 - ARAÇAGI - MARCOS FONSECA', 74, 109),
(86, '2022-02-22 17:19:33', 'ROTA 520 - DELNILSON BRANDÃO', 74, 110),
(87, '2022-02-22 17:36:02', 'ROTA 21 - RIBAMAR', 74, 111),
(88, '2022-02-22 17:37:25', 'ROTA 22 - SHOPPING', 74, 112),
(89, '2022-02-22 17:40:46', 'ROTA 118 - itapecuru', 80, 113),
(90, '2022-02-22 17:41:40', 'rota 119 - chapadinha', 80, 114),
(91, '2022-02-22 17:43:59', 'ROTA 120 - tutóia', 80, 115),
(92, '2022-06-10 11:42:17', 'rota - grande ilha', 74, 116),
(93, '2022-06-27 16:05:32', 'central de entregas', 74, 117);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `setores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `setores_id`) VALUES
(1, 'Pequenos volumes', 1),
(3, 'Boletos', 3),
(4, 'Cartões', 3),
(5, 'Grandes volumes', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `setores`
--

CREATE TABLE `setores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `setores`
--

INSERT INTO `setores` (`id`, `nome`) VALUES
(1, 'E- commerce'),
(3, 'Editorial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo`
--

INSERT INTO `tipo` (`id`, `nome`) VALUES
(1, 'RETORNO A GAIOLA'),
(2, 'BACK LOG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargos_id` int(11) NOT NULL,
  `acessos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cargos_id`, `acessos_id`) VALUES
(4, 'admin', 'admin@eneylton.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG', 1, 1),
(7, 'ene', 'eneylton@hotmail.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG', 1, 2),
(13, 'enexs', 'enex@gmail.com.br', '202cb962ac59075b964b07152d234b70', 1, 3),
(14, 'editorial', 'editorial@montnegro.com', '$2y$10$Y2e6dARV.9g9v6v5PHRWguesD5ifKnK1MdjCMm9fR9N.m0C0cADbu', 1, 2),
(15, 'Eneylton Barros', 'eneylton@eneylton.com', '$2y$10$WXsSklMZxF6ROzkWaAdnzeguYGJCshsNo9c6XIrxrifK9KAh7Bk76', 8, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `nome`) VALUES
(1, 'MOTO'),
(2, 'CARRO'),
(3, 'CAMINHÃO'),
(5, 'BIKE');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `backlog`
--
ALTER TABLE `backlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_retorno_ocorrencias1_idx1` (`ocorrencias_id`),
  ADD KEY `fk_retorno_entregadores1_idx1` (`entregadores_id`),
  ADD KEY `fk_retorno_tipo1_idx1` (`tipo_id`),
  ADD KEY `fk_backlog_producao1_idx` (`producao_id`);

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_clientes_setores1_idx` (`setores_id`);

--
-- Índices para tabela `devolucao`
--
ALTER TABLE `devolucao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_devolucao_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_devolucao_producao1_idx` (`producao_id`),
  ADD KEY `fk_devolucao_ocorrencias1_idx` (`ocorrencias_id`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entrega_producao1_idx` (`producao_id`),
  ADD KEY `fk_entrega_entregadores1_idx` (`entregadores_id`);

--
-- Índices para tabela `entregadores`
--
ALTER TABLE `entregadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entregadores_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_entregadores_forma_pagamento1_idx` (`forma_pagamento_id`),
  ADD KEY `fk_entregadores_veiculos1_idx` (`veiculos_id`),
  ADD KEY `fk_entregadores_regioes1_idx` (`regioes_id`);

--
-- Índices para tabela `entregador_rota`
--
ALTER TABLE `entregador_rota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entregador_rota_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_entregador_rota_rotas1_idx` (`rotas_id`),
  ADD KEY `fk_entregador_rota_regioes1_idx` (`regioes_id`);

--
-- Índices para tabela `entregador_servicos`
--
ALTER TABLE `entregador_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entregador_servicos_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_entregador_servicos_servicos1_idx` (`servicos_id`);

--
-- Índices para tabela `entregador_setores`
--
ALTER TABLE `entregador_setores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entregador_setores_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_entregador_setores_setores1_idx` (`setores_id`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `gaiolas`
--
ALTER TABLE `gaiolas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `producao`
--
ALTER TABLE `producao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producao_entregadores1_idx` (`entregadores_id`),
  ADD KEY `fk_producao_receber1_idx` (`receber_id`),
  ADD KEY `fk_producao_regioes1_idx` (`regioes_id`),
  ADD KEY `fk_producao_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_producao_rotas1_idx` (`rotas_id`),
  ADD KEY `fk_producao_setores1_idx` (`setores_id`),
  ADD KEY `fk_producao_servicos1_idx` (`servicos_id`);

--
-- Índices para tabela `receber`
--
ALTER TABLE `receber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_receber_clientes1_idx` (`clientes_id`),
  ADD KEY `fk_receber_gaiolas1_idx` (`gaiolas_id`),
  ADD KEY `fk_receber_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_receber_servicos1_idx` (`servicos_id`),
  ADD KEY `fk_receber_setores1_idx` (`setores_id`);

--
-- Índices para tabela `regioes`
--
ALTER TABLE `regioes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `retorno`
--
ALTER TABLE `retorno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_retorno_ocorrencias1_idx1` (`ocorrencias_id`),
  ADD KEY `fk_retorno_producao1_idx` (`producao_id`),
  ADD KEY `fk_retorno_entregadores1_idx1` (`entregadores_id`),
  ADD KEY `fk_retorno_tipo1_idx1` (`tipo_id`);

--
-- Índices para tabela `retorno_gaiola`
--
ALTER TABLE `retorno_gaiola`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_retorno_ocorrencias1_idx1` (`ocorrencias_id`),
  ADD KEY `fk_retorno_entregadores1_idx1` (`entregadores_id`),
  ADD KEY `fk_retorno_tipo1_idx1` (`tipo_id`),
  ADD KEY `fk_retorno_gaiola_producao1_idx` (`producao_id`);

--
-- Índices para tabela `rotas`
--
ALTER TABLE `rotas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `backlog`
--
ALTER TABLE `backlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `devolucao`
--
ALTER TABLE `devolucao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `entregadores`
--
ALTER TABLE `entregadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT de tabela `entregador_rota`
--
ALTER TABLE `entregador_rota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de tabela `entregador_servicos`
--
ALTER TABLE `entregador_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;

--
-- AUTO_INCREMENT de tabela `entregador_setores`
--
ALTER TABLE `entregador_setores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `gaiolas`
--
ALTER TABLE `gaiolas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `producao`
--
ALTER TABLE `producao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `receber`
--
ALTER TABLE `receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `regioes`
--
ALTER TABLE `regioes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de tabela `retorno`
--
ALTER TABLE `retorno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT de tabela `retorno_gaiola`
--
ALTER TABLE `retorno_gaiola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rotas`
--
ALTER TABLE `rotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `receber`
--
ALTER TABLE `receber`
  ADD CONSTRAINT `fk_receber_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receber_setores1` FOREIGN KEY (`setores_id`) REFERENCES `setores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
