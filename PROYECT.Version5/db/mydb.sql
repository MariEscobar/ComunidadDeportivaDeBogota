-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2018 a las 05:59:36
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `NombreAd` varchar(30) DEFAULT NULL,
  `ClaveAd` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`ID`, `NombreAd`, `ClaveAd`) VALUES
(1, '1030691503', 'clave');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `IdAdmin` int(11) NOT NULL,
  `NombreAdmin` varchar(45) DEFAULT NULL,
  `ApellidoAdmin` varchar(45) DEFAULT NULL,
  `CorreoAdmin` varchar(45) DEFAULT NULL,
  `ContraseñaAdmin` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `NombreCont` varchar(70) NOT NULL,
  `CorreoCont` varchar(45) DEFAULT NULL,
  `TelefonoCont` int(11) DEFAULT NULL,
  `CelularCont` int(11) DEFAULT NULL,
  `RedesSocialesCont` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte`
--

CREATE TABLE `deporte` (
  `NombreSport` varchar(45) NOT NULL,
  `DescSport` varchar(500) DEFAULT NULL,
  `AcceSport` varchar(350) DEFAULT NULL,
  `ImgSport` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte_has_lugardeportivo`
--

CREATE TABLE `deporte_has_lugardeportivo` (
  `Deporte_NombreSport` varchar(45) NOT NULL,
  `LugarDeportivo_NombreLug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `IdDetall` int(11) NOT NULL,
  `UbicDetall` varchar(70) DEFAULT NULL,
  `DescDetall` varchar(50) DEFAULT NULL,
  `PrecioDetall` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventosdeportivos`
--

CREATE TABLE `eventosdeportivos` (
  `NombreEv` varchar(50) NOT NULL,
  `FechaInicioEv` date DEFAULT NULL,
  `FechaFinEv` date DEFAULT NULL,
  `HoraInicioEv` datetime DEFAULT NULL,
  `HoraFinEv` datetime DEFAULT NULL,
  `ImgEv` longblob,
  `Detalles_IdDetall` int(11) NOT NULL,
  `Contacto_NombreCont` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventosdeportivos_has_deporte`
--

CREATE TABLE `eventosdeportivos_has_deporte` (
  `EventosDeportivos_NombreEv` varchar(50) NOT NULL,
  `Deporte_NombreSport` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugardeportivo`
--

CREATE TABLE `lugardeportivo` (
  `NombreLug` varchar(50) NOT NULL,
  `HorariosLug` varchar(100) DEFAULT NULL,
  `ImgLug` longblob,
  `Detalles_IdDetall` int(11) NOT NULL,
  `EventosDeportivos_NombreEv` varchar(50) NOT NULL,
  `EventosDeportivos_Detalles_IdDetall` int(11) NOT NULL,
  `Contacto_NombreCont` varchar(70) NOT NULL,
  `Administrador_IdAdmin` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `CorreoUs` varchar(30) DEFAULT NULL,
  `NombreUs` varchar(30) DEFAULT NULL,
  `ClaveUs` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`ID`, `CorreoUs`, `NombreUs`, `ClaveUs`) VALUES
(1, 'dscp325@gmail.com', 'Daniel', '$2y$10$0JpJaTs0pdjglv.4Q/SWdej'),
(2, 'personal@gmail.com', 'Santiago', '$2y$10$N0U9HkseSqRNB1gl.fzapOn'),
(3, 'marizeth@gmail.com', 'Mari', 'pass1998');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `NombreUs` varchar(45) DEFAULT NULL,
  `ContraseñaUs` varchar(45) DEFAULT NULL,
  `CorreoUs` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`IdAdmin`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`NombreCont`);

--
-- Indices de la tabla `deporte`
--
ALTER TABLE `deporte`
  ADD PRIMARY KEY (`NombreSport`);

--
-- Indices de la tabla `deporte_has_lugardeportivo`
--
ALTER TABLE `deporte_has_lugardeportivo`
  ADD PRIMARY KEY (`Deporte_NombreSport`,`LugarDeportivo_NombreLug`),
  ADD KEY `fk_Deporte_has_LugarDeportivo_LugarDeportivo1_idx` (`LugarDeportivo_NombreLug`),
  ADD KEY `fk_Deporte_has_LugarDeportivo_Deporte_idx` (`Deporte_NombreSport`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`IdDetall`);

--
-- Indices de la tabla `eventosdeportivos`
--
ALTER TABLE `eventosdeportivos`
  ADD PRIMARY KEY (`NombreEv`,`Detalles_IdDetall`,`Contacto_NombreCont`),
  ADD KEY `fk_EventosDeportivos_Detalles1_idx` (`Detalles_IdDetall`),
  ADD KEY `fk_EventosDeportivos_Contacto1_idx` (`Contacto_NombreCont`);

--
-- Indices de la tabla `eventosdeportivos_has_deporte`
--
ALTER TABLE `eventosdeportivos_has_deporte`
  ADD PRIMARY KEY (`EventosDeportivos_NombreEv`,`Deporte_NombreSport`),
  ADD KEY `fk_EventosDeportivos_has_Deporte_Deporte1_idx` (`Deporte_NombreSport`),
  ADD KEY `fk_EventosDeportivos_has_Deporte_EventosDeportivos1_idx` (`EventosDeportivos_NombreEv`);

--
-- Indices de la tabla `lugardeportivo`
--
ALTER TABLE `lugardeportivo`
  ADD PRIMARY KEY (`NombreLug`,`Detalles_IdDetall`,`EventosDeportivos_NombreEv`,`EventosDeportivos_Detalles_IdDetall`,`Contacto_NombreCont`,`Administrador_IdAdmin`,`Usuario_idUsuario`),
  ADD KEY `fk_LugarDeportivo_Detalles1_idx` (`Detalles_IdDetall`),
  ADD KEY `fk_LugarDeportivo_EventosDeportivos1_idx` (`EventosDeportivos_NombreEv`,`EventosDeportivos_Detalles_IdDetall`),
  ADD KEY `fk_LugarDeportivo_Contacto1_idx` (`Contacto_NombreCont`),
  ADD KEY `fk_LugarDeportivo_Administrador1_idx` (`Administrador_IdAdmin`),
  ADD KEY `fk_LugarDeportivo_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `IdDetall` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deporte_has_lugardeportivo`
--
ALTER TABLE `deporte_has_lugardeportivo`
  ADD CONSTRAINT `fk_Deporte_has_LugarDeportivo_Deporte` FOREIGN KEY (`Deporte_NombreSport`) REFERENCES `deporte` (`NombreSport`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Deporte_has_LugarDeportivo_LugarDeportivo1` FOREIGN KEY (`LugarDeportivo_NombreLug`) REFERENCES `lugardeportivo` (`NombreLug`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eventosdeportivos`
--
ALTER TABLE `eventosdeportivos`
  ADD CONSTRAINT `fk_EventosDeportivos_Contacto1` FOREIGN KEY (`Contacto_NombreCont`) REFERENCES `contacto` (`NombreCont`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EventosDeportivos_Detalles1` FOREIGN KEY (`Detalles_IdDetall`) REFERENCES `detalles` (`IdDetall`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eventosdeportivos_has_deporte`
--
ALTER TABLE `eventosdeportivos_has_deporte`
  ADD CONSTRAINT `fk_EventosDeportivos_has_Deporte_Deporte1` FOREIGN KEY (`Deporte_NombreSport`) REFERENCES `deporte` (`NombreSport`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EventosDeportivos_has_Deporte_EventosDeportivos1` FOREIGN KEY (`EventosDeportivos_NombreEv`) REFERENCES `eventosdeportivos` (`NombreEv`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lugardeportivo`
--
ALTER TABLE `lugardeportivo`
  ADD CONSTRAINT `fk_LugarDeportivo_Administrador1` FOREIGN KEY (`Administrador_IdAdmin`) REFERENCES `administrador` (`IdAdmin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LugarDeportivo_Contacto1` FOREIGN KEY (`Contacto_NombreCont`) REFERENCES `contacto` (`NombreCont`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LugarDeportivo_Detalles1` FOREIGN KEY (`Detalles_IdDetall`) REFERENCES `detalles` (`IdDetall`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LugarDeportivo_EventosDeportivos1` FOREIGN KEY (`EventosDeportivos_NombreEv`,`EventosDeportivos_Detalles_IdDetall`) REFERENCES `eventosdeportivos` (`NombreEv`, `Detalles_IdDetall`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LugarDeportivo_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
