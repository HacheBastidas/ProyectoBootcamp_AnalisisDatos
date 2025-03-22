-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 02:52:33
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
-- Base de datos: `proyecto_grupo1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprovechamiento`
--

CREATE TABLE `aprovechamiento` (
  `id_aprovechamiento` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_programa` int(11) DEFAULT NULL,
  `frecuencia_uso_internet` decimal(10,4) DEFAULT NULL,
  `frecuencia_uso_celular` decimal(10,4) DEFAULT NULL,
  `frecuencia_uso_computador` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aprovechamiento`
--

INSERT INTO `aprovechamiento` (`id_aprovechamiento`, `id_departamento`, `id_programa`, `frecuencia_uso_internet`, `frecuencia_uso_celular`, `frecuencia_uso_computador`) VALUES
(1, 1, 12, 1.4490, 6.3371, 1.0045),
(2, 2, 10, 4.5920, 6.7454, 3.3947),
(3, 3, 17, 2.9310, 6.3806, 1.7116),
(4, 4, 5, 4.2420, 6.5351, 3.1122),
(5, 5, 23, 3.4980, 6.2703, 2.7208),
(6, 6, 31, 3.0760, 6.7076, 2.6201),
(7, 7, 4, 4.0540, 6.6045, 2.5142),
(8, 8, 8, 2.8750, 6.4034, 1.7111),
(9, 9, 14, 3.6770, 6.6269, 2.5078),
(10, 10, 2, 2.9900, 6.0689, 2.2856),
(11, 11, 27, 3.3000, 6.4758, 2.2490),
(12, 12, 30, 2.3530, 6.1887, 1.6425),
(13, 13, 7, 2.8630, 6.3899, 2.2343),
(14, 14, 36, 4.3060, 6.5911, 3.1130),
(15, 15, 21, 1.6870, 6.0080, 1.9144),
(16, 16, 35, 2.5830, 6.2648, 2.3163),
(17, 17, 32, 3.2190, 6.4861, 2.5217),
(18, 18, 25, 2.4030, 6.2636, 1.7462),
(19, 19, 19, 3.3850, 6.4173, 2.8478),
(20, 20, 9, 4.4770, 6.6539, 2.6837),
(21, 21, 16, 3.0460, 6.2917, 2.5978),
(22, 22, 20, 3.9830, 6.4593, 2.5795),
(23, 23, 13, 2.3430, 6.3242, 1.8613),
(24, 24, 3, 4.4640, 6.6679, 2.9241),
(25, 25, 1, 4.6890, 6.6726, 3.2843),
(26, 26, 37, 3.7920, 6.8598, 4.1610),
(27, 27, 6, 4.3220, 6.5955, 3.0882),
(28, 28, 26, 2.8780, 6.4188, 2.1646),
(29, 29, 28, 3.9260, 6.4688, 2.8035),
(30, 30, 34, 4.8870, 6.6490, 3.3830),
(31, 31, 11, 1.1200, 6.3687, 1.3732),
(32, 32, 22, 1.0990, 6.1311, 0.7392),
(33, 33, 38, 5.6500, 6.8260, 4.9181);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brecha_digital`
--

CREATE TABLE `brecha_digital` (
  `id_brecha` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `brecha_material` decimal(10,4) DEFAULT NULL,
  `brecha_aprovechamiento` decimal(10,4) DEFAULT NULL,
  `brecha_motivacion` decimal(10,4) DEFAULT NULL,
  `brecha_formacion` decimal(10,4) DEFAULT NULL,
  `brecha_global` decimal(10,4) DEFAULT NULL,
  `nivel_brecha` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `brecha_digital`
--

INSERT INTO `brecha_digital` (`id_brecha`, `id_departamento`, `brecha_material`, `brecha_aprovechamiento`, `brecha_motivacion`, `brecha_formacion`, `brecha_global`, `nivel_brecha`) VALUES
(1, 1, 0.9150, 0.5380, 0.1830, 0.8300, 0.6320, '32'),
(2, 2, 0.6600, 0.3590, 0.0690, 0.6750, 0.4540, '3'),
(3, 3, 0.8100, 0.4730, 0.1270, 0.7950, 0.5670, '25'),
(4, 4, 0.6750, 0.3950, 0.0660, 0.6950, 0.4720, '6'),
(5, 5, 0.7570, 0.4360, 0.0710, 0.7390, 0.5160, '15'),
(6, 6, 0.7720, 0.4350, 0.1110, 0.7140, 0.5220, '16'),
(7, 7, 0.7250, 0.4100, 0.0870, 0.7130, 0.4980, '11'),
(8, 8, 0.8050, 0.4780, 0.0970, 0.7770, 0.5550, '23'),
(9, 9, 0.7470, 0.4200, 0.0990, 0.7410, 0.5160, '14'),
(10, 10, 0.8210, 0.4810, 0.0910, 0.7710, 0.5570, '24'),
(11, 11, 0.7670, 0.4440, 0.0960, 0.7550, 0.5310, '19'),
(12, 12, 0.8560, 0.5050, 0.1150, 0.8140, 0.5890, '29'),
(13, 13, 0.8080, 0.4580, 0.1130, 0.7730, 0.5540, '21'),
(14, 14, 0.6870, 0.3900, 0.0800, 0.6940, 0.4760, '8'),
(15, 15, 0.8760, 0.5280, 0.1710, 0.8290, 0.6170, '30'),
(16, 16, 0.8430, 0.4680, 0.1490, 0.7770, 0.5740, '26'),
(17, 17, 0.7680, 0.4380, 0.1020, 0.7500, 0.5290, '18'),
(18, 18, 0.8370, 0.4970, 0.1290, 0.8220, 0.5870, '28'),
(19, 19, 0.7640, 0.4340, 0.0850, 0.7550, 0.5250, '17'),
(20, 20, 0.6920, 0.3880, 0.0750, 0.7070, 0.4790, '9'),
(21, 21, 0.7890, 0.4480, 0.0940, 0.7650, 0.5400, '20'),
(22, 22, 0.7280, 0.4180, 0.0750, 0.7230, 0.5010, '13'),
(23, 23, 0.8560, 0.4910, 0.1090, 0.7960, 0.5800, '27'),
(24, 24, 0.6910, 0.3870, 0.0750, 0.6860, 0.4740, '7'),
(25, 25, 0.6490, 0.3760, 0.0690, 0.6780, 0.4560, '4'),
(26, 26, 0.7640, 0.3700, 0.1150, 0.6880, 0.4980, '10'),
(27, 27, 0.6700, 0.3820, 0.0760, 0.6860, 0.4670, '5'),
(28, 28, 0.8170, 0.4660, 0.0940, 0.7750, 0.5540, '22'),
(29, 29, 0.7110, 0.4160, 0.0910, 0.7210, 0.4990, '12'),
(30, 30, 0.6290, 0.3560, 0.0600, 0.6860, 0.4460, '2'),
(31, 31, 0.9380, 0.5330, 0.1290, 0.8470, 0.6300, '31'),
(32, 32, 0.9400, 0.5610, 0.2050, 0.8800, 0.6630, '33'),
(33, 33, 0.5480, 0.2880, 0.0300, 0.5530, 0.3660, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(50) DEFAULT NULL,
  `hogares` int(11) NOT NULL,
  `poblacion` int(11) NOT NULL,
  `PIB_per_capita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `nombre_departamento`, `hogares`, `poblacion`, `PIB_per_capita`) VALUES
