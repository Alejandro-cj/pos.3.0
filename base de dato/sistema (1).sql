-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2024 a las 20:52:22
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
-- Base de datos: `sistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `id` int(11) NOT NULL,
  `abono` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_credito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL,
  `evento` varchar(30) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `detalle` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`id`, `evento`, `ip`, `detalle`, `fecha`) VALUES
(1, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-09 16:02:51'),
(2, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-09 16:23:51'),
(3, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-09 16:26:20'),
(4, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-09 16:29:12'),
(5, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-09 16:38:33'),
(6, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-09 16:50:01'),
(7, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-09 20:57:49'),
(8, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-09 21:20:00'),
(9, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-10 00:28:42'),
(10, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-10 00:28:58'),
(11, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-10 00:29:35'),
(12, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-10 01:04:46'),
(13, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-10 15:23:31'),
(14, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-10 15:45:49'),
(15, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-11 01:09:47'),
(16, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-11 01:26:20'),
(17, 'Inicio de Sesión', '192.168.238.232', 'Mozilla/5.0 (Linux; Android 12; V2035) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-11 01:46:45'),
(18, 'Cierre de Sesión', '192.168.238.232', 'Mozilla/5.0 (Linux; Android 12; V2035) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-11 01:50:53'),
(19, 'Inicio de Sesión', '192.168.238.170', 'Mozilla/5.0 (Linux; Android 11; moto e20) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-11 02:12:29'),
(20, 'Inicio de Sesión', '192.168.238.37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-11 02:13:09'),
(21, 'Cierre de Sesión', '192.168.238.37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-11 02:14:09'),
(22, 'Cierre de Sesión', '192.168.238.170', 'Mozilla/5.0 (Linux; Android 11; moto e20) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-11 02:14:17'),
(23, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-12 02:26:52'),
(24, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-12 02:28:03'),
(25, 'Inicio de Sesión', '192.168.1.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-12 23:56:46'),
(26, 'Inicio de Sesión', '192.168.1.37', 'Mozilla/5.0 (Linux; Android 12; V2035) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-13 00:05:57'),
(27, 'Cierre de Sesión', '192.168.1.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-13 00:31:56'),
(28, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-13 23:29:20'),
(29, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:35:26'),
(30, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:11'),
(31, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:17'),
(32, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:24'),
(33, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:24'),
(34, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:25'),
(35, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:25'),
(36, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:51'),
(37, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:52'),
(38, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:52'),
(39, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:36:52'),
(40, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:37:11'),
(41, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:37:14'),
(42, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:37:17'),
(43, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:37:17'),
(44, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:40:19'),
(45, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:40:43'),
(46, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:42:02'),
(47, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:42:04'),
(48, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:42:04'),
(49, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:42:04'),
(50, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:42:04'),
(51, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:42:05'),
(52, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:42:26'),
(53, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-14 00:50:31'),
(54, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0', '2024-04-28 19:56:55'),
(55, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0', '2024-04-28 20:23:07'),
(56, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0', '2024-05-06 20:37:41'),
(57, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0', '2024-05-06 21:19:37'),
(58, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0', '2024-05-07 00:13:34'),
(59, 'Cierre de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0', '2024-05-07 01:49:54'),
(60, 'Inicio de Sesión', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0', '2024-05-07 18:47:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartados`
--

CREATE TABLE `apartados` (
  `id` int(11) NOT NULL,
  `productos` longtext NOT NULL,
  `fecha_create` date DEFAULT NULL,
  `fecha_apartado` datetime NOT NULL,
  `fecha_retiro` datetime NOT NULL,
  `abono` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `color` varchar(15) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` int(11) NOT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `fecha_apertura` date NOT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `monto_final` decimal(10,2) DEFAULT NULL,
  `total_ventas` int(11) DEFAULT NULL,
  `egresos` decimal(10,2) DEFAULT NULL,
  `gastos` decimal(10,2) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `monto_inicial`, `fecha_apertura`, `fecha_cierre`, `monto_final`, `total_ventas`, `egresos`, `gastos`, `estado`, `id_usuario`) VALUES
(1, 3000.00, '2023-01-09', '2023-01-09', 300.00, 2, 500.00, 0.00, 0, 1),
(2, 5000.00, '2023-01-09', '2023-01-10', 1200.00, 1, 3250.00, 0.00, 0, 1),
(3, 50000.00, '2024-05-07', '2024-05-07', 1750.00, 1, 2110.00, 2110.00, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`, `estado`) VALUES
(1, 'tecnologia', '2023-01-09 16:40:17', 1),
(2, 'ANIMAL', '2023-01-10 00:43:17', 1),
(3, 'Smartphones', '2024-05-06 21:06:04', 1),
(4, 'Computadoras', '2024-05-06 21:06:04', 1),
(5, 'Tabletas', '2024-05-06 21:06:04', 1),
(6, 'Laptops', '2024-05-06 21:06:04', 1),
(7, 'Periféricos de Computadora', '2024-05-06 21:06:04', 1),
(8, 'Accesorios para Teléfonos', '2024-05-06 21:06:04', 1),
(9, 'Dispositivos de Almacenamiento', '2024-05-06 21:06:04', 1),
(10, 'Audio y Sonido', '2024-05-06 21:06:04', 1),
(11, 'Cámaras y Fotografía', '2024-05-06 21:06:04', 1),
(12, 'Software y Aplicaciones', '2024-05-06 21:06:04', 1),
(13, 'Electrónica de Consumo', '2024-05-06 21:06:04', 1),
(14, 'Accesorios de Electrónica', '2024-05-06 21:06:04', 1),
(15, 'Wearables', '2024-05-06 21:06:04', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `identidad` varchar(50) NOT NULL,
  `num_identidad` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `identidad`, `num_identidad`, `nombre`, `telefono`, `correo`, `direccion`, `fecha`, `estado`) VALUES
