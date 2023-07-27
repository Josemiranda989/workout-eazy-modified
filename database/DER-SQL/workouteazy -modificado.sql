-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2023 a las 20:58:05
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `workouteazy`
--
CREATE DATABASE IF NOT EXISTS `workouteazy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `workouteazy`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aliado`
--

CREATE TABLE `aliado` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `aliadoProfile` varchar(255) NOT NULL,
  `entityName` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `services` varchar(255) NOT NULL,
  `document` varchar(255) NOT NULL,
  `documentNumber` int(11) NOT NULL,
  `birthDate` datetime DEFAULT NULL,
  `servicesCity` varchar(255) NOT NULL,
  `contactNumber` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `condiciones` varchar(255) DEFAULT NULL,
  `privacidad` varchar(255) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aliado`
--

INSERT INTO `aliado` (`id`, `firstName`, `lastName`, `aliadoProfile`, `entityName`, `genre`, `services`, `document`, `documentNumber`, `birthDate`, `servicesCity`, `contactNumber`, `email`, `avatar`, `password`, `condiciones`, `privacidad`, `rol`) VALUES
(1, 'Jose', 'foka', 'ojasdod', 'ojasojpd', 'joapdoas', 'fafd', 'gfgsd', 12313213, '2023-07-11 15:44:32', 'dsadsad', 1231, '@hotmal.co', 'sree3adsdsasd', '1231313', '12313213', '21313123', '13123213'),
(2, 'Lucas', 'foka', 'ojasdod', 'ojasojpd', 'joapdoas', 'fafd', 'gfgsd', 12313213, '2023-07-11 15:44:32', 'dsadsad', 1231, '@hotmal.co', 'sree3adsdsasd', '1231313', '12313213', '21313123', '13123213');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `contactNumber` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `condiciones` varchar(255) DEFAULT NULL,
  `privacidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `activityName` varchar(255) DEFAULT NULL,
  `aliadoName` varchar(255) DEFAULT NULL,
  `aliadoId` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `productDescription` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `spots` int(11) DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `length` time DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `activityName`, `aliadoName`, `aliadoId`, `category`, `subcategory`, `productDescription`, `price`, `discount`, `spots`, `schedule`, `length`, `image`, `difficulty`, `adress`, `city`, `age`, `mode`) VALUES
(1, 'actividad', 'aliadoNombre', 1, 'categoria', 'subcategoria', 'descripcion', 12, 454, 0, '0000-00-00 00:00:00', '00:00:12', 'imagen', 'dificultad', 'direccion', 'ciudad', '12', 'modo'),
(3, 'actividad', 'aliadoNombre', 2, 'categoria', 'subcategoria', 'descripcion', 12, 454, 0, '0000-00-00 00:00:00', '00:00:12', 'imagen', 'dificultad', 'direccion', 'ciudad', '12', 'modo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productscart`
--

CREATE TABLE `productscart` (
  `quantity` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `carritoId` int(11) NOT NULL,
  `productoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aliado`
--
ALTER TABLE `aliado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aliadoId` (`aliadoId`);

--
-- Indices de la tabla `productscart`
--
ALTER TABLE `productscart`
  ADD PRIMARY KEY (`carritoId`,`productoId`),
  ADD KEY `productoId` (`productoId`);

--
-- Indices de la tabla `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clienteID` (`clienteID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aliado`
--
ALTER TABLE `aliado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `shoppingcart`
--
ALTER TABLE `shoppingcart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`aliadoId`) REFERENCES `aliado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productscart`
--
ALTER TABLE `productscart`
  ADD CONSTRAINT `productscart_ibfk_1` FOREIGN KEY (`carritoId`) REFERENCES `shoppingcart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productscart_ibfk_2` FOREIGN KEY (`productoId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
