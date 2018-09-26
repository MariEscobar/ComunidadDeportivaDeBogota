-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-08-2018 a las 18:54:37
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comunidad_deportiva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrator`
--

CREATE TABLE `administrator` (
  `idadministrator` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` int(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detail`
--

CREATE TABLE `detail` (
  `iddetail` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locus_sports`
--

CREATE TABLE `locus_sports` (
  `idlocus` int(11) NOT NULL,
  `timescale` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `administrator_idadministrator` int(11) NOT NULL,
  `occasion_idoccasion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locus_sports_has_sport`
--

CREATE TABLE `locus_sports_has_sport` (
  `locus_sports_idlocus` int(11) NOT NULL,
  `sport_idsport` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `occasion`
--

CREATE TABLE `occasion` (
  `idoccasion` int(11) NOT NULL,
  `detail_iddetail` int(11) NOT NULL,
  `date_start` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_end` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sport`
--

CREATE TABLE `sport` (
  `idsport` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `locus_sports_idlocus` int(11) NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`idadministrator`);

--
-- Indices de la tabla `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`iddetail`);

--
-- Indices de la tabla `locus_sports`
--
ALTER TABLE `locus_sports`
  ADD PRIMARY KEY (`idlocus`),
  ADD KEY `fk_locus_sports_administrator1_idx` (`administrator_idadministrator`),
  ADD KEY `fk_locus_sports_occasion1_idx` (`occasion_idoccasion`);

--
-- Indices de la tabla `locus_sports_has_sport`
--
ALTER TABLE `locus_sports_has_sport`
  ADD PRIMARY KEY (`locus_sports_idlocus`,`sport_idsport`),
  ADD KEY `fk_locus_sports_has_sport_sport1_idx` (`sport_idsport`),
  ADD KEY `fk_locus_sports_has_sport_locus_sports1_idx` (`locus_sports_idlocus`);

--
-- Indices de la tabla `occasion`
--
ALTER TABLE `occasion`
  ADD PRIMARY KEY (`idoccasion`),
  ADD KEY `fk_occasion_detail1_idx` (`detail_iddetail`);

--
-- Indices de la tabla `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`idsport`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_locus_sports_idx` (`locus_sports_idlocus`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `locus_sports`
--
ALTER TABLE `locus_sports`
  ADD CONSTRAINT `fk_locus_sports_administrator1` FOREIGN KEY (`administrator_idadministrator`) REFERENCES `administrator` (`idadministrator`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_locus_sports_occasion1` FOREIGN KEY (`occasion_idoccasion`) REFERENCES `occasion` (`idoccasion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `locus_sports_has_sport`
--
ALTER TABLE `locus_sports_has_sport`
  ADD CONSTRAINT `fk_locus_sports_has_sport_locus_sports1` FOREIGN KEY (`locus_sports_idlocus`) REFERENCES `locus_sports` (`idlocus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_locus_sports_has_sport_sport1` FOREIGN KEY (`sport_idsport`) REFERENCES `sport` (`idsport`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `occasion`
--
ALTER TABLE `occasion`
  ADD CONSTRAINT `fk_occasion_detail1` FOREIGN KEY (`detail_iddetail`) REFERENCES `detail` (`iddetail`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_locus_sports` FOREIGN KEY (`locus_sports_idlocus`) REFERENCES `locus_sports` (`idlocus`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
