-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-03-2020 a las 17:20:47
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sseul`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador y llave primaria del archivo',
  `nombre` varchar(500) COLLATE utf8_bin NOT NULL COMMENT 'Nombre del archivo',
  `cargado_por` varchar(500) COLLATE utf8_bin NOT NULL COMMENT 'Usuario del sistema quien carga el archivo',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de creación',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de la última actualización'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Almacena los archivos subidos al sistema';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cohortes`
--

CREATE TABLE `cohortes` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Indentificador y llave primaria del cohorte',
  `programa_id` int(10) UNSIGNED NOT NULL COMMENT 'Relación al programa académico',
  `codigo` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'Código del cohorte',
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Nombre para mostrar del cohorte',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de creación',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de la última actualización',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de eliminación (eliminación lógica)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Almacena los cohortes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador y llave primaria del estudiante',
  `programa_id` int(10) UNSIGNED NOT NULL COMMENT 'Relación al programa académico',
  `cohorte_id` int(10) UNSIGNED NOT NULL COMMENT 'Relación al cohorte',
  `codigo` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'Código del estudiante',
  `nombre` varchar(500) COLLATE utf8_bin NOT NULL COMMENT 'Nombre del estudiante',
  `identificacion` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'Identificación del estudiante',
  `email` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'Correo electrónico del estudiante',
  `movil` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'Teléfono movil del estudiante',
  `estado` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'Matriculado' COMMENT 'Estado del estudiante',
  `created_at` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fecha y hora de creación',
  `updated_at` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fecha y hora de la última actualización',
  `deleted_at` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fecha y hora de eliminación (eliminación lógica)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Almacena los estudiantes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultades`
--

CREATE TABLE `facultades` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador y llave primaria',
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Código de la facultad',
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'Nombre de la facultad',
  `esta_activa` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Bandera que indica si la facultad se encuentra activa o no',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de creación',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de la última actualización',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de eliminación (eliminación lógica)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Almacena las facultades';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(500) COLLATE utf8_bin NOT NULL,
  `token` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador y llave priaria del progragrama académico',
  `facultad_id` int(10) UNSIGNED NOT NULL COMMENT 'Facultad a la que pertenece el programa académico',
  `codigo` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'Código del programa académico',
  `nombre` varchar(500) COLLATE utf8_bin NOT NULL COMMENT 'Nombre del programa académico',
  `esta_activo` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Bandera que indica si el programa si encuentra activo o no',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de creación',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de la última actualización',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de eliminación (eliminación lógica)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Almacena los programas por facultad';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador y llave primaria del registro',
  `archivo_id` int(10) UNSIGNED NOT NULL COMMENT 'Id del archivo dónde fue cargado',
  `cohorte_id` int(10) UNSIGNED NOT NULL COMMENT 'Id del cohorte',
  `programa_id` int(10) UNSIGNED NOT NULL COMMENT 'Id del programa académico',
  `estudiante_id` int(10) UNSIGNED NOT NULL COMMENT 'Id del estudiante',
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL COMMENT 'Código del estudiante',
  `identificacion` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'Número de identificación del estudiante',
  `nombre` varchar(500) COLLATE utf8_bin NOT NULL COMMENT 'Nombre del estudiante',
  `email` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'Correo electrónico del estudiante',
  `movil` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Teléfono movil del estudiante',
  `altura_semestral` int(15) UNSIGNED NOT NULL COMMENT 'El semestre en el cual se encuentra el estudiante',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de creación',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de la última actualización'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Almacena los registros subidos al sistema';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `rol` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT 'Usuario',
  `name` varchar(250) COLLATE utf8_bin NOT NULL,
  `email` varchar(500) COLLATE utf8_bin NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `remember_token` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `rol`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrador', 'Jhonny Montoya', 'jhonnyf-montoyat@unilibre.edu.co', NULL, '$2y$10$n7LmqGp8JBQ39sLQcKc0Qet6IPqx5y24efsb2yz6C8iqeCn3Bmj6a', NULL, '2020-03-02 14:52:43', '2020-03-02 14:52:43', NULL),
(2, 'ADMINISTRADOR', 'Fabian Blanco', 'fabian.blancog@unilibre.edu.co', NULL, '$2y$10$DLlHHbvGwTzNe.AfGzJck.U7ssnjL0rqmYM6V0V5zs5HsUya2a3Ky', NULL, '2020-03-02 22:18:15', '2020-03-02 22:18:15', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_archivos_nombre` (`nombre`);

--
-- Indices de la tabla `cohortes`
--
ALTER TABLE `cohortes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_cohortes_codigo` (`codigo`),
  ADD KEY `fk_cohortes_programas_programaId_idx` (`programa_id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estudiantes_programas_programaId_idx` (`programa_id`),
  ADD KEY `fk_estudiantes_cohortes_cohorteId_idx` (`cohorte_id`);

--
-- Indices de la tabla `facultades`
--
ALTER TABLE `facultades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_programas_facultades_facultadId_idx` (`facultad_id`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_registros_archivos_archivoId_idx` (`archivo_id`),
  ADD KEY `fk_registros_cohortes_cohorteId_idx` (`cohorte_id`),
  ADD KEY `fk_registros_programas_programaId_idx` (`programa_id`),
  ADD KEY `fk_registros_estudiantes_estudianteId_idx` (`estudiante_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador y llave primaria del archivo';

--
-- AUTO_INCREMENT de la tabla `cohortes`
--
ALTER TABLE `cohortes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Indentificador y llave primaria del cohorte';

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador y llave primaria del estudiante';

--
-- AUTO_INCREMENT de la tabla `facultades`
--
ALTER TABLE `facultades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador y llave primaria';

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador y llave priaria del progragrama académico';

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador y llave primaria del registro';

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cohortes`
--
ALTER TABLE `cohortes`
  ADD CONSTRAINT `fk_cohortes_programas_programaId` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `fk_estudiantes_cohortes_cohorteId` FOREIGN KEY (`cohorte_id`) REFERENCES `cohortes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiantes_programas_programaId` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `programas`
--
ALTER TABLE `programas`
  ADD CONSTRAINT `fk_programas_facultades_facultadId` FOREIGN KEY (`facultad_id`) REFERENCES `facultades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registros`
--
ALTER TABLE `registros`
  ADD CONSTRAINT `fk_registros_archivos_archivoId` FOREIGN KEY (`archivo_id`) REFERENCES `archivos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_registros_cohortes_cohorteId` FOREIGN KEY (`cohorte_id`) REFERENCES `cohortes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_registros_estudiantes_estudianteId` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_registros_programas_programaId` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
