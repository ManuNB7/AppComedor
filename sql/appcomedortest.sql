-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2024 a las 11:43:16
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
(1, 1, 'daw');

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
  `campo_tupper` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`dia`, `idPersona`, `idPadre`, `incidencia`, `fecha_alta`, `campo_tupper`) VALUES
('2024-04-11', 9, 1, NULL, '2024-04-14 14:40:47', 0),
('2024-04-16', 15, 1, NULL, '2024-04-15 18:29:57', 0),
('2024-04-18', 9, 1, NULL, '2024-04-17 09:32:07', 0),
('2024-04-22', 19, 1, NULL, '2024-04-20 08:52:46', 0),
('2024-04-23', 19, 1, NULL, '2024-04-20 08:52:46', 0),
('2024-04-24', 19, 1, NULL, '2024-04-20 08:52:46', 0),
('2024-04-25', 19, 1, NULL, '2024-04-20 08:52:46', 0),
('2024-04-26', 19, 1, NULL, '2024-04-20 08:52:46', 0);

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
(19, 1, 1, '60028C04', 1),
(20, 1, 1, 'AFD1AA0A', 1),
(21, 1, 1, '664C2F44', 1),
(22, 1, 1, 'F293614C', 1),
(23, 1, 1, 'CB654FAA', 1),
(24, 1, 1, 'AAED6C4D', 1),
(25, 1, 1, 'CCBF84C9', 1),
(26, 1, 1, 'AB8D2B1C', 1),
(27, 1, 1, '7456EF8F', 1);

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
(1, 19, 1),
(1, 20, 1),
(1, 21, 1),
(1, 22, 1),
(1, 23, 1),
(1, 24, 1),
(1, 25, 1),
(1, 26, 1),
(1, 27, 1);

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


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperacionclaves`
--

CREATE TABLE `recuperacionclaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `fechaLimite` datetime NOT NULL,
  `codigo` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `recuperacionclaves`
--

INSERT INTO `recuperacionclaves` (`id`, `fechaLimite`, `codigo`) VALUES
(1, '2024-04-02 16:38:41', '826BAE420E57DEA9');

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
(6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD KEY `FK_Curso_id` (`id`);

--
-- Indices de la tabla `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`dia`,`idPersona`),
  ADD KEY `FK_Dias_idPersona` (`idPersona`),
  ADD KEY `FK_Dias_idPadre` (`idPadre`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15877;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dias`
--
ALTER TABLE `dias`
  ADD CONSTRAINT `FK_Dias_idPadre` FOREIGN KEY (`idPadre`) REFERENCES `padre` (`id`),
  ADD CONSTRAINT `FK_Dias_idPersona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id`);

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
