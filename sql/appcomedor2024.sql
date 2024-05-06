-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2024 a las 19:18:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appcomedor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(10) UNSIGNED NOT NULL,
  `orden` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `orden`, `nombre`) VALUES
(1, 1, 'daw'),
(2, 2, 'dpw'),
(3, 3, 'diw');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE `dias` (
  `dia` date NOT NULL,
  `idPersona` int(10) UNSIGNED NOT NULL,
  `idPadre` int(10) UNSIGNED DEFAULT NULL,
  `incidencia` varchar(500) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `tupper` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`dia`, `idPersona`, `idPadre`, `incidencia`, `fecha_alta`, `tupper`) VALUES
('2024-04-24', 2, 1, NULL, '2024-04-22 18:25:16', 0),
('2024-04-24', 3, 1, NULL, '2024-04-22 18:25:17', 0),
('2024-04-25', 2, 1, NULL, '2024-04-22 18:25:17', 1),
('2024-04-25', 3, 1, NULL, '2024-04-22 18:25:17', 1),
('2024-04-26', 3, 1, NULL, '2024-04-22 18:25:18', 0),
('2024-05-01', 3, 1, NULL, '2024-04-22 18:26:05', 1),
('2024-04-30', 3, 1, NULL, '2024-04-22 18:26:07', 1),
('2024-04-29', 3, 1, NULL, '2024-04-22 18:26:07', 0),
('2024-04-30', 2, 1, NULL, '2024-04-24 16:30:15', 0),
('2024-04-29', 2, 1, NULL, '2024-04-24 16:30:15', 1),
('2024-05-01', 2, 1, NULL, '2024-04-24 16:30:15', 1),
('2024-05-09', 2, 1, NULL, '2024-05-02 18:11:01', 1),
('2024-05-08', 2, 1, NULL, '2024-05-02 18:11:01', 0),
('2024-05-07', 2, 1, NULL, '2024-05-02 18:11:02', 1),
('2024-05-06', 6, 5, 'ASDF', '2024-05-03 06:39:55', 1),
('2024-05-10', 3, 1, NULL, '2024-05-03 15:17:40', 0),
('2024-05-10', 2, 1, NULL, '2024-05-03 15:18:15', 0),
('2024-05-16', 3, 1, NULL, '2024-05-04 10:37:44', 0),
('2024-06-04', 3, 1, NULL, '2024-05-04 10:39:08', 0),
('2024-06-05', 3, 1, NULL, '2024-05-04 10:39:09', 0),
('2024-06-06', 2, 1, NULL, '2024-05-04 10:39:09', 0),
('2024-06-07', 2, 1, NULL, '2024-05-04 10:39:10', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `festivo`
--

CREATE TABLE `festivo` (
  `diaFestivo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hijo`
--

CREATE TABLE `hijo` (
  `id` int(10) UNSIGNED NOT NULL,
  `idPadreAlta` int(10) UNSIGNED NOT NULL,
  `idCurso` int(10) UNSIGNED NOT NULL,
  `pin` char(8) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `hijo`
--

INSERT INTO `hijo` (`id`, `idPadreAlta`, `idCurso`, `pin`, `activo`) VALUES
(2, 1, 1, 'D8AADD8D', 1),
(3, 1, 1, '0E79000D', 1),
(6, 5, 1, 'D5337207', 1),
(19, 1, 1, '60028C04', 1),
(20, 1, 1, 'AFD1AA0A', 1),
(21, 1, 1, '664C2F44', 1),
(22, 1, 1, 'F293614C', 1),
(23, 1, 1, 'CB654FAA', 1),
(24, 1, 1, 'AAED6C4D', 1),
(25, 1, 1, 'CCBF84C9', 1),
(26, 1, 1, 'AB8D2B1C', 1),
(27, 1, 1, '7456EF8F', 1),
(28, 2, 2, 'D482E6B2', 1),
(29, 2, 2, '5BAA61E4', 1),
(30, 2, 2, '202CB962', 1),
(31, 3, 3, '5F4DCC3B', 1),
(32, 3, 3, 'C4CA4238', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hijo_padre`
--

CREATE TABLE `hijo_padre` (
  `idPadre` int(10) UNSIGNED NOT NULL,
  `idHijo` int(10) UNSIGNED NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `hijo_padre`
--

INSERT INTO `hijo_padre` (`idPadre`, `idHijo`, `activo`) VALUES
(1, 2, 1),
(1, 3, 1),
(5, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `accion` varchar(255) DEFAULT NULL,
  `metodo` varchar(50) DEFAULT NULL,
  `datos` text DEFAULT NULL,
  `resultados` text DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `controlador` varchar(255) DEFAULT NULL,
  `pathParams` varchar(255) DEFAULT NULL,
  `queryParams` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`id`, `fecha`, `accion`, `metodo`, `datos`, `resultados`, `usuario`, `controlador`, `pathParams`, `queryParams`, `body`) VALUES
(1, '2024-03-28 15:10:29', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"a@g.com\",\"clave\":\"asdf\"}'),
(2, '2024-03-28 15:11:52', NULL, 'POST', NULL, NULL, NULL, 'persona', '', '', '{\"nombre\":\"antonio\",\"apellidos\":\"antonio\",\"correo\":\"a@gmail.com\",\"clave\":\"12345678\",\"telefono\":\"666666666\",\"dni\":\"66666666c\",\"iban\":\"ES9121000418450200051332\",\"titular\":\"antonio\"}'),
(3, '2024-03-28 15:11:54', NULL, 'POST', NULL, NULL, NULL, 'padres', '', '', '\"1\"'),
(4, '2024-03-28 15:11:55', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"a@gmail.com\",\"clave\":\"12345678\"}'),
(5, '2024-03-28 15:11:57', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(6, '2024-03-28 15:11:57', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(7, '2024-03-28 15:11:57', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(8, '2024-03-28 15:11:57', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(9, '2024-03-28 15:12:38', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"a@gmail.com\",\"clave\":\"12345678\"}'),
(10, '2024-03-28 15:12:41', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(11, '2024-03-28 15:12:41', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(12, '2024-03-28 15:12:41', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(13, '2024-03-28 15:12:41', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(14, '2024-03-28 15:15:34', NULL, 'PUT', NULL, NULL, NULL, 'persona', '', '', '{\"id\":1,\"nombre\":\"antonio\",\"apellidos\":\"antonio\",\"telefono\":\"666666666\",\"correo\":\"antonio@gmail.com\"}'),
(15, '2024-03-28 15:15:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(16, '2024-03-28 15:15:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(17, '2024-03-28 15:15:53', NULL, 'PUT', NULL, NULL, NULL, 'persona', '', '', '{\"id\":1,\"nombre\":\"antonio\",\"apellidos\":\"antonio\",\"telefono\":\"666666666\",\"correo\":\"antonio@gmail.com\"}'),
(18, '2024-03-28 15:15:57', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(19, '2024-03-28 15:15:57', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(20, '2024-03-28 15:15:59', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(21, '2024-03-28 15:15:59', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(22, '2024-03-28 15:17:47', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(23, '2024-03-28 15:17:47', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(24, '2024-03-28 15:17:47', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(25, '2024-03-28 15:17:50', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"a@gmail.com\",\"clave\":\"12345678\"}'),
(26, '2024-03-28 15:17:56', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"antonio@gmail.com\",\"clave\":\"12345678\"}'),
(27, '2024-03-28 15:17:59', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(28, '2024-03-28 15:17:59', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(29, '2024-03-28 15:17:59', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(30, '2024-03-28 15:17:59', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(31, '2024-03-28 15:18:13', NULL, 'POST', NULL, NULL, NULL, 'hijos', 'altaHijo', '', '{\"id\":1,\"nombre\":\"fernando\",\"apellidos\":\"alonso\",\"idCurso\":1}'),
(32, '2024-03-28 15:18:14', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(33, '2024-03-28 15:18:27', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(34, '2024-03-28 15:18:27', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(35, '2024-03-28 15:18:27', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(36, '2024-03-28 15:18:28', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(37, '2024-03-28 15:18:28', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(38, '2024-03-28 15:18:29', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(39, '2024-03-28 15:18:30', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(40, '2024-03-28 15:18:30', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(41, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-4-2024##31-5-2024', 'null'),
(42, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(43, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(44, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(45, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(46, '2024-03-28 15:18:34', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(47, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(48, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(49, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(50, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(51, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(52, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(53, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-3-2024##30-4-2024', 'null'),
(54, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(55, '2024-03-28 15:18:35', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(56, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(57, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(58, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(59, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(60, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(61, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(62, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(63, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(64, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(65, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(66, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(67, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(68, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(69, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(70, '2024-03-28 15:18:36', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(71, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(72, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(73, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(74, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(75, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(76, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(77, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(78, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(79, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(80, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-1-2024##29-2-2024', 'null'),
(81, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(82, '2024-03-28 15:18:37', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(83, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(84, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(85, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(86, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(87, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(88, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(89, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(90, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(91, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(92, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(93, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(94, '2024-03-28 15:18:38', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(95, '2024-03-28 15:18:39', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(96, '2024-03-28 15:18:39', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(97, '2024-03-28 15:18:39', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(98, '2024-03-28 15:18:41', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(99, '2024-03-28 15:18:41', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(100, '2024-03-28 15:18:41', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(101, '2024-03-28 15:18:42', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-2-2024##31-3-2024', 'null'),
(102, '2024-03-28 15:18:42', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(103, '2024-03-28 15:18:42', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2', 'null'),
(104, '2024-04-21 09:20:38', NULL, 'POST', NULL, NULL, NULL, 'login', '', '', '{\"usuario\":\"a@g.com\",\"clave\":\"12345678\"}'),
(105, '2024-04-21 09:20:41', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(106, '2024-04-21 09:20:41', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(107, '2024-04-21 09:20:41', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-4-2024##31-5-2024', 'null'),
(108, '2024-04-21 09:20:41', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(109, '2024-04-21 09:20:41', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2##3', 'null'),
(110, '2024-04-21 09:20:42', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-4-2024##31-5-2024', 'null'),
(111, '2024-04-21 09:20:42', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(112, '2024-04-21 09:20:42', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2##3', 'null'),
(113, '2024-04-21 09:20:42', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-24\",\"idPersona\":3,\"idPadre\":1}'),
(114, '2024-04-21 09:20:43', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-24##3##1', '', 'null'),
(115, '2024-04-21 09:20:43', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-24\",\"idPersona\":3,\"idPadre\":1}'),
(116, '2024-04-21 09:20:43', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-24##3##1', '', 'null'),
(117, '2024-04-21 09:20:43', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-24\",\"idPersona\":3,\"idPadre\":1}'),
(118, '2024-04-21 09:20:43', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-24##3##1', '', 'null'),
(119, '2024-04-21 09:20:44', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-24\",\"idPersona\":3,\"idPadre\":1}'),
(120, '2024-04-21 09:20:44', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-24##3##1', '', 'null'),
(121, '2024-04-21 09:20:44', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-24\",\"idPersona\":3,\"idPadre\":1}'),
(122, '2024-04-21 09:20:44', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-24##3##1', '', 'null'),
(123, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(124, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-4-2024##31-5-2024', 'null'),
(125, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(126, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(127, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2##3', 'null'),
(128, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'cursos', '', '', 'null'),
(129, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-4-2024##31-5-2024', 'null'),
(130, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(131, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(132, '2024-04-21 09:20:47', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2##3', 'null'),
(133, '2024-04-21 09:20:48', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-4-2024##31-5-2024', 'null'),
(134, '2024-04-21 09:20:48', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(135, '2024-04-21 09:20:48', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2##3', 'null'),
(136, '2024-04-21 09:20:49', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-24\",\"idPersona\":3,\"idPadre\":1}'),
(137, '2024-04-21 09:20:49', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-24##3##1', '', 'null'),
(138, '2024-04-21 09:20:50', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-4-2024##31-5-2024', 'null'),
(139, '2024-04-21 09:20:50', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(140, '2024-04-21 09:20:50', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2##3', 'null'),
(141, '2024-04-21 09:21:02', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-16\",\"idPersona\":3,\"idPadre\":1}'),
(142, '2024-04-21 09:21:02', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-16##3##1', '', 'null'),
(143, '2024-04-21 09:21:02', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-16\",\"idPersona\":3,\"idPadre\":1}'),
(144, '2024-04-21 09:21:03', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-16##3##1', '', 'null'),
(145, '2024-04-21 09:21:03', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-16\",\"idPersona\":3,\"idPadre\":1}'),
(146, '2024-04-21 09:21:03', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-16##3##1', '', 'null'),
(147, '2024-04-21 09:21:03', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-16\",\"idPersona\":3,\"idPadre\":1}'),
(148, '2024-04-21 09:21:07', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-16##3##1', '', 'null'),
(149, '2024-04-21 09:21:08', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-16\",\"idPersona\":3,\"idPadre\":1}'),
(150, '2024-04-21 09:21:08', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-16##3##1', '', 'null'),
(151, '2024-04-21 09:21:08', NULL, 'POST', NULL, NULL, NULL, 'dias', '', '', '{\"dia\":\"2024-04-16\",\"idPersona\":3,\"idPadre\":1}'),
(152, '2024-04-21 09:21:08', NULL, 'DELETE', NULL, NULL, NULL, 'dias', '2024-04-16##3##1', '', 'null'),
(153, '2024-04-21 09:21:11', NULL, 'GET', NULL, NULL, NULL, 'festivos', '', '1-4-2024##31-5-2024', 'null'),
(154, '2024-04-21 09:21:11', NULL, 'GET', NULL, NULL, NULL, 'hijos', '', '1', 'null'),
(155, '2024-04-21 09:21:11', NULL, 'GET', NULL, NULL, NULL, 'dias', '', '2##3', 'null'),
(156, '2024-04-21 09:21:21', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjZjZTExYWVjZjllYjE0MDI0YTQ0YmJmZDFiY2Y4YjMyYTEyMjg3ZmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyOTY1MTAzNTYzMjAzNTU3ODUiLCJoZCI6ImFsdW1uYWRvLmZ1bmRhY2lvbmxveW9sYS5uZXQiLCJlbWFpbCI6ImFudG9uaW9yZXllc3JhYmVsLmd1YWRhbHVwZUBhbHVtbmFkby5mdW5kYWNpb25sb3lvbGEubmV0IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5iZiI6MTcxMzY5MDk4NCwibmFtZSI6IkFudG9uaW8gUmV5ZXMgUmFiZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGl2dE5OaXpXcjhRUTlDSDhlSkU5M0w2SkxZR3hWNWt6LUVDZ3haa3V5ZEtEVHp3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkFudG9uaW8iLCJmYW1pbHlfbmFtZSI6IlJleWVzIFJhYmVsIiwiaWF0IjoxNzEzNjkxMjg0LCJleHAiOjE3MTM2OTQ4ODQsImp0aSI6IjQzOTQzM2Q2ZTBlMmZiMDkzNzMzYzRiN2JhMDM2NTFlZGYxZjQ4M2MifQ.r2AfGPvCeVWdSO9gfHM7iW8lmS86-TT3DEs8VIiib1pmpqH_q0ndfahMIwLFM6Bb_fwazk1oJ593xclWcI2FxF4aFdnjeG1-YEidXPvO1L3oX1k6SHC65x_reMAC5e6xEpft2-jx-uQin2SHczAtA17cvAE94bpMQocJh4MawRBxPN_pE9lUP5SnYoZA6kVwMUaUhjNsYXuLU_IkiafoX_jDO1xCvebsQjAhVWP8UqbNW23nRFrdZhEeV1elyR6kF3aHzo0EOeYbHkKdwiipHrVpUArSb8F6L_jYot0BsSOo_WRVD-xCg50x6OLcCtxtnE1ou6Ya9RZhnFzzihl6jw\"'),
(157, '2024-04-21 09:21:23', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"mjaque@fundacionloyola.es\"'),
(158, '2024-04-21 09:21:25', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjZjZTExYWVjZjllYjE0MDI0YTQ0YmJmZDFiY2Y4YjMyYTEyMjg3ZmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyOTY1MTAzNTYzMjAzNTU3ODUiLCJoZCI6ImFsdW1uYWRvLmZ1bmRhY2lvbmxveW9sYS5uZXQiLCJlbWFpbCI6ImFudG9uaW9yZXllc3JhYmVsLmd1YWRhbHVwZUBhbHVtbmFkby5mdW5kYWNpb25sb3lvbGEubmV0IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5iZiI6MTcxMzY5MDk4OCwibmFtZSI6IkFudG9uaW8gUmV5ZXMgUmFiZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGl2dE5OaXpXcjhRUTlDSDhlSkU5M0w2SkxZR3hWNWt6LUVDZ3haa3V5ZEtEVHp3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkFudG9uaW8iLCJmYW1pbHlfbmFtZSI6IlJleWVzIFJhYmVsIiwiaWF0IjoxNzEzNjkxMjg4LCJleHAiOjE3MTM2OTQ4ODgsImp0aSI6Ijc2MDkwNTI5YTVjYTUyY2U4MDBlZjViOTQ0YjMzNWEyOTdmMWFjNWYifQ.o39UDp-ZpNOo0Qpu5NOQCvgVVPhJiekL9geNAA4TqsxBMRloe2aXg-S71_V-GEe4wfB2V4Ho2bxDSq9v6rlWV5UjSRUAw_idkEU3A1oefVdNh_1-U_vr7rQXXi9eYxZurA0cQCsimDYeLEiTLNcD_JsqKYBIbgMZTVqR8At1wjMR8xK-x29on8eHkoRBGbYCgM-hzwWmoDIYoCRERTZQudQ59b8zbEfpwcWcTumCM6z4h8FiJ4Ck3-qAYelEsjAtXjtDnrizGORtcxXuSP9xI_VIc79O1GCsc02vj3EqfUF9AiUADWXD4IPD7bITsq7-xuZmCv3H-q0LsxEeAaV9xQ\"'),
(159, '2024-04-21 09:22:55', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjZjZTExYWVjZjllYjE0MDI0YTQ0YmJmZDFiY2Y4YjMyYTEyMjg3ZmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyOTY1MTAzNTYzMjAzNTU3ODUiLCJoZCI6ImFsdW1uYWRvLmZ1bmRhY2lvbmxveW9sYS5uZXQiLCJlbWFpbCI6ImFudG9uaW9yZXllc3JhYmVsLmd1YWRhbHVwZUBhbHVtbmFkby5mdW5kYWNpb25sb3lvbGEubmV0IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5iZiI6MTcxMzY5MTA3OCwibmFtZSI6IkFudG9uaW8gUmV5ZXMgUmFiZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGl2dE5OaXpXcjhRUTlDSDhlSkU5M0w2SkxZR3hWNWt6LUVDZ3haa3V5ZEtEVHp3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkFudG9uaW8iLCJmYW1pbHlfbmFtZSI6IlJleWVzIFJhYmVsIiwiaWF0IjoxNzEzNjkxMzc4LCJleHAiOjE3MTM2OTQ5NzgsImp0aSI6IjViODFiNzYyOWIzMGYxOTQ0NWM0NTI0MmNmZTM0MWY0ZTJiNWY3OWEifQ.XCUNsMDCJQWDKl5BJ9_rNOJ9l7gSWmPgd0gpsRtyHyvfsBJbSfklo4eJ0cxYDcjPesbgZjj_w5PMIXdk60DwT9TgpoIdQXyvB8Z9w9Hot6v4FqRu2ukOeV1VqKwN-czE37W1VrFeAfjzrxxrm3JIPe5PZj9KKyYxIH6_KLhGsz-2SH-OH6iawcTvU-voEQ1fWCDbz5eFqWzlEhh6gDwCZKqQf09LG63MAYrqiG6VBcCrGz3cAOwFhFUH5V3p3Cyq5DpQ4pdP3_i884wZM6UHM1K_MYGKhWJSCYrHaz6SOwtyC9nC53cBLT6G2dnSFjD8evHln0-oyuBFNgmCkQtlxw\"'),
(160, '2024-04-21 09:22:59', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjZjZTExYWVjZjllYjE0MDI0YTQ0YmJmZDFiY2Y4YjMyYTEyMjg3ZmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyOTY1MTAzNTYzMjAzNTU3ODUiLCJoZCI6ImFsdW1uYWRvLmZ1bmRhY2lvbmxveW9sYS5uZXQiLCJlbWFpbCI6ImFudG9uaW9yZXllc3JhYmVsLmd1YWRhbHVwZUBhbHVtbmFkby5mdW5kYWNpb25sb3lvbGEubmV0IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5iZiI6MTcxMzY5MTA4MSwibmFtZSI6IkFudG9uaW8gUmV5ZXMgUmFiZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGl2dE5OaXpXcjhRUTlDSDhlSkU5M0w2SkxZR3hWNWt6LUVDZ3haa3V5ZEtEVHp3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkFudG9uaW8iLCJmYW1pbHlfbmFtZSI6IlJleWVzIFJhYmVsIiwiaWF0IjoxNzEzNjkxMzgxLCJleHAiOjE3MTM2OTQ5ODEsImp0aSI6IjQ5MjI1ZDE5Y2U5MGYwYzRmZWEzYzA0YWIxMzI0OGViNzZhYzA3MDYifQ.wlym6BLDr2nore69le6GbZDJpcwm-gK8migAEpy1PBBAUXdxECkr_oEJKt31aVpVzd-zTrYt120YYMLyVhUisK3ghDdwtNdd2lUnZZ9NGVaBSV0T6THhd5-K8w_qhewUKDhDK7f_KN6FlMQbNIRTeaymHQWbTti95jkMkWrLm_SH1gbbHDnuboJfbp3K6uslMitZG9LTM9OSAkSqgBIG116z-DwRJeFHgvLEOgOkUAQnJj6LFyI694V0rsGo2IfHsiIO6PrDnzdDT2o7Px2KQIoJoxjJOOvBfQBJs9PBb9xsY2616NxsTdOZxq6YSa0gU98KbBoVQqOKm4pkk3d32g\"'),
(161, '2024-04-21 09:23:05', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjZjZTExYWVjZjllYjE0MDI0YTQ0YmJmZDFiY2Y4YjMyYTEyMjg3ZmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyOTY1MTAzNTYzMjAzNTU3ODUiLCJoZCI6ImFsdW1uYWRvLmZ1bmRhY2lvbmxveW9sYS5uZXQiLCJlbWFpbCI6ImFudG9uaW9yZXllc3JhYmVsLmd1YWRhbHVwZUBhbHVtbmFkby5mdW5kYWNpb25sb3lvbGEubmV0IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5iZiI6MTcxMzY5MTA4NywibmFtZSI6IkFudG9uaW8gUmV5ZXMgUmFiZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGl2dE5OaXpXcjhRUTlDSDhlSkU5M0w2SkxZR3hWNWt6LUVDZ3haa3V5ZEtEVHp3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkFudG9uaW8iLCJmYW1pbHlfbmFtZSI6IlJleWVzIFJhYmVsIiwiaWF0IjoxNzEzNjkxMzg3LCJleHAiOjE3MTM2OTQ5ODcsImp0aSI6ImNmNjNlMmIxMzAxYWYxNWRlYjMwNzhjNGJlZWQzMGE2Mjk2MGFkZWEifQ.XCYh-jBuvTNikQfN1zrBdatW9oGEveJcW-snCHat985OJeFq1uzjCwK3WI3CuY09Fnh57EdeSpfApMs2rdaZ9Uq2zkY-VENwPRbL8-bVkh7YKNCgNxbFq0TeOQ55n8CDNeOgbtSL1jqoFjP01S_CYdzWoV1a05Vfwg6M-FOqBM6v5UKjML91X9UC_WP9MxjVnQHjzxA7RZ4Ph2WPprZoWgQqn3ZTqjIsbmZ1vuTKCpf85i3u8_OnXHzoGjOtnX5Avz_HpTUmXFxfCR2lrB0XStRLZ-0OVjHCg3z_0ENcBz5pftCXJQOqQAL2m_L-luDUUx2guSdf3cj-BJpBYyOMqg\"'),
(162, '2024-04-21 09:23:06', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"mjaque@fundacionloyola.es\"'),
(163, '2024-04-21 09:23:08', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjZjZTExYWVjZjllYjE0MDI0YTQ0YmJmZDFiY2Y4YjMyYTEyMjg3ZmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyOTY1MTAzNTYzMjAzNTU3ODUiLCJoZCI6ImFsdW1uYWRvLmZ1bmRhY2lvbmxveW9sYS5uZXQiLCJlbWFpbCI6ImFudG9uaW9yZXllc3JhYmVsLmd1YWRhbHVwZUBhbHVtbmFkby5mdW5kYWNpb25sb3lvbGEubmV0IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5iZiI6MTcxMzY5MTA5MSwibmFtZSI6IkFudG9uaW8gUmV5ZXMgUmFiZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGl2dE5OaXpXcjhRUTlDSDhlSkU5M0w2SkxZR3hWNWt6LUVDZ3haa3V5ZEtEVHp3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkFudG9uaW8iLCJmYW1pbHlfbmFtZSI6IlJleWVzIFJhYmVsIiwiaWF0IjoxNzEzNjkxMzkxLCJleHAiOjE3MTM2OTQ5OTEsImp0aSI6IjY5ZTZmZTRmMmU5YTk1YTQ4NGJlNDMyMjUwOTAyMDAyYjgxYzhlZDMifQ.IbCcBGpLD1DUK7QQ4QdNjz06AiLIzSU3Edv6DtwTGIhP3FMJ9btOseecLkduYd8ewyUiN-0LIICqEcWEY8FJoN6yfRjDdjXeex5cdOAREbX20K4VlQsy92J-Bs3a6ALzTsoSEg59eoCCHN3KCFu4bLK1LcuvjiqrhkguI7CENE2AaU42P2M5b1pYHKtxULPQlto9Wns6tmhmVrfbR1f6nkg0M1tdGPa6payYRSVwMHtyQfxWltYgSpwPh1PujRhCCUj1xGqXt8OnrdaRnvSawYLUL2tmbhDchTwUTbTPA9TP6KZXE5uRsMlmBMmHddIQlviQxJR4EVV6CEcWS2U_lg\"'),
(164, '2024-04-21 09:23:17', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"mjaque@fundacionloyola.es\"'),
(165, '2024-04-21 09:23:21', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjZjZTExYWVjZjllYjE0MDI0YTQ0YmJmZDFiY2Y4YjMyYTEyMjg3ZmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyOTY1MTAzNTYzMjAzNTU3ODUiLCJoZCI6ImFsdW1uYWRvLmZ1bmRhY2lvbmxveW9sYS5uZXQiLCJlbWFpbCI6ImFudG9uaW9yZXllc3JhYmVsLmd1YWRhbHVwZUBhbHVtbmFkby5mdW5kYWNpb25sb3lvbGEubmV0IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5iZiI6MTcxMzY5MTEwNCwibmFtZSI6IkFudG9uaW8gUmV5ZXMgUmFiZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGl2dE5OaXpXcjhRUTlDSDhlSkU5M0w2SkxZR3hWNWt6LUVDZ3haa3V5ZEtEVHp3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkFudG9uaW8iLCJmYW1pbHlfbmFtZSI6IlJleWVzIFJhYmVsIiwiaWF0IjoxNzEzNjkxNDA0LCJleHAiOjE3MTM2OTUwMDQsImp0aSI6IjJmNzczOGI5ZjlkYTYyMDVhNzI2NTU0NDdjNDUxNzIxMmM2NDAzYTMifQ.nZvfxCt52pxsOaa1RKQ_ZlNRBtLfMLObNrSAQZYxchyqHIfhILLB6vemzLgkUgEsmyToty6MuTCUoKmJcOcUZg_ikQj_j3isAUTFtJ_j6nDII_oMVOAg6HPFlOLMkuUMb1ZufG25yf3iZAmSeoizetGy5teE81VfGz2f7klcIsUSki4hE0WeE9xR2nvsaUJITDVZerxXvFn9ykCxnLoYK0P2XMIuEWax8jjlM3cKudrk7Zcfj07nntYvANrzle15rk7ZQJ-cjPMMDiWeGTDWZECYm2L3lcR_n22UoLTDbHk5wlk7QCJvrzGhR2rICgolEeYzu8IYfdeHfDjTT3IU_A\"'),
(166, '2024-04-21 09:23:43', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"mjaque@fundacionloyola.es\"'),
(167, '2024-04-21 09:23:45', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjZjZTExYWVjZjllYjE0MDI0YTQ0YmJmZDFiY2Y4YjMyYTEyMjg3ZmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyOTY1MTAzNTYzMjAzNTU3ODUiLCJoZCI6ImFsdW1uYWRvLmZ1bmRhY2lvbmxveW9sYS5uZXQiLCJlbWFpbCI6ImFudG9uaW9yZXllc3JhYmVsLmd1YWRhbHVwZUBhbHVtbmFkby5mdW5kYWNpb25sb3lvbGEubmV0IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5iZiI6MTcxMzY5MTEyOCwibmFtZSI6IkFudG9uaW8gUmV5ZXMgUmFiZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGl2dE5OaXpXcjhRUTlDSDhlSkU5M0w2SkxZR3hWNWt6LUVDZ3haa3V5ZEtEVHp3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkFudG9uaW8iLCJmYW1pbHlfbmFtZSI6IlJleWVzIFJhYmVsIiwiaWF0IjoxNzEzNjkxNDI4LCJleHAiOjE3MTM2OTUwMjgsImp0aSI6ImZjOGY1MGFlOTRhMmY5NTVmNDczMmE5M2MxNTA2MTExOWY0YTkwNjEifQ.extNKY-xrb0SLg8OaJaUliASqzJuxRvw4WpoRQTh8ZdN-EOKBSr9Dnoj-jRjA7qLpgR2dzJf3NKWZWUCKTuJ9Y_8HlzV5IvQs0sLnQYPDcpR4SBIVdmPzxWV7F2eD-BB_Q77wXwgkLkj112tFL4FxhlX6NnFDM2z5T96_a-Sr9UINCogY_wvdIHv10QJYpLwqiEtaIEw1OXcek5-3l6_f5eq_CGRsg6OWk1pD3Nrn0IM9nKP8mp57fZyzErcrKoaRy_6iL0jBoq9N6lEPU5UtZEQUqomhWeuMRXPSv5230X687jlQHOKy57X1oSKe9tjt0SLZFVB03Bx0jVeu1lVZQ\"'),
(168, '2024-04-21 09:23:47', NULL, 'POST', NULL, NULL, NULL, 'login_google', '', '', '\"eyJhbGciOiJSUzI1NiIsImtpZCI6IjZjZTExYWVjZjllYjE0MDI0YTQ0YmJmZDFiY2Y4YjMyYTEyMjg3ZmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4Mjk2NDA5MDI2ODAtNDh0MnVxM3VzN3FpdDNlaGJ1c3AydDZmbGRmZWg2cjYuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyOTY1MTAzNTYzMjAzNTU3ODUiLCJoZCI6ImFsdW1uYWRvLmZ1bmRhY2lvbmxveW9sYS5uZXQiLCJlbWFpbCI6ImFudG9uaW9yZXllc3JhYmVsLmd1YWRhbHVwZUBhbHVtbmFkby5mdW5kYWNpb25sb3lvbGEubmV0IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5iZiI6MTcxMzY5MTEzMCwibmFtZSI6IkFudG9uaW8gUmV5ZXMgUmFiZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jTGl2dE5OaXpXcjhRUTlDSDhlSkU5M0w2SkxZR3hWNWt6LUVDZ3haa3V5ZEtEVHp3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkFudG9uaW8iLCJmYW1pbHlfbmFtZSI6IlJleWVzIFJhYmVsIiwiaWF0IjoxNzEzNjkxNDMwLCJleHAiOjE3MTM2OTUwMzAsImp0aSI6ImNlOWJhYTQxYTFlNzlkNTljNTFlOGY1NDAzODY1ODQ2NjZjYWI4YzIifQ.AAJhZSvpAxAEO0c4OMPhxk2G3BBNmeacrDdDcfhWp74sPFNX0y0UWmNEOmw_BtB99_hYM73COfUaX5Dl90PgqM6Kjy1sOoxqauCD1C3UQwtNh1-BAFxkAxnuuWNUzkVatp6y3rhxF0SR-wcaiGfvRzYVgP6Sx0gpJd-NXq0jj4a8PRLKGrdnuZ7QHEl3SrkZzu72GqkQJH71OGgdX01KYpUyv7kSyYlLDIca9-Cup6lRIFRVSiYw2lZD_ZWhK2P6lh7RrYL4i4yjO_ZY2gbdPFUc57NrA1THMymYnP19zbsT7oHJZU6jg_Em9JVpgX_o2VwtK4H-5v2RY2jLhkazGw\"');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padre`
--

CREATE TABLE `padre` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `padre`
--

INSERT INTO `padre` (`id`) VALUES
(1),
(5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `correo` varchar(90) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `telefono` char(9) DEFAULT NULL,
  `dni` char(9) DEFAULT NULL,
  `iban` char(24) DEFAULT NULL,
  `titular` varchar(120) DEFAULT NULL,
  `fechaFirmaMandato` date DEFAULT NULL,
  `referenciaUnicaMandato` varchar(35) DEFAULT NULL,
  `_notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellidos`, `correo`, `clave`, `activo`, `telefono`, `dni`, `iban`, `titular`, `fechaFirmaMandato`, `referenciaUnicaMandato`, `_notas`) VALUES
(1, 'antonio', 'aaaaaa', 'antonio@gmail.com', '$2y$15$7y0Grz.ZxYMn/YkNdbXyMOoUYpFzC0qUklI/3zufN1ZxhmeJq6cm6', 1, '666666666', '66666666c', 'ES9121000418450200051332', 'antonio', NULL, NULL, NULL),
(2, 'fernando', 'alonso', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'asdfas', 'dfasdfa', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Antonio', 'Reyes Rabel', 'antonioreyesrabel.guadalupe@alumnado.fundacionloyola.net', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'aaaaaa', 'aaad', 'a@fundacionloyola.es', '$2y$15$r71yf3puF4.9p3as/uvJduHs0er9C08zrvp62Pyl/btegS9.diQuK', 1, '666666666', '20200212c', 'ES6000491500051234567892', 'yo', NULL, NULL, NULL),
(6, 'dddd', 'dd', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperacionclaves`
--

CREATE TABLE `recuperacionclaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `fechaLimite` datetime NOT NULL,
  `codigo` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`) VALUES
(4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD KEY `FK_Curso_id` (`id`);

--
-- Indices de la tabla `festivo`
--
ALTER TABLE `festivo`
  ADD PRIMARY KEY (`diaFestivo`);

--
-- Indices de la tabla `hijo`
--
ALTER TABLE `hijo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Hijo_pin` (`pin`),
  ADD KEY `FK_Hijo_idPadreAlta` (`idPadreAlta`),
  ADD KEY `FK_Hijo_idCurso` (`idCurso`);

--
-- Indices de la tabla `hijo_padre`
--
ALTER TABLE `hijo_padre`
  ADD PRIMARY KEY (`idPadre`,`idHijo`),
  ADD KEY `FK_Hijo_Padre_idHijo` (`idHijo`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `padre`
--
ALTER TABLE `padre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_correoPersona` (`correo`),
  ADD UNIQUE KEY `UQ_referenciaUnicaMandato` (`referenciaUnicaMandato`),
  ADD UNIQUE KEY `UQ_dniPersona` (`dni`);

--
-- Indices de la tabla `recuperacionclaves`
--
ALTER TABLE `recuperacionclaves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_RecuperacionClaves_Codigo` (`codigo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hijo`
--
ALTER TABLE `hijo`
  ADD CONSTRAINT `FK_Hijo_id` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Hijo_idCurso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `FK_Hijo_idPadreAlta` FOREIGN KEY (`idPadreAlta`) REFERENCES `padre` (`id`);

--
-- Filtros para la tabla `hijo_padre`
--
ALTER TABLE `hijo_padre`
  ADD CONSTRAINT `FK_Hijo_Padre_idHijo` FOREIGN KEY (`idHijo`) REFERENCES `hijo` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Hijo_Padre_idPadre` FOREIGN KEY (`idPadre`) REFERENCES `padre` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `padre`
--
ALTER TABLE `padre`
  ADD CONSTRAINT `FK_Padre_id` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `recuperacionclaves`
--
ALTER TABLE `recuperacionclaves`
  ADD CONSTRAINT `FK_RecuperacionClaves_id` FOREIGN KEY (`id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_Usuario_id` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