(1, 'CC', '123456789', 'primer cliente', '345345643', 'primercliente@gmail.com', '<p>pozoncity</p>', '2023-01-09 16:28:23', 1),
(2, 'RUC', '0101010101001', 'Empresa XYZ S.A.', '555123456', 'info@empresaxyz.com', '<p>Av. Principal #123, Ciudad ABC</p>', '2024-05-06 20:42:33', 1),
(3, 'CC', '0102030405', 'Juan Pérez', '555789012', 'juan.perez@example.com', '<p>Calle Flores #456, Ciudad XYZ</p>', '2024-05-06 20:43:37', 1),
(4, 'RUC', '0202020202002', 'Distribuidora ABC S.A.', '555456789', 'ventas@distribuidoraabc.com', '<p>Av. Libertad #789, Ciudad PQR</p>', '2024-05-06 20:44:44', 1),
(5, 'CC', '0304050607', 'María Rodríguez', '555987654', 'maria.rodriguez@example.com', '<p>Calle Principal #789, Ciudad LMN</p>', '2024-05-06 20:45:51', 1),
(6, 'RUC', '0303030303003', 'Ferretería El Martillo S.A.', '555654321', 'contacto@ferreteriaelmartillo.com', '<p>Av. Central #321, Ciudad OPQ</p>', '2024-05-06 20:46:43', 1),
(7, 'RUC', '987654321', 'Segundo Cliente', '123456789', 'segundocliente@gmail.com', 'Dirección 2', '2024-05-06 20:58:36', 1),
(8, 'RUC', '987654322', 'Tercer Cliente', '123456780', 'tercercliente@gmail.com', 'Dirección 3', '2024-05-06 20:58:36', 1),
(9, 'CC', '987654323', 'Cuarto Cliente', '123456781', 'cuartocliente@gmail.com', 'Dirección 4', '2024-05-06 20:58:36', 1),
(10, 'CC', '987654324', 'Quinto Cliente', '123456782', 'quintocliente@gmail.com', 'Dirección 5', '2024-05-06 20:58:36', 1),
(11, 'RUC', '987654325', 'Sexto Cliente', '123456783', 'sextocliente@gmail.com', 'Dirección 6', '2024-05-06 20:58:36', 1),
(12, 'RUC', '987654326', 'Séptimo Cliente', '123456784', 'septimocliente@gmail.com', 'Dirección 7', '2024-05-06 20:58:36', 1),
(13, 'RUC', '987654327', 'Octavo Cliente', '123456785', 'octavocliente@gmail.com', 'Dirección 8', '2024-05-06 20:58:36', 1),
(14, 'RUC', '987654328', 'Noveno Cliente', '123456786', 'novenocliente@gmail.com', 'Dirección 9', '2024-05-06 20:58:36', 1),
(15, 'CC', '987654329', 'Décimo Cliente', '123456787', 'decimocliente@gmail.com', 'Dirección 10', '2024-05-06 20:58:36', 1),
(16, 'CC', '987654330', 'Onceavo Cliente', '123456788', 'onceavocliente@gmail.com', 'Dirección 11', '2024-05-06 20:58:36', 1),
(17, 'RUC', '987654331', 'Doceavo Cliente', '123456789', 'doceavocliente@gmail.com', 'Dirección 12', '2024-05-06 20:58:36', 1),
(18, 'CC', '987654332', 'Treceavo Cliente', '123456790', 'treceavocliente@gmail.com', 'Dirección 13', '2024-05-06 20:58:36', 1),
(19, 'CC', '987654333', 'Catorceavo Cliente', '123456791', 'catorceavocliente@gmail.com', 'Dirección 14', '2024-05-06 20:58:36', 1),
(20, 'CC', '987654334', 'Quinceavo Cliente', '123456792', 'quinceavocliente@gmail.com', 'Dirección 15', '2024-05-06 20:58:36', 1),
(21, 'CC', '987654335', 'Dieciséisavo Cliente', '123456793', 'dieciseisavocliente@gmail.com', 'Dirección 16', '2024-05-06 20:58:36', 1),
(22, 'CC', '987654336', 'Diecisieteavo Cliente', '123456794', 'diecisieteavocliente@gmail.com', 'Dirección 17', '2024-05-06 20:58:36', 1),
(23, 'RUC', '987654337', 'Dieciochoavo Cliente', '123456795', 'dieciochoavocliente@gmail.com', 'Dirección 18', '2024-05-06 20:58:36', 1),
(24, 'CC', '987654338', 'Diecinueveavo Cliente', '123456796', 'diecinueveavocliente@gmail.com', 'Dirección 19', '2024-05-06 20:58:36', 1),
(25, 'RUC', '987654339', 'Veinteavo Cliente', '123456797', 'veinteavocliente@gmail.com', 'Dirección 20', '2024-05-06 20:58:36', 1),
(26, 'CC', '987654340', 'Veintiúnavo Cliente', '123456798', 'veintiunavocliente@gmail.com', 'Dirección 21', '2024-05-06 20:58:36', 1),
(27, 'RUC', '987654341', 'Veintidósavo Cliente', '123456799', 'veintidosavocliente@gmail.com', 'Dirección 22', '2024-05-06 20:58:36', 1),
(28, 'CC', '987654342', 'Veintitrésavo Cliente', '123456800', 'veintitresavocliente@gmail.com', 'Dirección 23', '2024-05-06 20:58:36', 1),
(29, 'CC', '987654343', 'Veinticuatroavo Cliente', '123456801', 'veinticuatroavocliente@gmail.com', 'Dirección 24', '2024-05-06 20:58:36', 1),
(30, 'CC', '987654344', 'Veinticincoavo Cliente', '123456802', 'veinticincoavocliente@gmail.com', 'Dirección 25', '2024-05-06 20:58:36', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `productos` longtext NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `serie` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_proveedor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `productos`, `total`, `fecha`, `hora`, `serie`, `estado`, `apertura`, `id_proveedor`, `id_usuario`) VALUES
(1, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"250.00\",\"cantidad\":\"2\"}]', 500.00, '2023-01-09', '22:03:36', '00234234', 1, 0, 1, 1),
(2, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"500.00\",\"cantidad\":\"4\"}]', 2000.00, '2023-01-09', '22:18:11', '00001234', 1, 0, 1, 1),
(3, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"250.00\",\"cantidad\":\"5\"}]', 1250.00, '2023-01-10', '16:44:13', '00002312', 1, 0, 1, 1),
(4, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"250.00\",\"cantidad\":\"2\"}]', 500.00, '2024-01-09', '14:30:45', '00003456', 1, 0, 1, 1),
(5, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"500.00\",\"cantidad\":\"4\"}]', 2000.00, '2024-01-15', '16:45:30', '00004567', 1, 0, 1, 1),
(6, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"250.00\",\"cantidad\":\"5\"}]', 1250.00, '2024-02-03', '11:20:20', '00005678', 1, 0, 1, 1),
(7, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"500.00\",\"cantidad\":\"3\"}]', 1500.00, '2024-02-18', '13:35:45', '00006789', 1, 0, 1, 1),
(8, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"250.00\",\"cantidad\":\"3\"}]', 750.00, '2024-03-05', '09:45:10', '00007890', 1, 0, 1, 1),
(9, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"500.00\",\"cantidad\":\"2\"}]', 1000.00, '2024-03-20', '14:20:30', '00008901', 1, 0, 1, 1),
(10, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"250.00\",\"cantidad\":\"4\"}]', 1000.00, '2024-04-10', '10:15:25', '00009012', 1, 0, 1, 1),
(11, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"500.00\",\"cantidad\":\"1\"}]', 500.00, '2024-04-25', '12:30:50', '00010123', 1, 0, 1, 1),
(12, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"250.00\",\"cantidad\":\"5\"}]', 1250.00, '2024-05-15', '15:20:40', '00011234', 1, 0, 1, 1),
(13, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"500.00\",\"cantidad\":\"2\"}]', 1000.00, '2024-05-30', '17:45:15', '00012345', 1, 0, 1, 1),
(14, '[{\"id\":17,\"nombre\":\"Estuche de carga inalámbrica para iPhone\",\"precio\":\"30.00\",\"cantidad\":\"25\"}]', 750.00, '2024-04-01', '09:30:45', '00013456', 1, 0, 1, 1),
(15, '[{\"id\":18,\"nombre\":\"Tarjeta gráfica NVIDIA GeForce RTX 3080\",\"precio\":\"800.00\",\"cantidad\":\"6\"}]', 4800.00, '2024-02-03', '11:20:20', '00013457', 1, 0, 1, 1),
(16, '[{\"id\":19,\"nombre\":\"Disco duro externo WD My Passport 2TB\",\"precio\":\"80.00\",\"cantidad\":\"9\"}]', 720.00, '2024-02-05', '13:40:30', '00013458', 1, 0, 1, 1),
(17, '[{\"id\":20,\"nombre\":\"Silla gaming DXRacer Racing Series\",\"precio\":\"200.00\",\"cantidad\":\"4\"}]', 800.00, '2024-01-08', '15:15:25', '00013459', 1, 0, 1, 1),
(18, '[{\"id\":21,\"nombre\":\"Altavoz Bluetooth JBL Charge 5\",\"precio\":\"120.00\",\"cantidad\":\"18\"}]', 2160.00, '2024-01-10', '17:25:40', '00013460', 1, 0, 1, 1),
(19, '[{\"id\":22,\"nombre\":\"Router WiFi ASUS RT-AX88U\",\"precio\":\"250.00\",\"cantidad\":\"10\"}]', 2500.00, '2024-02-15', '09:10:55', '00013461', 1, 0, 1, 1),
(20, '[{\"id\":23,\"nombre\":\"Impresora multifunción Epson EcoTank ET-4760\",\"precio\":\"300.00\",\"cantidad\":\"7\"}]', 2100.00, '2024-03-18', '11:35:30', '00013462', 1, 0, 1, 1),
(21, '[{\"id\":24,\"nombre\":\"Teclado mecánico Corsair K95 RGB Platinum\",\"precio\":\"150.00\",\"cantidad\":\"20\"}]', 3000.00, '2024-05-20', '14:40:45', '00013463', 1, 0, 1, 1),
(22, '[{\"id\":25,\"nombre\":\"Cámara DSLR Canon EOS 90D\",\"precio\":\"1200.00\",\"cantidad\":\"3\"}]', 3600.00, '2024-05-25', '16:55:20', '00013464', 1, 0, 1, 1),
(23, '[{\"id\":26,\"nombre\":\"Monitor LG UltraWide 34\\\"\",\"precio\":\"400.00\",\"cantidad\":\"5\"}]', 2000.00, '2024-04-28', '18:30:35', '00013465', 1, 0, 1, 1),
(24, '[{\"id\":27,\"nombre\":\"Smartwatch Apple Watch Series 7\",\"precio\":\"350.00\",\"cantidad\":\"12\"}]', 4200.00, '2024-03-30', '20:15:50', '00013466', 1, 0, 1, 1),
(25, '[{\"id\":28,\"nombre\":\"Auriculares inalámbricos Sony WH-1000XM4\",\"precio\":\"250.00\",\"cantidad\":\"15\"}]', 3750.00, '2024-04-01', '10:30:40', '00013467', 1, 0, 1, 1),
(26, '[{\"id\":29,\"nombre\":\"Laptop Dell XPS 13\",\"precio\":\"1200.00\",\"cantidad\":\"6\"}]', 7200.00, '2024-02-05', '12:45:55', '00013468', 1, 0, 1, 1),
(27, '[{\"id\":30,\"nombre\":\"Tableta Apple iPad Pro\",\"precio\":\"900.00\",\"cantidad\":\"8\"}]', 7200.00, '2024-05-10', '14:20:30', '00013469', 1, 0, 1, 1),
(28, '[{\"id\":31,\"nombre\":\"Teléfono inteligente Samsung Galaxy S21\",\"precio\":\"800.00\",\"cantidad\":\"10\"}]', 8000.00, '2024-04-15', '16:10:45', '00013470', 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `mensaje` text NOT NULL,
  `impuesto` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `ruc`, `nombre`, `telefono`, `correo`, `direccion`, `mensaje`, `impuesto`) VALUES
(1, '0123456789', 'EMPRESA DE ALEJO', '3046811778', 'alejandrocj2002@gmail.com', 'CARTAGENA - COLOMBIA', '<p>TENKIUUUU&nbsp;</p>', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id` int(11) NOT NULL,
  `productos` longtext NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `metodo` varchar(20) NOT NULL,
  `validez` varchar(30) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditos`
--

CREATE TABLE `creditos` (
  `id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `creditos`
--

INSERT INTO `creditos` (`id`, `monto`, `fecha`, `hora`, `estado`, `id_venta`) VALUES
(1, -200.00, '2023-01-09', '22:05:50', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_apartado`
--

CREATE TABLE `detalle_apartado` (
  `id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_apartado` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `foto` varchar(150) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id`, `monto`, `descripcion`, `foto`, `fecha`, `apertura`, `id_usuario`) VALUES
(1, 150.00, 'Compra de suministros de oficina', NULL, '2024-05-07 01:21:49', 0, 1),
(2, 200.00, 'Pago de servicios públicos', NULL, '2024-05-07 01:21:49', 0, 1),
(3, 180.00, 'Compra de material de limpieza', NULL, '2024-05-07 01:21:49', 0, 1),
(4, 250.00, 'Gastos de transporte', NULL, '2024-05-07 01:21:49', 0, 1),
(5, 220.00, 'Pago de reparación de equipo de oficina', NULL, '2024-05-07 01:21:49', 0, 1),
(6, 300.00, 'Compra de software', NULL, '2024-05-07 01:21:49', 0, 1),
(7, 280.00, 'Pago de mantenimiento de sitio web', NULL, '2024-05-07 01:21:49', 0, 1),
(8, 150.00, 'Gastos de publicidad en redes sociales', NULL, '2024-05-07 01:21:49', 0, 1),
(9, 200.00, 'Compra de suministros de empaque', NULL, '2024-05-07 01:21:49', 0, 1),
(10, 180.00, 'Pago de membresía de software', NULL, '2024-05-07 01:21:49', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `movimiento` varchar(100) NOT NULL,
  `accion` varchar(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `movimiento`, `accion`, `cantidad`, `stock_actual`, `fecha`, `id_producto`, `id_usuario`) VALUES
(1, 'Venta N°: 1', 'salida', 1, -1, '2023-01-09 16:45:12', 1, 1),
(2, 'Compra N°: 1', 'entrada', 2, 1, '2023-01-09 21:03:36', 1, 1),
(3, 'Venta N°: 2', 'salida', 1, 0, '2023-01-09 21:05:50', 1, 1),
(4, 'Compra N°: 2', 'entrada', 4, 4, '2023-01-09 21:18:11', 2, 1),
(5, 'Compra N°: 3', 'entrada', 5, 5, '2023-01-10 15:44:13', 1, 1),
(6, 'Venta N°: 3', 'salida', 2, 2, '2023-01-10 15:44:51', 2, 1),
(8, 'Compra N°: 24', 'entrada', 25, 25, '2024-05-07 14:30:00', 20, 1),
(9, 'Compra N°: 25', 'entrada', 6, 6, '2024-05-07 15:00:00', 19, 1),
(10, 'Compra N°: 26', 'entrada', 9, 9, '2024-05-07 15:30:00', 18, 1),
(11, 'Compra N°: 27', 'entrada', 4, 4, '2024-05-07 16:00:00', 17, 1),
(12, 'Compra N°: 28', 'entrada', 18, 18, '2024-05-07 16:30:00', 16, 1),
(13, 'Compra N°: 29', 'entrada', 10, 10, '2024-05-07 17:00:00', 15, 1),
(14, 'Compra N°: 30', 'entrada', 7, 7, '2024-05-07 17:30:00', 14, 1),
(15, 'Compra N°: 31', 'entrada', 20, 20, '2024-05-07 18:00:00', 13, 1),
(16, 'Compra N°: 32', 'entrada', 3, 3, '2024-05-07 18:30:00', 12, 1),
(17, 'Compra N°: 33', 'entrada', 5, 5, '2024-05-07 19:00:00', 11, 1),
(18, 'Compra N°: 34', 'entrada', 12, 12, '2024-05-07 19:30:00', 10, 1),
(19, 'Compra N°: 35', 'entrada', 15, 15, '2024-05-07 20:00:00', 9, 1),
(20, 'Compra N°: 36', 'entrada', 6, 6, '2024-05-07 20:30:00', 8, 1),
(21, 'Compra N°: 37', 'entrada', 8, 8, '2024-05-07 21:00:00', 7, 1),
(22, 'Compra N°: 38', 'entrada', 10, 10, '2024-05-07 21:30:00', 6, 1),
(23, 'Compra N°: 39', 'entrada', 0, 0, '2024-05-07 22:00:00', 5, 1),
(24, 'Compra N°: 40', 'entrada', 0, 0, '2024-05-07 22:30:00', 4, 1),
(25, 'Compra N°: 41', 'entrada', 0, 0, '2024-05-07 23:00:00', 3, 1),
(26, 'Compra N°: 42', 'entrada', 2, 2, '2024-05-07 23:30:00', 2, 1),
(27, 'Compra N°: 43', 'entrada', 5, 5, '2024-05-08 00:00:00', 1, 1),
(28, 'Venta N°: 73', 'salida', 5, 10, '2024-05-07 01:09:46', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidas`
--

CREATE TABLE `medidas` (
  `id` int(11) NOT NULL,
  `medida` varchar(100) NOT NULL,
  `nombre_corto` varchar(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medidas`
--

INSERT INTO `medidas` (`id`, `medida`, `nombre_corto`, `fecha`, `estado`) VALUES
(1, 'primera medida xd', 'pm', '2023-01-09 16:39:53', 1),
(2, 'Centímetro', 'cm', '2024-05-06 21:01:55', 1),
(3, 'Milímetro', 'mm', '2024-05-06 21:01:55', 1),
(4, 'Metro', 'm', '2024-05-06 21:01:55', 1),
(5, 'Kilómetro', 'km', '2024-05-06 21:01:55', 1),
(6, 'Pulgada', 'in', '2024-05-06 21:01:55', 1),
(7, 'Pie', 'ft', '2024-05-06 21:01:55', 1),
(8, 'Yarda', 'yd', '2024-05-06 21:01:55', 1),
(9, 'Milla', 'mi', '2024-05-06 21:01:55', 1),
(10, 'Litro', 'L', '2024-05-06 21:01:55', 1),
(11, 'Mililitro', 'mL', '2024-05-06 21:01:55', 1),
(12, 'Metro cuadrado', 'm²', '2024-05-06 21:01:55', 1),
(13, 'Metro cúbico', 'm³', '2024-05-06 21:01:55', 1),
(14, 'Gramo', 'g', '2024-05-06 21:01:55', 1),
(15, 'Kilogramo', 'kg', '2024-05-06 21:01:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `foto` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ventas` int(11) NOT NULL DEFAULT 0,
  `id_medida` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `descripcion`, `precio_compra`, `precio_venta`, `cantidad`, `foto`, `estado`, `fecha`, `ventas`, `id_medida`, `id_categoria`) VALUES
(1, '123453', 'lapto hp', 250.00, 300.00, 5, 'assets/images/productos/hp.jfif', 1, '2024-05-07 01:31:10', 2, 1, 1),
(2, '1234', 'LAPTO LENOVO', 500.00, 600.00, 2, 'assets/images/productos/lenovo.jfif', 1, '2024-05-07 01:36:35', 2, 1, 1),
(3, '12345', 'ZORRO', 50.00, 70.00, 0, 'assets/images/productos/20230110014556.jpg', 1, '2023-01-10 00:45:56', 0, 1, 2),
(4, '12344', 'prueba de codigo', 500.00, 500.00, 0, NULL, 0, '2024-05-07 01:31:40', 0, 1, 1),
(5, '123456', 'pruba de barras xd', 1000.00, 1500.00, 0, NULL, 0, '2024-05-07 01:31:32', 0, 1, 2),
(6, '123457', 'Teléfono inteligente Samsung Galaxy S21', 800.00, 1000.00, 10, 'assets/images/productos/s21.jfif', 1, '2024-05-07 01:39:29', 0, 1, 3),
(7, '123458', 'Tableta Apple iPad Pro', 900.00, 1200.00, 8, NULL, 1, '2024-05-06 21:14:41', 0, 6, 3),
(8, '123459', 'Laptop Dell XPS 13', 1200.00, 1500.00, 6, NULL, 1, '2024-05-06 21:15:07', 0, 6, 4),
(9, '123460', 'Auriculares inalámbricos Sony WH-1000XM4', 250.00, 350.00, 10, NULL, 1, '2024-05-07 01:09:46', 5, 14, 10),
(10, '123461', 'Smartwatch Apple Watch Series 7', 350.00, 450.00, 12, NULL, 1, '2024-05-06 21:17:10', 0, 14, 14),
(11, '123462', 'Monitor LG UltraWide 34\"', 400.00, 550.00, 5, 'assets/images/productos/lg_ultrawide_monitor.jpg', 1, '2024-05-06 21:13:12', 0, 2, 1),
(12, '123463', 'Cámara DSLR Canon EOS 90D', 1200.00, 1500.00, 3, 'assets/images/productos/canon_eos90d.jpg', 1, '2024-05-06 21:13:12', 0, 1, 1),
(13, '123464', 'Teclado mecánico Corsair K95 RGB Platinum', 150.00, 200.00, 20, 'assets/images/productos/corsair_k95_rgb.jpg', 1, '2024-05-06 21:13:12', 0, 2, 1),
(14, '123465', 'Impresora multifunción Epson EcoTank ET-4760', 300.00, 400.00, 7, 'assets/images/productos/epson_et4760.jpg', 1, '2024-05-06 21:13:12', 0, 1, 1),
(15, '123466', 'Router WiFi ASUS RT-AX88U', 250.00, 350.00, 10, 'assets/images/productos/asus_rt_ax88u.jpg', 1, '2024-05-06 21:13:12', 0, 2, 1),
(16, '123467', 'Altavoz Bluetooth JBL Charge 5', 120.00, 150.00, 18, 'assets/images/productos/jbl_charge5.jpg', 1, '2024-05-06 21:13:12', 0, 4, 1),
(17, '123468', 'Silla gaming DXRacer Racing Series', 200.00, 300.00, 4, 'assets/images/productos/dxracer_gaming_chair.jpg', 1, '2024-05-06 21:13:12', 0, 2, 1),
(18, '123469', 'Disco duro externo WD My Passport 2TB', 80.00, 120.00, 9, 'assets/images/productos/wd_my_passport.jpg', 1, '2024-05-06 21:13:12', 0, 10, 1),
(19, '123470', 'Tarjeta gráfica NVIDIA GeForce RTX 3080', 800.00, 1000.00, 6, 'assets/images/productos/nvidia_rtx3080.jpg', 1, '2024-05-06 21:13:12', 0, 11, 1),
(20, '123471', 'Estuche de carga inalámbrica para iPhone', 30.00, 50.00, 25, 'assets/images/productos/wireless_charging_case.jpg', 1, '2024-05-06 21:13:12', 0, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `ruc`, `nombre`, `telefono`, `correo`, `direccion`, `fecha`, `estado`) VALUES
(1, '1234123', 'jose junior', '234234234', 'jose@gmail.com', '<p><strong>medellin</strong></p>', '2023-01-09 16:46:56', 1),
(2, '234234234', 'ANGELICA JIMENES', '1342123123', 'angelica@gmail.com', '<p><strong>BICENTENARIO</strong></p>', '2023-01-09 21:08:57', 1),
(3, '345345345', 'Proveedor Tech S.A.', '123456789', 'proveedortech@example.com', 'Calle Tech #123', '2024-05-07 00:25:04', 1),
(4, '456456456', 'Distribuidora Electrónica XYZ', '987654321', 'distribuidoraxyz@example.com', 'Avenida Electrónica #456', '2024-05-07 00:25:04', 1),
(5, '567567567', 'Suministros Informáticos Torres', '567890123', 'torressuministros@example.com', 'Carrera Informática #789', '2024-05-07 00:25:04', 1),
(6, '678678678', 'Componentes Innovadores S.A.C.', '456789012', 'componentesinnovadores@example.com', 'Plaza de Innovación #101', '2024-05-07 00:25:04', 1),
(7, '789789789', 'Electrónica Avanzada Ltda.', '345678901', 'electronicavanzada@example.com', 'Calle Avanzada #202', '2024-05-07 00:25:04', 1),
(8, '890890890', 'Proveedor de Tecnología Total', '234567890', 'tecnologiatotal@example.com', 'Avenida Total #303', '2024-05-07 00:25:04', 1),
(9, '901901901', 'Accesorios y Gadgets SRL', '123456780', 'accesoriosygadgets@example.com', 'Calle Gadgets #404', '2024-05-07 00:25:04', 1),
(10, '012012012', 'Suministros Electrónicos Gómez', '901234567', 'gomezsuministros@example.com', 'Carrera Electrónica #505', '2024-05-07 00:25:04', 1),
(11, '123123123', 'Tecnología Integral E.I.R.L.', '789012345', 'tecnologiaintegral@example.com', 'Plaza Integral #606', '2024-05-07 00:25:04', 1),
(12, '234234234', 'Soluciones Informáticas Torres', '678901234', 'solucionesinformaticas@example.com', 'Avenida Soluciones #707', '2024-05-07 00:25:04', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `clave` varchar(200) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `perfil`, `clave`, `token`, `fecha`, `estado`, `rol`) VALUES
(1, 'ALEJANDRO', 'COGOLLO', 'alejandrocj2002@gmail.com', '3046811778', 'CARTAGENA COLOMBIA', NULL, '$2y$10$PBVfztrP.ynI6stFCV3vtOtF9asUF4yIfUjTQ5aXhE1xZEzb0DH3a', '65265522b58828fdaaecb4b07fe9bb0c', '2023-01-13 00:52:38', 1, 1),
(2, 'SEGUNDO', 'USUARIO', 'segundousers@gmail.com', '23984283', 'CARTAGENA COLOMBIA', NULL, '$2y$10$iEqpvM8zHShRgJPKwgkIeeO1MqG6b6Ka2Y7vhJtOXe4KShEv3pN8i', NULL, '2023-01-14 00:35:21', 0, 2),
(3, 'LEIDY DANIELA', 'DE LA PUENTE', 'leididanielapg2004@gmail.com', '3218381415', 'CARTAGENA - BOLIVAR', 'assets/images/perfil/20230113010743leididanielapg2004@gmail.com.jpg', '$2y$10$W9oMsj3u/csLBdcY2oDzjOlBM5ZW75QQhWHzKqM8Vbwwpoig6ATSS', NULL, '2023-01-13 00:07:43', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `productos` longtext NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `metodo` varchar(15) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `serie` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `apertura` int(11) NOT NULL DEFAULT 1,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `productos`, `total`, `fecha`, `hora`, `metodo`, `descuento`, `serie`, `estado`, `apertura`, `id_cliente`, `id_usuario`) VALUES
(1, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-01-09', '17:45:12', 'CONTADO', 0.00, '00000001', 1, 0, 1, 1),
(2, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-01-09', '22:05:50', 'CREDITO', 500.00, '00000002', 1, 0, 1, 1),
(3, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-01-10', '16:44:51', 'CONTADO', 0.00, '00000003', 1, 0, 1, 1),
(4, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-01-09', '17:45:12', 'CONTADO', 0.00, '00000001', 1, 0, 1, 1),
(5, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-01-09', '22:05:50', 'CREDITO', 500.00, '00000002', 1, 0, 1, 1),
(6, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-01-10', '16:44:51', 'CONTADO', 0.00, '00000003', 1, 0, 1, 1),
(7, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-02-05', '10:30:20', 'CONTADO', 0.00, '00000004', 1, 0, 1, 1),
(8, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-02-12', '14:20:35', 'CREDITO', 0.00, '00000005', 1, 0, 1, 1),
(9, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-03-18', '11:15:45', 'CONTADO', 0.00, '00000006', 1, 0, 1, 1),
(10, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-03-25', '15:40:55', 'CREDITO', 0.00, '00000007', 1, 0, 1, 1),
(11, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-04-08', '09:50:10', 'CONTADO', 0.00, '00000008', 1, 0, 1, 1),
(12, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-04-15', '13:25:30', 'CREDITO', 0.00, '00000009', 1, 0, 1, 1),
(13, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-05-03', '16:10:20', 'CONTADO', 0.00, '00000010', 1, 0, 1, 1),
(14, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-05-20', '18:45:55', 'CREDITO', 0.00, '00000011', 1, 0, 1, 1),
(15, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-01-09', '17:45:12', 'CONTADO', 0.00, '00000001', 1, 0, 1, 1),
(16, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-01-09', '22:05:50', 'CREDITO', 500.00, '00000002', 1, 0, 1, 1),
(17, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-01-10', '16:44:51', 'CONTADO', 0.00, '00000003', 1, 0, 1, 1),
(18, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-02-05', '10:30:20', 'CONTADO', 0.00, '00000004', 1, 0, 1, 1),
(19, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-02-12', '14:20:35', 'CREDITO', 0.00, '00000005', 1, 0, 1, 1),
(20, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-03-18', '11:15:45', 'CONTADO', 0.00, '00000006', 1, 0, 1, 1),
(21, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-03-25', '15:40:55', 'CREDITO', 0.00, '00000007', 1, 0, 1, 1),
(22, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-04-08', '09:50:10', 'CONTADO', 0.00, '00000008', 1, 0, 1, 1),
(23, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-04-15', '13:25:30', 'CREDITO', 0.00, '00000009', 1, 0, 1, 1),
(24, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2023-05-03', '16:10:20', 'CONTADO', 0.00, '00000010', 1, 0, 1, 1),
(25, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-05-20', '18:45:55', 'CREDITO', 0.00, '00000011', 1, 0, 1, 1),
(26, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-05-22', '14:30:40', 'CREDITO', 0.00, '00000012', 1, 0, 1, 1),
(27, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-05-28', '09:15:10', 'CONTADO', 0.00, '00000013', 1, 0, 1, 1),
(28, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2023-05-31', '11:20:25', 'CONTADO', 0.00, '00000014', 1, 0, 1, 1),
(29, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-01-09', '17:45:12', 'CONTADO', 0.00, '00000001', 1, 0, 1, 1),
(30, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-01-09', '22:05:50', 'CREDITO', 500.00, '00000002', 1, 0, 1, 1),
(31, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2024-01-10', '16:44:51', 'CONTADO', 0.00, '00000003', 1, 0, 1, 1),
(32, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-02-05', '10:30:20', 'CONTADO', 0.00, '00000004', 1, 0, 1, 1),
(33, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2024-02-12', '14:20:35', 'CREDITO', 0.00, '00000005', 1, 0, 1, 1),
(34, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2024-03-18', '11:15:45', 'CONTADO', 0.00, '00000006', 1, 0, 1, 1),
(35, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-03-25', '15:40:55', 'CREDITO', 0.00, '00000007', 1, 0, 1, 1),
(36, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-04-08', '09:50:10', 'CONTADO', 0.00, '00000008', 1, 0, 1, 1),
(37, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2024-04-15', '13:25:30', 'CREDITO', 0.00, '00000009', 1, 0, 1, 1),
(38, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2024-05-03', '16:10:20', 'CONTADO', 0.00, '00000010', 1, 0, 1, 1),
(39, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-05-20', '18:45:55', 'CREDITO', 0.00, '00000011', 1, 0, 1, 1),
(40, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-05-22', '14:30:40', 'CREDITO', 0.00, '00000012', 1, 0, 1, 1),
(41, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-05-28', '09:15:10', 'CONTADO', 0.00, '00000013', 1, 0, 1, 1),
(42, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-05-31', '11:20:25', 'CONTADO', 0.00, '00000014', 1, 0, 1, 1),
(43, '[{\"id\":1,\"nombre\":\"LAPTO HP\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-01-20', '09:30:45', 'CONTADO', 0.00, '00000025', 1, 0, 1, 1),
(44, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":2}]', 1200.00, '2024-01-25', '14:15:30', 'CREDITO', 0.00, '00000026', 1, 0, 1, 1),
(45, '[{\"id\":1,\"nombre\":\"LAPTO HP\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-02-12', '10:20:20', 'CONTADO', 0.00, '00000027', 1, 0, 1, 1),
(46, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":2}]', 1200.00, '2024-02-18', '13:45:35', 'CREDITO', 0.00, '00000028', 1, 0, 1, 1),
(47, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":2}]', 1200.00, '2024-03-08', '11:30:45', 'CONTADO', 0.00, '00000029', 1, 0, 1, 1),
(48, '[{\"id\":1,\"nombre\":\"LAPTO HP\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-03-15', '15:20:55', 'CREDITO', 0.00, '00000030', 1, 0, 1, 1),
(49, '[{\"id\":1,\"nombre\":\"LAPTO HP\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-04-05', '09:10:20', 'CONTADO', 0.00, '00000031', 1, 0, 1, 1),
(50, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":2}]', 1200.00, '2024-04-18', '12:30:30', 'CREDITO', 0.00, '00000032', 1, 0, 1, 1),
(51, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":2}]', 1200.00, '2024-05-10', '16:30:20', 'CONTADO', 0.00, '00000033', 1, 0, 1, 1),
(52, '[{\"id\":1,\"nombre\":\"LAPTO HP\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-05-22', '18:15:55', 'CREDITO', 0.00, '00000034', 1, 0, 1, 1),
(53, '[{\"id\":1,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-01-05', '09:30:00', 'CONTADO', 0.00, '000001', 1, 0, 1, 1),
(54, '[{\"id\":2,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2024-01-15', '11:45:00', 'CREDITO', 0.00, '000002', 1, 0, 1, 1),
(55, '[{\"id\":3,\"nombre\":\"ZORRO\",\"precio\":\"70.00\",\"cantidad\":\"2\"}]', 140.00, '2024-02-08', '13:15:00', 'CONTADO', 0.00, '000003', 1, 0, 1, 1),
(56, '[{\"id\":4,\"nombre\":\"prueba de codigo\",\"precio\":\"500.00\",\"cantidad\":\"1\"}]', 500.00, '2024-02-20', '15:30:00', 'CREDITO', 0.00, '000004', 1, 0, 1, 1),
(57, '[{\"id\":5,\"nombre\":\"pruba de barras xd\",\"precio\":\"1500.00\",\"cantidad\":\"1\"}]', 1500.00, '2024-03-05', '10:00:00', 'CONTADO', 0.00, '000005', 1, 0, 1, 1),
(58, '[{\"id\":6,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"1\"}]', 600.00, '2024-03-18', '12:15:00', 'CREDITO', 0.00, '000006', 1, 0, 1, 1),
(59, '[{\"id\":7,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":\"2\"}]', 600.00, '2024-04-10', '14:30:00', 'CONTADO', 0.00, '000007', 1, 0, 1, 1),
(60, '[{\"id\":8,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"1\"}]', 600.00, '2024-04-22', '16:45:00', 'CREDITO', 0.00, '000008', 1, 0, 1, 1),
(61, '[{\"id\":9,\"nombre\":\"ZORRO\",\"precio\":\"70.00\",\"cantidad\":\"3\"}]', 210.00, '2024-05-05', '09:00:00', 'CONTADO', 0.00, '000009', 1, 0, 1, 1),
(62, '[{\"id\":10,\"nombre\":\"prueba de barras xd\",\"precio\":\"1500.00\",\"cantidad\":\"2\"}]', 3000.00, '2024-05-18', '11:15:00', 'CREDITO', 0.00, '000010', 1, 0, 1, 1),
(63, '[{\"id\":11,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":1}]', 300.00, '2024-01-05', '10:00:00', 'CONTADO', 0.00, '000012', 1, 0, 1, 1),
(64, '[{\"id\":12,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"2\"}]', 1200.00, '2024-01-15', '12:00:00', 'CREDITO', 0.00, '000013', 1, 0, 1, 1),
(65, '[{\"id\":13,\"nombre\":\"ZORRO\",\"precio\":\"70.00\",\"cantidad\":\"2\"}]', 140.00, '2024-02-08', '14:00:00', 'CONTADO', 0.00, '000014', 1, 0, 1, 1),
(66, '[{\"id\":14,\"nombre\":\"prueba de codigo\",\"precio\":\"500.00\",\"cantidad\":\"1\"}]', 500.00, '2024-02-20', '16:00:00', 'CREDITO', 0.00, '000015', 1, 0, 1, 1),
(67, '[{\"id\":15,\"nombre\":\"pruba de barras xd\",\"precio\":\"1500.00\",\"cantidad\":\"1\"}]', 1500.00, '2024-03-05', '11:00:00', 'CONTADO', 0.00, '000016', 1, 0, 1, 1),
(68, '[{\"id\":16,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"1\"}]', 600.00, '2024-03-18', '13:00:00', 'CREDITO', 0.00, '000017', 1, 0, 1, 1),
(69, '[{\"id\":17,\"nombre\":\"lapto hp\",\"precio\":\"300.00\",\"cantidad\":\"2\"}]', 600.00, '2024-04-10', '15:00:00', 'CONTADO', 0.00, '000018', 1, 0, 1, 1),
(70, '[{\"id\":18,\"nombre\":\"LAPTO LENOVO\",\"precio\":\"600.00\",\"cantidad\":\"1\"}]', 600.00, '2024-04-22', '17:00:00', 'CREDITO', 0.00, '000019', 1, 0, 1, 1),
(71, '[{\"id\":19,\"nombre\":\"ZORRO\",\"precio\":\"70.00\",\"cantidad\":\"3\"}]', 210.00, '2024-05-05', '10:00:00', 'CONTADO', 0.00, '000020', 1, 0, 1, 1),
(72, '[{\"id\":20,\"nombre\":\"prueba de barras xd\",\"precio\":\"1500.00\",\"cantidad\":\"2\"}]', 3000.00, '2024-05-18', '12:00:00', 'CREDITO', 0.00, '000021', 1, 0, 1, 1),
(73, '[{\"id\":9,\"nombre\":\"Auriculares inal\\u00e1mbricos Sony WH-1000XM4\",\"precio\":\"350.00\",\"cantidad\":\"5\"}]', 1750.00, '2024-05-07', '03:09:45', 'CONTADO', 0.00, '00000073', 1, 0, 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_credito` (`id_credito`);

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `apartados`
--
ALTER TABLE `apartados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `detalle_apartado`
--
ALTER TABLE `detalle_apartado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_medida` (`id_medida`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `apartados`
--
ALTER TABLE `apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `creditos`
--
ALTER TABLE `creditos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_apartado`
--
ALTER TABLE `detalle_apartado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `medidas`
--
ALTER TABLE `medidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD CONSTRAINT `abonos_ibfk_1` FOREIGN KEY (`id_credito`) REFERENCES `creditos` (`id`);

--
-- Filtros para la tabla `apartados`
--
ALTER TABLE `apartados`
  ADD CONSTRAINT `apartados_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD CONSTRAINT `creditos_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_medida`) REFERENCES `medidas` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