(1, 'Amazonas', 16290, 76589, 15200),
(2, 'Antioquia', 1983566, 6407102, 18500),
(3, 'Arauca', 75261, 262174, 23000),
(4, 'Atlántico', 625123, 253517, 17000),
(5, 'Bolívar', 542694, 2070110, 14500),
(6, 'Boyacá', 381868, 1217376, 12000),
(7, 'Caldas', 309680, 998255, 16000),
(8, 'Caquetá', 116166, 401849, 10500),
(9, 'Casanare', 128130, 420504, 28000),
(10, 'Cauca', 432493, 1464488, 9000),
(11, 'Cesar', 316717, 1200574, 14000),
(12, 'Chocó', 133687, 534826, 7000),
(13, 'Córdoba', 466615, 1784783, 10000),
(14, 'Cundinamarca', 945586, 2919060, 18000),
(15, 'Guainía', 9953, 48114, 8000),
(16, 'Guaviare', 22817, 82767, 12000),
(17, 'Huila', 319750, 1100386, 14000),
(18, 'La Guajira', 227367, 880560, 11000),
(19, 'Magdalena', 343790, 1341746, 9500),
(20, 'Meta', 304244, 1039722, 20000),
(21, 'Nariño', 449275, 1630592, 9000),
(22, 'Norte de Santander', 398300, 1491689, 13000),
(23, 'Putumayo', 107053, 348182, 10000),
(24, 'Quindío', 174231, 539904, 15000),
(25, 'Risaralda', 277932, 943401, 16000),
(26, 'San Andrés y Providencia', 16354, 61280, 21000),
(27, 'Santander', 647157, 2184837, 18000),
(28, 'Sucre', 240068, 904863, 11000),
(29, 'Tolima', 423353, 1330187, 12000),
(30, 'Valle del Cauca', 1267039, 4475886, 19000),
(31, 'Vaupés', 7020, 40797, 8500),
(32, 'Vichada', 19162, 107808, 9000),
(33, 'Bogotá D.C.', 2514482, 7412566, 24000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infraestructura_digital`
--

CREATE TABLE `infraestructura_digital` (
  `id_infraestructura` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `numero_antenas` int(11) NOT NULL,
  `puntos_wifi` int(11) DEFAULT NULL,
  `cobertura_territorial` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `infraestructura_digital`
--

INSERT INTO `infraestructura_digital` (`id_infraestructura`, `id_departamento`, `numero_antenas`, `puntos_wifi`, `cobertura_territorial`) VALUES
(1, 1, 12, 10, 20.0000),
(2, 2, 320, 210, 85.0000),
(3, 3, 30, 25, 40.0000),
(4, 4, 250, 200, 90.0000),
(5, 5, 190, 150, 75.0000),
(6, 6, 160, 130, 70.0000),
(7, 7, 120, 100, 65.0000),
(8, 8, 40, 30, 45.0000),
(9, 9, 35, 30, 50.0000),
(10, 10, 100, 80, 55.0000),
(11, 11, 150, 120, 60.0000),
(12, 12, 50, 35, 25.0000),
(13, 13, 110, 90, 65.0000),
(14, 14, 290, 230, 85.0000),
(15, 15, 8, 5, 10.0000),
(16, 16, 15, 10, 20.0000),
(17, 17, 140, 115, 70.0000),
(18, 18, 90, 70, 50.0000),
(19, 19, 135, 110, 65.0000),
(20, 20, 130, 100, 75.0000),
(21, 21, 100, 85, 60.0000),
(22, 22, 160, 130, 70.0000),
(23, 23, 25, 20, 40.0000),
(24, 24, 110, 95, 80.0000),
(25, 25, 125, 105, 85.0000),
(26, 26, 15, 10, 25.0000),
(27, 27, 220, 180, 80.0000),
(28, 28, 90, 70, 60.0000),
(29, 29, 130, 100, 75.0000),
(30, 30, 300, 250, 90.0000),
(31, 31, 10, 8, 15.0000),
(32, 32, 12, 9, 20.0000),
(33, 33, 400, 350, 95.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instituciones_educativas`
--

CREATE TABLE `instituciones_educativas` (
  `id_institucion` int(200) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `nombre_institucion` varchar(100) DEFAULT NULL,
  `numero_estudiantes` int(11) NOT NULL,
  `numero_docentes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instituciones_educativas`
--

INSERT INTO `instituciones_educativas` (`id_institucion`, `id_departamento`, `nombre_institucion`, `numero_estudiantes`, `numero_docentes`) VALUES
(1, 1, 'Institución Educativa San José del Amazonas', 120, 35),
(2, 1, 'Colegio Fray Javier de Amazonas', 75, 32),
(3, 1, 'Institución Educativa La Salle', 180, 40),
(4, 1, 'Colegio San Francisco', 95, 34),
(5, 1, 'Escuela Normal Superior de Leticia', 140, 37),
(6, 2, 'Institución Educativa San Ignacio de Loyola', 220, 50),
(7, 2, 'Colegio Mayor de Antioquia', 160, 45),
(8, 2, 'Institución Educativa La Presentación', 210, 47),
(9, 2, 'Institución Educativa Concejo de Medellín', 130, 42),
(10, 2, 'Colegio San José de Medellín', 175, 38),
(11, 3, 'Institución Educativa General Santander', 90, 33),
(12, 3, 'Colegio Integrado de Arauca', 110, 36),
(13, 3, 'Institución Educativa Agropecuaria El Torno', 80, 32),
(14, 3, 'Colegio Santa Teresita', 145, 40),
(15, 3, 'Institución Educativa Ciudad de Arauca', 60, 31),
(16, 4, 'Institución Educativa Barranquilla', 250, 52),
(17, 4, 'Colegio Nuestra Señora de Fátima', 185, 44),
(18, 4, 'Institución Educativa San Vicente de Paul', 230, 49),
(19, 4, 'Colegio El Buen Pastor', 130, 35),
(20, 4, 'Instituto Técnico Industrial de Barranquilla', 190, 48),
(21, 5, 'Institución Educativa San Felipe Neri', 170, 43),
(22, 5, 'Colegio de la Sagrada Familia', 210, 45),
(23, 5, 'Institución Educativa San Pedro Claver', 95, 36),
(24, 5, 'Colegio San Agustín', 115, 33),
(25, 5, 'Instituto Técnico Industrial de Cartagena', 225, 50),
(26, 6, 'Institución Educativa Suárez Rendón', 100, 31),
(27, 6, 'Colegio Antonio Nariño', 130, 40),
(28, 6, 'Institución Educativa Los Andes', 150, 39),
(29, 6, 'Colegio Santiago de Tunja', 180, 45),
(30, 6, 'Instituto Técnico Central', 95, 33),
(31, 7, 'Institución Educativa Manizales', 110, 32),
(32, 7, 'Colegio Inem José Celestino Mutis', 170, 44),
(33, 7, 'Institución Educativa La Consolata', 130, 41),
(34, 7, 'Colegio León de Greiff', 115, 34),
(35, 7, 'Escuela Normal Superior de Caldas', 105, 30),
(36, 8, 'Institución Educativa Amazónica', 120, 38),
(37, 8, 'Colegio San José de Belén', 95, 32),
(38, 8, 'Institución Educativa La Inmaculada', 140, 37),
(39, 8, 'Colegio Departamental de Florencia', 180, 45),
(40, 8, 'Institución Educativa El Jardín', 160, 42),
(41, 9, 'Institución Educativa La Sabana', 110, 34),
(42, 9, 'Colegio Integral de Yopal', 85, 31),
(43, 9, 'Institución Educativa Los Andes', 130, 39),
(44, 9, 'Colegio del Llano', 115, 33),
(45, 9, 'Institución Educativa Técnico Industrial', 170, 44),
(46, 10, 'Colegio Mayor de Popayán', 195, 47),
(47, 10, 'Institución Educativa La Esperanza', 90, 35),
(48, 10, 'Colegio San Francisco de Asís', 145, 40),
(49, 10, 'Institución Educativa La Milagrosa', 125, 36),
(50, 10, 'Escuela Normal Superior de Popayán', 160, 42),
(51, 11, 'Colegio Nacional Loperena', 140, 38),
(52, 11, 'Institución Educativa Alfonso López', 180, 46),
(53, 11, 'Instituto Técnico La Esperanza', 90, 35),
(54, 11, 'Colegio San Juan Bosco', 115, 34),
(55, 11, 'Institución Educativa Villa Carmen', 130, 40),
(56, 12, 'Institución Educativa San Francisco de Asís', 100, 32),
(57, 12, 'Colegio San Pío de Quibdó', 135, 36),
(58, 12, 'Institución Educativa Técnico Industrial', 115, 34),
(59, 12, 'Colegio San Pablo Apóstol', 160, 43),
(60, 12, 'Instituto Técnico Agropecuario', 140, 39),
(61, 13, 'Institución Educativa La Salle', 195, 46),
(62, 13, 'Colegio Nuestra Señora de Fátima', 110, 33),
(63, 13, 'Instituto Técnico Industrial de Montería', 130, 40),
(64, 13, 'Colegio San José de Ciénaga', 160, 41),
(65, 13, 'Instituto Politécnico Municipal', 180, 44),
(66, 14, 'Colegio Nuestra Señora de Chía', 200, 48),
(67, 14, 'Institución Educativa Pablo VI', 90, 35),
(68, 14, 'Instituto Técnico Zipaquirá', 140, 39),
(69, 14, 'Colegio Manuel Elkin Patarroyo', 170, 42),
(70, 14, 'Escuela Normal Superior de Ubaté', 155, 40),
(71, 15, 'Institución Educativa La Pedrera', 85, 32),
(72, 15, 'Colegio Francisco de Paula Santander', 105, 34),
(73, 15, 'Instituto Técnico Puerto Inírida', 60, 31),
(74, 15, 'Colegio Luis Carlos Galán', 90, 33),
(75, 15, 'Institución Educativa Pana Pana', 110, 36),
(76, 16, 'Institución Educativa General Santander', 95, 32),
(77, 16, 'Colegio Integrado de San José', 120, 37),
(78, 16, 'Instituto Técnico Guaviare', 85, 31),
(79, 16, 'Colegio La Esperanza', 105, 34),
(80, 16, 'Institución Educativa El Dorado', 115, 35),
(81, 17, 'Instituto Técnico de Neiva', 190, 47),
(82, 17, 'Colegio Departamental de Garzón', 120, 37),
(83, 17, 'Institución Educativa San Agustín', 150, 40),
(84, 17, 'Colegio María Auxiliadora', 180, 45),
(85, 17, 'Escuela Normal Superior de Pitalito', 140, 39),
(86, 18, 'Institución Educativa San Juan Bautista', 130, 39),
(87, 18, 'Colegio La Divina Pastora', 150, 40),
(88, 18, 'Instituto Técnico de Riohacha', 175, 43),
(89, 18, 'Colegio Nuestra Señora de Fátima', 105, 34),
(90, 18, 'Escuela Normal Superior de Fonseca', 95, 33),
(91, 19, 'Instituto Técnico San Martín', 160, 42),
(92, 19, 'Colegio El Carmen', 125, 37),
(93, 19, 'Institución Educativa San Juan Bosco', 140, 39),
(94, 19, 'Colegio de Santa Marta', 180, 45),
(95, 19, 'Escuela Normal Superior de Magdalena', 105, 34),
(96, 20, 'Institución Educativa San Martín', 135, 36),
(97, 20, 'Colegio Nuestra Señora del Carmen', 160, 42),
(98, 20, 'Instituto Técnico Industrial', 95, 32),
(99, 20, 'Colegio Santa María de Villavicencio', 120, 38),
(100, 20, 'Institución Educativa La Libertad', 180, 45),
(101, 21, 'Colegio Ciudad de Pasto', 145, 39),
(102, 21, 'Instituto Técnico Industrial', 125, 36),
(103, 21, 'Institución Educativa Sucre', 110, 35),
(104, 21, 'Colegio San Francisco de Asís', 140, 37),
(105, 21, 'Instituto Politécnico Municipal', 170, 44),
(106, 22, 'Instituto Técnico Guaimaral', 180, 46),
(107, 22, 'Colegio General Santander', 115, 35),
(108, 22, 'Instituto Técnico La Esperanza', 90, 33),
(109, 22, 'Colegio San Francisco', 150, 41),
(110, 22, 'Escuela Normal Superior de Ocaña', 130, 39),
(111, 23, 'Instituto Educativo José Antonio Galán', 105, 32),
(112, 23, 'Colegio La Esperanza', 115, 33),
(113, 23, 'Instituto Técnico Puerto Asís', 120, 37),
(114, 23, 'Colegio Rural El Rosal', 90, 31),
(115, 23, 'Institución Educativa El Páramo', 110, 36),
(116, 24, 'Institución Educativa Santa Teresa', 180, 45),
(117, 24, 'Colegio San José de Armenia', 130, 38),
(118, 24, 'Instituto Técnico Industrial', 140, 40),
(119, 24, 'Colegio Los Ángeles', 105, 34),
(120, 24, 'Escuela Normal Superior de Quindío', 155, 42),
(121, 25, 'Instituto Técnico de Pereira', 160, 43),
(122, 25, 'Colegio San Nicolás de Bari', 145, 38),
(123, 25, 'Instituto Técnico Industrial de Dosquebradas', 130, 36),
(124, 25, 'Colegio Santa Rosa de Cabal', 170, 44),
(125, 25, 'Escuela Normal Superior de Pereira', 180, 47),
(126, 26, 'Institución Educativa Modelo de San Andrés', 110, 35),
(127, 26, 'Colegio El Isleño', 95, 33),
(128, 26, 'Instituto Técnico Departamental', 85, 31),
(129, 26, 'Colegio María Auxiliadora', 105, 34),
(130, 26, 'Institución Educativa La Loma', 120, 37),
(131, 27, 'Colegio de Santander', 190, 47),
(132, 27, 'Instituto Técnico Dámaso Zapata', 150, 40),
(133, 27, 'Colegio San Pedro Claver', 170, 44),
(134, 27, 'Institución Educativa Bicentenario', 130, 39),
(135, 27, 'Escuela Normal Superior de Bucaramanga', 160, 42),
(136, 28, 'Colegio Santa Rosa de Lima', 120, 37),
(137, 28, 'Institución Educativa San Benito', 95, 32),
(138, 28, 'Instituto Técnico Agropecuario', 140, 39),
(139, 28, 'Colegio San Francisco de Asís', 130, 36),
(140, 28, 'Institución Educativa La Unión', 150, 41),
(141, 29, 'Instituto Técnico Industrial de Ibagué', 200, 48),
(142, 29, 'Colegio Tolimense', 145, 38),
(143, 29, 'Institución Educativa San Simón', 165, 43),
(144, 29, 'Colegio San Bonifacio de las Lanzas', 180, 45),
(145, 29, 'Escuela Normal Superior de Ibagué', 150, 41),
(146, 30, 'Instituto Técnico Industrial de Cali', 190, 47),
(147, 30, 'Colegio Santa Librada', 160, 42),
(148, 30, 'Colegio Claretiano', 175, 44),
(149, 30, 'Institución Educativa La Asunción', 130, 39),
(150, 30, 'Escuela Normal Superior Santiago de Cali', 155, 40),
(151, 31, 'Instituto Técnico Francisco José de Caldas', 90, 33),
(152, 31, 'Colegio Nuestra Señora del Carmen', 105, 34),
(153, 31, 'Institución Educativa Pedro Nel Ospina', 95, 32),
(154, 31, 'Colegio José María Córdoba', 85, 31),
(155, 31, 'Instituto Educativo Carurú', 115, 35),
(156, 32, 'Instituto Educativo Santa Rosalía', 100, 32),
(157, 32, 'Colegio La Primavera', 110, 36),
(158, 32, 'Instituto Técnico Puerto Carreño', 95, 33),
(159, 32, 'Colegio La Esperanza', 105, 34),
(160, 32, 'Instituto Educativo de Cumaribo', 120, 37),
(161, 33, 'Colegio Distrital San Bartolomé', 210, 55),
(162, 33, 'Instituto Técnico Central de Bogotá', 250, 60),
(163, 33, 'Colegio Distrital José Martí', 190, 52),
(164, 33, 'Colegio La Salle de Bogotá', 230, 58),
(165, 33, 'Escuela Normal Superior María Montessori', 220, 56);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `id_material` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_programa` int(11) DEFAULT NULL,
  `acceso_internet_publico` decimal(10,4) DEFAULT NULL,
  `acceso_internet_privado` decimal(10,4) DEFAULT NULL,
  `acceso_internet_hogar` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`id_material`, `id_departamento`, `id_programa`, `acceso_internet_publico`, `acceso_internet_privado`, `acceso_internet_hogar`) VALUES
(1, 1, 23, 0.0172, 0.1407, 0.1683),
(2, 2, 24, 0.1307, 0.3427, 0.6193),
(3, 3, 25, 0.0760, 0.2462, 0.3505),
(4, 4, 24, 0.0558, 0.3196, 0.5912),
(5, 5, 33, 0.0398, 0.2528, 0.4478),
(6, 6, 24, 0.0229, 0.2751, 0.3774),
(7, 7, 23, 0.0172, 0.2997, 0.5463),
(8, 8, 3, 0.0193, 0.1944, 0.3444),
(9, 9, 25, 0.0418, 0.3185, 0.4834),
(10, 10, 24, 0.0404, 0.2367, 0.3211),
(11, 11, 33, 0.0167, 0.2489, 0.4505),
(12, 12, 23, 0.0253, 0.1900, 0.3118),
(13, 13, 25, 0.0599, 0.2372, 0.3404),
(14, 14, 3, 0.0556, 0.3679, 0.5722),
(15, 15, 33, 0.0531, 0.1779, 0.1925),
(16, 16, 24, 0.0125, 0.1966, 0.3166),
(17, 17, 23, 0.0319, 0.2791, 0.4384),
(18, 18, 25, 0.0279, 0.1734, 0.3152),
(19, 19, 33, 0.0333, 0.2480, 0.4230),
(20, 20, 3, 0.0364, 0.3043, 0.6153),
(21, 21, 24, 0.0589, 0.2546, 0.3582),
(22, 22, 23, 0.0427, 0.2876, 0.4962),
(23, 23, 25, 0.0445, 0.1870, 0.2500),
(24, 24, 3, 0.0454, 0.2900, 0.5842),
(25, 25, 24, 0.1244, 0.3398, 0.6481),
(26, 26, 23, 0.1293, 0.4109, 0.3969),
(27, 27, 3, 0.0501, 0.3670, 0.6067),
(28, 28, 25, 0.0184, 0.2033, 0.3631),
(29, 29, 33, 0.0543, 0.3192, 0.5335),
(30, 30, 23, 0.0756, 0.3780, 0.6840),
(31, 31, 24, 0.0688, 0.1510, 0.0678),
(32, 32, 3, 0.0446, 0.0944, 0.1165),
(33, 33, 25, 0.0124, 0.5110, 0.7927);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivacion`
--

CREATE TABLE `motivacion` (
  `id_motivacion` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_programa` int(11) DEFAULT NULL,
  `no_usan_internet_costo` double(10,4) DEFAULT NULL,
  `no_usan_internet_interes` double(10,4) DEFAULT NULL,
  `no_usan_internet_no_saber_usarlo` double(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `motivacion`
--

INSERT INTO `motivacion` (`id_motivacion`, `id_departamento`, `id_programa`, `no_usan_internet_costo`, `no_usan_internet_interes`, `no_usan_internet_no_saber_usarlo`) VALUES
(1, 1, 15, 0.1293, 0.4039, 0.0920),
(2, 2, 7, 0.0687, 0.2024, 0.0825),
(3, 3, 10, 0.1647, 0.3606, 0.0919),
(4, 4, 34, 0.0902, 0.2363, 0.0262),
(5, 5, 8, 0.0790, 0.1856, 0.0861),
(6, 6, 2, 0.1123, 0.2535, 0.1764),
(7, 7, 36, 0.0918, 0.2085, 0.1225),
(8, 8, 19, 0.1708, 0.2424, 0.0917),
(9, 9, 1, 0.0888, 0.2877, 0.0935),
(10, 10, 23, 0.0881, 0.2441, 0.1157),
(11, 11, 31, 0.0953, 0.2354, 0.1121),
(12, 12, 27, 0.1632, 0.2330, 0.1079),
(13, 13, 16, 0.0814, 0.3338, 0.1017),
(14, 14, 21, 0.0585, 0.2360, 0.1126),
(15, 15, 4, 0.0529, 0.3043, 0.1158),
(16, 16, 26, 0.1126, 0.3129, 0.1697),
(17, 17, 30, 0.1148, 0.2995, 0.1069),
(18, 18, 5, 0.1076, 0.3134, 0.1440),
(19, 19, 9, 0.1149, 0.2063, 0.0900),
(20, 20, 12, 0.0452, 0.2025, 0.1147),
(21, 21, 37, 0.0898, 0.2497, 0.1340),
(22, 22, 13, 0.0746, 0.1664, 0.0884),
(23, 23, 18, 0.1790, 0.2225, 0.1078),
(24, 24, 20, 0.0974, 0.2095, 0.0675),
(25, 25, 22, 0.0612, 0.2203, 0.0834),
(26, 26, 14, 0.0713, 0.3460, 0.0888),
(27, 27, 29, 0.0576, 0.2253, 0.0888),
(28, 28, 25, 0.1268, 0.1961, 0.1114),
(29, 29, 32, 0.0594, 0.2608, 0.1153),
(30, 30, 35, 0.0455, 0.2082, 0.0903),
(31, 31, 6, 0.0520, 0.0241, 0.1107),
(32, 32, 28, 0.1982, 0.3454, 0.2024),
(33, 33, 33, 0.0318, 0.1075, 0.0539);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_formacion`
--

CREATE TABLE `nivel_formacion` (
  `id_nivel_formacion` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_institucion` int(11) NOT NULL,
  `nivel_formacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nivel_formacion`
--

INSERT INTO `nivel_formacion` (`id_nivel_formacion`, `id_departamento`, `id_institucion`, `nivel_formacion`) VALUES
(1, 1, 1, 'Primaria'),
(2, 1, 2, 'Básica Secundaria'),
(3, 1, 3, 'Técnico'),
(4, 1, 4, 'Normalista'),
(5, 1, 5, 'Media'),
(6, 2, 6, 'Primaria'),
(7, 2, 7, 'Básica Secundaria'),
(8, 2, 8, 'Técnico'),
(9, 2, 9, 'Normalista'),
(10, 2, 10, 'Media'),
(11, 3, 6, 'Primaria'),
(12, 3, 7, 'Básica Secundaria'),
(13, 3, 8, 'Técnico'),
(14, 3, 9, 'Normalista'),
(15, 3, 10, 'Media'),
(16, 4, 16, 'Primaria'),
(17, 4, 17, 'Básica Secundaria'),
(18, 4, 18, 'Técnico'),
(19, 4, 19, 'Normalista'),
(20, 4, 20, 'Media'),
(21, 5, 21, 'Primaria'),
(22, 5, 22, 'Básica Secundaria'),
(23, 5, 23, 'Técnico'),
(24, 5, 24, 'Normalista'),
(25, 5, 25, 'Media'),
(26, 6, 26, 'Primaria'),
(27, 6, 27, 'Básica Secundaria'),
(28, 6, 28, 'Técnico'),
(29, 6, 29, 'Normalista'),
(30, 6, 30, 'Media'),
(31, 7, 31, 'Primaria'),
(32, 7, 32, 'Básica Secundaria'),
(33, 7, 33, 'Técnico'),
(34, 7, 34, 'Normalista'),
(35, 7, 35, 'Media'),
(36, 8, 36, 'Primaria'),
(37, 8, 37, 'Básica Secundaria'),
(38, 8, 38, 'Técnico'),
(39, 8, 39, 'Normalista'),
(40, 8, 40, 'Media'),
(41, 9, 41, 'Primaria'),
(42, 9, 42, 'Básica Secundaria'),
(43, 9, 43, 'Técnico'),
(44, 9, 44, 'Media'),
(45, 9, 45, 'Técnico'),
(46, 10, 46, 'Básica Secundaria'),
(47, 10, 47, 'Primaria'),
(48, 10, 48, 'Media'),
(49, 10, 49, 'Bachillerato'),
(50, 10, 50, 'Técnico'),
(51, 11, 51, 'Primaria'),
(52, 11, 52, 'Básica Secundaria'),
(53, 11, 53, 'Técnico'),
(54, 11, 54, 'Normalista'),
(55, 11, 55, 'Media'),
(56, 12, 56, 'Primaria'),
(57, 12, 57, 'Básica Secundaria'),
(58, 12, 58, 'Técnico'),
(59, 12, 59, 'Normalista'),
(60, 12, 60, 'Media'),
(61, 13, 61, 'Primaria'),
(62, 13, 62, 'Básica Secundaria'),
(63, 13, 63, 'Técnico'),
(64, 13, 64, 'Normalista'),
(65, 13, 65, 'Media'),
(66, 14, 66, 'Primaria'),
(67, 14, 67, 'Básica Secundaria'),
(68, 14, 68, 'Técnico'),
(69, 14, 69, 'Normalista'),
(70, 14, 70, 'Media'),
(71, 15, 71, 'Primaria'),
(72, 15, 72, 'Básica Secundaria'),
(73, 15, 73, 'Técnico'),
(74, 15, 74, 'Normalista'),
(75, 15, 75, 'Media'),
(76, 16, 76, 'Primaria'),
(77, 16, 77, 'Básica Secundaria'),
(78, 16, 78, 'Técnico'),
(79, 16, 79, 'Normalista'),
(80, 16, 80, 'Media'),
(81, 17, 81, 'Primaria'),
(82, 17, 82, 'Básica Secundaria'),
(83, 17, 83, 'Técnico'),
(84, 17, 84, 'Normalista'),
(85, 17, 85, 'Media'),
(86, 18, 86, 'Primaria'),
(87, 18, 87, 'Básica Secundaria'),
(88, 18, 88, 'Técnico'),
(89, 18, 89, 'Normalista'),
(90, 18, 90, 'Media'),
(91, 19, 91, 'Primaria'),
(92, 19, 92, 'Básica Secundaria'),
(93, 19, 93, 'Técnico'),
(94, 19, 94, 'Normalista'),
(95, 19, 95, 'Media'),
(96, 20, 96, 'Primaria'),
(97, 20, 97, 'Básica Secundaria'),
(98, 20, 98, 'Técnico'),
(99, 20, 99, 'Normalista'),
(100, 20, 100, 'Media'),
(101, 21, 101, 'Primaria'),
(102, 21, 102, 'Básica Secundaria'),
(103, 21, 103, 'Técnico'),
(104, 21, 104, 'Normalista'),
(105, 21, 105, 'Media'),
(106, 22, 106, 'Primaria'),
(107, 22, 107, 'Básica Secundaria'),
(108, 22, 108, 'Técnico'),
(109, 22, 109, 'Normalista'),
(110, 22, 110, 'Media'),
(111, 23, 111, 'Primaria'),
(112, 23, 112, 'Básica Secundaria'),
(113, 23, 113, 'Técnico'),
(114, 23, 114, 'Normalista'),
(115, 23, 115, 'Media'),
(116, 24, 116, 'Primaria'),
(117, 24, 117, 'Básica Secundaria'),
(118, 24, 118, 'Técnico'),
(119, 24, 119, 'Normalista'),
(120, 24, 120, 'Media'),
(121, 25, 121, 'Primaria'),
(122, 25, 122, 'Básica Secundaria'),
(123, 25, 123, 'Técnico'),
(124, 25, 124, 'Normalista'),
(125, 25, 125, 'Media'),
(126, 26, 126, 'Primaria'),
(127, 26, 127, 'Básica Secundaria'),
(128, 26, 128, 'Técnico'),
(129, 26, 129, 'Normalista'),
(130, 26, 130, 'Media'),
(131, 27, 131, 'Primaria'),
(132, 27, 132, 'Básica Secundaria'),
(133, 27, 133, 'Técnico'),
(134, 27, 134, 'Normalista'),
(135, 27, 135, 'Media'),
(136, 28, 136, 'Primaria'),
(137, 28, 137, 'Básica Secundaria'),
(138, 28, 138, 'Técnico'),
(139, 28, 139, 'Normalista'),
(140, 28, 140, 'Media'),
(141, 29, 141, 'Primaria'),
(142, 29, 142, 'Básica Secundaria'),
(143, 29, 143, 'Técnico'),
(144, 29, 144, 'Normalista'),
(145, 29, 145, 'Media'),
(146, 30, 146, 'Primaria'),
(147, 30, 147, 'Básica Secundaria'),
(148, 30, 148, 'Técnico'),
(149, 30, 149, 'Normalista'),
(150, 30, 150, 'Media'),
(151, 31, 151, 'Primaria'),
(152, 31, 152, 'Básica Secundaria'),
(153, 31, 153, 'Técnico'),
(154, 31, 154, 'Normalista'),
(155, 31, 155, 'Media'),
(156, 32, 156, 'Primaria'),
(157, 32, 157, 'Básica Secundaria'),
(158, 32, 158, 'Técnico'),
(159, 32, 159, 'Normalista'),
(160, 32, 160, 'Media'),
(161, 33, 161, 'Primaria'),
(162, 33, 162, 'Básica Secundaria'),
(163, 33, 163, 'Técnico'),
(164, 33, 164, 'Normalista'),
(165, 33, 165, 'Media');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_digitales`
--

CREATE TABLE `programas_digitales` (
  `id_programa` int(11) NOT NULL,
  `nombre_programa` varchar(100) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `objetivo` varchar(255) DEFAULT NULL,
  `presupuesto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programas_digitales`
--

INSERT INTO `programas_digitales` (`id_programa`, `nombre_programa`, `fecha_inicio`, `fecha_fin`, `objetivo`, `presupuesto`) VALUES
(1, 'FormacionCiudadanosTIC', '2024-11-15', '2025-05-15', 'Formar ciudadanos en competencias y habilidades digitales', 500000),
(2, 'GobiernoDigital', '2024-12-01', '2025-06-30', 'Implementación de plataformas y portales de atención al ciudadano, trámites y servicios en línea.', 1200000),
(3, 'ConectividadFijaTIC', '2025-01-10', '2025-07-10', 'Despliegue de redes de última milla para proveer conectividad y servicio de Internet fijo.', 900000),
(4, 'InclusionDigital', '2025-02-01', '2025-08-01', 'Carpeta ciudadana digital - Procesos de Registro Notarial digital e inclusión digital financiera', 700000),
(5, 'ESaludDepartamental', '2025-03-20', '2025-09-20', 'Fortalecimiento de procesos de salud en línea (citas, teleconsulta, prevención, orden de medicamentos).', 850000),
(6, 'CapacitacionDiferencial', '2025-04-15', '2025-10-15', 'Capacitación en competencias y apropiación de TIC dirigida a grupos específicos (por género, etnias, víctimas del conflicto, reincorporados)', 650000),
(7, 'ConectividadEscolar', '2025-05-01', '2025-11-01', 'Provisión de conectividad y terminales de computo en sedes educativas (cobertura más amplia y de mejor calidad)', 750000),
(8, 'SIGIntegrales', '2025-06-15', '2025-12-15', 'Desarrollo de aplicaciones de Geomática - SIG integrales para soporte de los Planes de Ordenamiento Territorial (POT/EOT) y Catastros municipales.', 820000),
(9, 'TransformacionDigitalEmpresarial', '2025-07-01', '2026-01-01', 'Mipymes Digital. Desarrollos de TI para la gestión y comercialización de productos y servicios de sector manufactura, comercio e industria; mediante procesos de transformación digital empresarial con aplicación de nuevas tecnologías TIC y soluciones de co', 950000),
(10, 'CiudadesInteligentes', '2025-08-15', '2026-02-15', 'Estrategias para el impulso y desarrollo de territorios y ciudades inteligentes', 780000),
(11, 'InnovacionEmprendimiento', '2025-09-01', '2026-03-01', 'Desarrollo de soluciones digitales pertinentes para el territorio a través de la Innovación y el Emprendimiento Social.', 910000),
(12, 'ModernizacionInstitucional', '2025-10-15', '2026-04-15', 'Modernización para la \"Transformación Digital Institucional\".', 870000),
(13, 'CapacitacionAgro', '2025-11-01', '2026-05-01', 'Capacitación en competencias y apropiación de TIC dirigida a productores agropecuarios.', 650000),
(14, 'ComercioDigital', '2025-12-15', '2026-06-15', 'Implementación/fortalecimiento de plataformas digitales de comercialización, para el fortalecer los canales de distribución de insumos, productos y servicios y propiciar la asociatividad de productores y prestadores de servicios agropecuarios, artesanales', 920000),
(15, 'ContenidosDigitales', '2024-11-20', '2025-05-20', 'Desarrollo de aplicaciones y utilización de contenidos educativos digitales; promoción  y uso del archivo documental digital y analogo que disponen el MEN,  RTVC-Sistema de Medios públicos y los canales regionales de TV', 920000),
(16, 'ExpedienteDigital', '2025-01-15', '2025-07-15', 'Procesos en línea. Digitalización y gestión documental en el sector judicial', 880000),
(17, 'ParticipacionCiudadanaDigital', '2025-02-10', '2025-08-10', 'Plataformas o aplicaciones para conexión de los ciudadanos como medio de participación y mecanismo de información', 670000),
(18, 'TransformacionDigitalAgro', '2025-03-01', '2025-09-01', 'Digitalización, tecnificación procesos de cadena alimentaria y comercialización de productos y servicios del sector agropecuario, piscícola y acuícola; mediante procesos de transformación digital empresarial (énfasis mipymes campesinas y de artesanos); pl', 980000),
(19, 'DesarrolloIndustriaTIC', '2025-04-15', '2025-10-15', 'Desarrollo de la industria TIC: aplicaciones, software, plataformas tecnológicas, data centers, BP&O, etc', 950000),
(20, 'GestionintegralRiesgosDesastresGIRD', '2025-06-20', '2025-12-20', 'Investigación e innovación en Gestión Integral de Riesgo de Desastres(GIRD)', 890000),
(21, 'TeleEducacion', '2025-07-15', '2026-01-15', 'Implementación de procesos de educación a distancia soportados en las TIC', 700000),
(22, 'ServiciosCiudadanosDigitales', '2025-08-01', '2026-02-01', 'Desarrollo de aplicaciones y servicios TIC con enfoque en el ciudadano para reducción de trámites presenciales (\"Carpeta Ciudadana\", \"Registro digital ciudadano en el Sistema Notarial \", entre otros)', 940000),
(23, 'BiblioRed', '2025-09-10', '2026-03-10', 'Fortalecimiento de la conectividad de la red departamental de bibliotecas.', 970000),
(24, 'ZonasDigitales', '2025-10-25', '2026-04-25', 'Ampliar cobertura de zonas digitales urbanas y rurales (nuevas zonas, cobertura WiFi, etc)', 860000),
(25, 'CentrosComunitariosDigitales', '2025-11-30', '2026-05-30', 'Fortalecimiento de los centros comunitarios y casas de cultura con facilidades TIC, para la formación digital, la participación ciudadana y promoción cultural', 680000),
(26, 'EconomiaNaranja', '2025-12-15', '2026-06-15', 'Promoción del desarrollo de los mercados culturales y artísticos, con base tecnológica.', 930000),
(27, 'FormacionEducacionTIC', '2026-01-10', '2026-07-10', 'Incorporar las TIC en la práctica pedagógica con enfoque en la educación básica', 950000),
(28, 'ConectividadSectores', '2026-02-15', '2026-08-15', 'Brindar conectividad a Internet en sectores o municipios específicos del departamento', 875000),
(29, 'FormacionTICEmpresas', '2026-03-20', '2026-09-20', 'Capacitación en competencias  y apropiación TIC dirigida a empresarios con énfasis en transformación digital', 720000),
(30, 'ConectividadAltaVelocidad', '2026-04-25', '2026-10-25', 'Consolidar la infraestructura de redes de telecomunicaciones, centros comunitarios digitales y conectividad de instituciones públicas, como fue concebido en el Proyecto Nacional de Conectividad de Alta Velocidad del MinTIC.', 940000),
(31, 'ConectividadE1y2', '2026-05-30', '2026-11-30', 'Proporcionar conectividad a Internet en hogares de estratos 1 y 2', 910000),
(32, 'FormacionDocentesTIC', '2026-07-05', '2027-01-05', 'Capacitación en habilidades digitales dirigida a docentes y formadores comunitarios, así como formación en el uso pedagócico de las TIC.', 865000),
(33, 'DotacionEquipos', '2026-08-15', '2027-02-15', 'Entrega de equipos terminales de acceso a Internet y otros equipos para el aprovechamiento de contenidos digitales en instituciones educativas', 7000000),
(34, 'CentrosAprendizaje', '2026-09-25', '2027-03-25', 'Implementación de centros (sitios) de aprendizaje y experiencia digital', 950000),
(35, 'ZonaGobiernoDigital', '2026-11-05', '2027-05-05', 'Implementación de zona de autoservicio en sedes de entidades públicas para el aprovechamiento de los trámites y servicios digitales del Estado.', 965000),
(36, 'MejorarInfraestuctura', '2027-01-10', '2027-07-10', 'Diseñar, instalar, mejorar infraestructura TI y de telecomunicaciones en municipios del Departamento', 880000),
(37, 'DesarrolloRural', '2027-02-20', '2027-08-20', 'Fortalecer a la población rural en temas de apropiación de TIC e innovación para mejorar la eficiencia de sus entornos productivos, sociales, económicos y educativos', 715000),
(38, 'AyudasDiscapacidad', '2027-03-30', '2027-09-30', 'Suministrar ayudas técnicas y TIC a personas con discapacidad.', 925000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_eventos`
--

CREATE TABLE `registro_eventos` (
  `id_evento` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_programa` int(11) NOT NULL,
  `nombre_evento` varchar(200) DEFAULT NULL,
  `fecha_hora_evento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprovechamiento`
--
ALTER TABLE `aprovechamiento`
  ADD PRIMARY KEY (`id_aprovechamiento`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_programa` (`id_programa`);

--
-- Indices de la tabla `brecha_digital`
--
ALTER TABLE `brecha_digital`
  ADD PRIMARY KEY (`id_brecha`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `infraestructura_digital`
--
ALTER TABLE `infraestructura_digital`
  ADD PRIMARY KEY (`id_infraestructura`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `instituciones_educativas`
--
ALTER TABLE `instituciones_educativas`
  ADD PRIMARY KEY (`id_institucion`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id_material`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_programa` (`id_programa`);

--
-- Indices de la tabla `motivacion`
--
ALTER TABLE `motivacion`
  ADD PRIMARY KEY (`id_motivacion`),
  ADD UNIQUE KEY `id_motivacion` (`id_motivacion`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_programa` (`id_programa`);

--
-- Indices de la tabla `nivel_formacion`
--
ALTER TABLE `nivel_formacion`
  ADD PRIMARY KEY (`id_nivel_formacion`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_institucion` (`id_institucion`);

--
-- Indices de la tabla `programas_digitales`
--
ALTER TABLE `programas_digitales`
  ADD PRIMARY KEY (`id_programa`);

--
-- Indices de la tabla `registro_eventos`
--
ALTER TABLE `registro_eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_programa` (`id_programa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `registro_eventos`
--
ALTER TABLE `registro_eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprovechamiento`
--
ALTER TABLE `aprovechamiento`
  ADD CONSTRAINT `aprovechamiento_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `aprovechamiento_ibfk_2` FOREIGN KEY (`id_programa`) REFERENCES `programas_digitales` (`id_programa`);

--
-- Filtros para la tabla `brecha_digital`
--
ALTER TABLE `brecha_digital`
  ADD CONSTRAINT `brecha_digital_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`);

--
-- Filtros para la tabla `infraestructura_digital`
--
ALTER TABLE `infraestructura_digital`
  ADD CONSTRAINT `infraestructura_digital_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`);

--
-- Filtros para la tabla `instituciones_educativas`
--
ALTER TABLE `instituciones_educativas`
  ADD CONSTRAINT `instituciones_educativas_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`);

--
-- Filtros para la tabla `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `material_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `material_ibfk_2` FOREIGN KEY (`id_programa`) REFERENCES `programas_digitales` (`id_programa`);

--
-- Filtros para la tabla `motivacion`
--
ALTER TABLE `motivacion`
  ADD CONSTRAINT `motivacion_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `motivacion_ibfk_2` FOREIGN KEY (`id_programa`) REFERENCES `programas_digitales` (`id_programa`);

--
-- Filtros para la tabla `nivel_formacion`
--
ALTER TABLE `nivel_formacion`
  ADD CONSTRAINT `nivel_formacion_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `nivel_formacion_ibfk_2` FOREIGN KEY (`id_institucion`) REFERENCES `instituciones_educativas` (`id_institucion`);

--
-- Filtros para la tabla `registro_eventos`
--
ALTER TABLE `registro_eventos`
  ADD CONSTRAINT `registro_eventos_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `registro_eventos_ibfk_2` FOREIGN KEY (`id_programa`) REFERENCES `programas_digitales` (`id_programa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
