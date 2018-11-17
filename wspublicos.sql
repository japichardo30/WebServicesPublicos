-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2018 a las 13:21:33
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wspublicos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `cedula` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `cedula`) VALUES
(1, 'Maria Martinez', '00103401020'),
(2, 'Alexny Yamilex', '01158845693'),
(3, 'Samuel Peña', '11800102045'),
(4, 'Uriel Ventura', '00245636987'),
(5, 'Edgar Valdez', '00184732698'),
(6, 'Pedro Junior Custodio', '40232145632'),
(7, 'Gregory Jimenez', '00236985413'),
(8, 'Jorge Hernandez', '40225587988'),
(9, 'Angel Torres', '01123132565'),
(10, 'Leandro Jimenez', '00125689765'),
(11, 'Jose Alexis Pichardo', '40226712283'),
(12, 'Amaurys Sanchez', '00125689743'),
(13, 'Juan Pablo', '00109875632'),
(14, 'Kelfi Batista', '00232515351');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialcrediticio`
--

CREATE TABLE `historialcrediticio` (
  `id_historial` int(11) NOT NULL,
  `rnc_empresa_adeudo` varchar(11) NOT NULL,
  `concepto_deuda` varchar(150) NOT NULL,
  `monto_deuda` decimal(7,2) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historialcrediticio`
--

INSERT INTO `historialcrediticio` (`id_historial`, `rnc_empresa_adeudo`, `concepto_deuda`, `monto_deuda`, `fecha`, `id_cliente`) VALUES
(1, '05878985748', 'Televisor Plasma ', '5000.00', '0000-00-00', 1),
(2, '78985878987', 'Hyundai Sonata 2008', '25000.00', '0000-00-00', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indiceinflacion`
--

CREATE TABLE `indiceinflacion` (
  `id_indice` int(11) NOT NULL,
  `fecha_perido` date NOT NULL,
  `promedio_inflacion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `indiceinflacion`
--

INSERT INTO `indiceinflacion` (`id_indice`, `fecha_perido`, `promedio_inflacion`) VALUES
(2, '2018-01-01', 3.41),
(3, '2018-02-01', 3.41),
(4, '2018-03-01', 3.47),
(5, '2018-04-01', 3.51),
(6, '2018-05-01', 3.63),
(7, '2018-06-01', 3.8),
(8, '2018-07-01', 3.96),
(9, '2018-08-01', 4.01),
(10, '2018-09-01', 3.97);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saludfinanciera`
--

CREATE TABLE `saludfinanciera` (
  `id_salud_financiera` int(11) NOT NULL,
  `indicador` decimal(4,0) NOT NULL,
  `comentario` varchar(150) NOT NULL,
  `monto_total_adeudado` decimal(7,2) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saludfinanciera`
--

INSERT INTO `saludfinanciera` (`id_salud_financiera`, `indicador`, `comentario`, `monto_total_adeudado`, `id_cliente`) VALUES
(1, '120', 'Puede tomar creditos pequeños', '5000.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasacambio`
--

CREATE TABLE `tasacambio` (
  `cod_moneda` varchar(3) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `valor_venta` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tasacambio`
--

INSERT INTO `tasacambio` (`cod_moneda`, `descripcion`, `valor_venta`) VALUES
('BRL', 'REAL BRASILENO', '13.41'),
('CAD', 'DOLAR CANADIENSE', '37.99'),
('CHF', 'FRANCO SUIZO', '49.73'),
('CHY', 'YUAH CHINO', '7.17'),
('DKK', 'CORONA DANESA', '7.58'),
('EUR', 'EURO', '56.58'),
('GBP', 'LIBRA ESTERLINA', '63.86'),
('JPY', 'YEN JAPONES', '0.44'),
('NOK', 'CORONA NORUEGA', '5.92'),
('SCP', 'LIBRA ESCOCESA', '63.86'),
('SEK', 'CORONA SUECA', '5.45'),
('USD', 'DOLAR ESTADOUNIDENSE', '49.99'),
('VEF', 'BOLIVAR  FUERTE VENEZOLANO', '5.00'),
('XDR', 'DERECHO ESPECIAL DE GIRO 2', '69.10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `historialcrediticio`
--
ALTER TABLE `historialcrediticio`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `indiceinflacion`
--
ALTER TABLE `indiceinflacion`
  ADD PRIMARY KEY (`id_indice`);

--
-- Indices de la tabla `saludfinanciera`
--
ALTER TABLE `saludfinanciera`
  ADD PRIMARY KEY (`id_salud_financiera`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `tasacambio`
--
ALTER TABLE `tasacambio`
  ADD PRIMARY KEY (`cod_moneda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `historialcrediticio`
--
ALTER TABLE `historialcrediticio`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `indiceinflacion`
--
ALTER TABLE `indiceinflacion`
  MODIFY `id_indice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `saludfinanciera`
--
ALTER TABLE `saludfinanciera`
  MODIFY `id_salud_financiera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historialcrediticio`
--
ALTER TABLE `historialcrediticio`
  ADD CONSTRAINT `historialcrediticio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `saludfinanciera`
--
ALTER TABLE `saludfinanciera`
  ADD CONSTRAINT `saludfinanciera_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
