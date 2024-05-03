-- Volcado de datos para la tabla `curso`
INSERT INTO `curso` (`id`, `orden`, `nombre`) VALUES
(1, 1, 'daw');

-- Volcado de datos para la tabla `dias`
INSERT INTO `dias` (`dia`, `idPersona`, `idPadre`, `incidencia`, `fecha_alta`, `campo_tupper`) VALUES
('2024-04-11', 9, 1, NULL, '2024-04-14 14:40:47', 0),
('2024-04-16', 15, 1, NULL, '2024-04-15 18:29:57', 0),
('2024-04-18', 9, 1, NULL, '2024-04-17 09:32:07', 0),
('2024-04-22', 19, 1, NULL, '2024-04-20 08:52:46', 0),
('2024-04-23', 19, 1, NULL, '2024-04-20 08:52:46', 0),
('2024-04-24', 19, 1, NULL, '2024-04-20 08:52:46', 0),
('2024-04-25', 19, 1, NULL, '2024-04-20 08:52:46', 0),
('2024-04-26', 19, 1, NULL, '2024-04-20 08:52:46', 0);

-- Volcado de datos para la tabla `hijo`
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

-- Volcado de datos para la tabla `recuperacionclaves`
INSERT INTO `recuperacionclaves` (`id`, `fechaLimite`, `codigo`) VALUES
(1, '2024-04-02 16:38:41', '826BAE420E57DEA9');

-- Volcado de datos para la tabla `usuario`
INSERT INTO `usuario` (`id`) VALUES
(6);
-- Más datos para la tabla `curso`
INSERT INTO `curso` (`id`, `orden`, `nombre`) VALUES
(2, 2, 'dpw'),
(3, 3, 'diw');

-- Más datos para la tabla `dias`
INSERT INTO `dias` (`dia`, `idPersona`, `idPadre`, `incidencia`, `fecha_alta`, `campo_tupper`) VALUES
('2024-04-17', 12, 2, NULL, '2024-04-16 10:20:35', 0),
('2024-04-19', 10, 3, 'Fiebre', '2024-04-18 12:45:21', 1),
('2024-04-20', 18, 2, NULL, '2024-04-19 14:37:49', 0),
('2024-04-21', 11, 3, NULL, '2024-04-20 16:58:22', 0);

-- Más datos para la tabla `hijo`
INSERT INTO `hijo` (`id`, `idPadreAlta`, `idCurso`, `pin`, `activo`) VALUES
(28, 1, 2, 'D482E6B2', 1),
(29, 2, 2, '5BAA61E4', 1),
(30, 1, 2, '202CB962', 1),
(31, 3, 3, '5F4DCC3B', 1),
(32, 3, 3, 'C4CA4238', 1);
