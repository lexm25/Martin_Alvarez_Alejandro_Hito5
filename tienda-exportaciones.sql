-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2022 a las 05:54:54
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda-exportaciones`
--
CREATE DATABASE IF NOT EXISTS `tienda-exportaciones` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda-exportaciones`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `familia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `procedencia` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` int(2) NOT NULL,
  `stock` int(3) NOT NULL DEFAULT 100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`id`, `nombre`, `descripcion`, `familia`, `procedencia`, `imagen`, `precio`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Tomate', 'Tomates de alta calidad que marcan la diferencia con los del resto de comunidades. Muy demandados en todo el país, han conseguido por mérito propio la marca nacional colectiva. Ésta diferencia viene dada por la calidez del clima, que aporta el dulzor al tomate.', 'Genaro', 'Los Palacios y Villafranca, Sevilla', 'https://elcorreoweb.es/binrepository/tomate-de-los-palacios-1-20569958-20210126153931_20571667_20210129120737.jpg', 2, 100, '2022-06-16 09:23:22', '2022-06-20 21:27:28'),
(2, 'Sandía', 'Variedad de piel oscura que no produce ningún tipo de veteado en la coloración. Fruto redondo, con un peso medio de 4.5-5.2 kg, el cuál contiene pipas. Fruta refrescante, perfecta para el verano', 'Negra', 'Los Palacios y Villafranca, Sevilla', 'https://www.palacios.es/palacios/usuariosFtp/conexion/imagenes4571a.jpg', 2, 100, '2022-06-16 09:23:22', '2022-06-20 19:56:55'),
(3, 'Sandía', 'A diferencia de la sandía negra, la rayada, no tiene pepitas.', 'Rayada', 'Los Palacios y Villafranca', 'https://valenciafruits.com/wp-content/uploads/2021/07/Sandia.jpg', 2, 100, '2022-06-16 09:23:22', '2022-06-20 19:47:19'),
(4, 'Uva', 'Uva de mesa fresca sin hueso, lista para servir y disfrutar de este manjar.', 'De Mesa', 'Los Palacios y Villafranca', 'https://portal.andina.pe/EDPfotografia3/Thumbnail/2019/09/11/000618887W.jpg', 2, 100, '2022-06-16 09:23:22', '2022-06-20 19:54:56'),
(5, 'Calabaza', 'La temporada de esta hortaliza de verano continuará hasta noviembre, así que de momento puedes disfrutar de ella. Perfecta para los guisos, tartas y para su consumo habitual.', 'Butternut', 'Los Palacios y Villafranca', 'https://t2.ev.ltmcdn.com/es/posts/0/8/2/como_plantar_calabazas_2280_600.jpg', 2, 100, '2022-06-16 09:23:22', '2022-06-20 19:58:17'),
(6, 'Uva', 'Uva Palomino o común mente llamda uva blanca, considerada la variedad blanca predominante en la Denominación de Origen de Jerez, presenta una elevada productividad por lo que su cultivo se está extendiendo cada vez más por otras comarcas españolas', 'Blanca', 'Jerez de la Frontera, Cádiz', 'https://www.vinetur.com/imagenes/2019/julio/15/uvablanca3.jpg', 2, 100, '2022-06-16 09:23:22', '2022-06-20 19:54:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_19_180852_create_articles_table', 2),
(6, '2022_06_16_151810_create_shopping_carts_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `familia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT 0,
  `precio` int(2) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `shoppingcart`
--

INSERT INTO `shoppingcart` (`id`, `nombre`, `familia`, `imagen`, `cantidad`, `precio`, `created_at`, `updated_at`) VALUES
(14, 'Tomate', 'Genaro', 'https://elcorreoweb.es/binrepository/tomate-de-los-palacios-1-20569958-20210126153931_20571667_20210129120737.jpg', 5, 2, '2022-06-20 21:28:11', '2022-06-20 21:28:11'),
(15, 'Uva', 'De Mesa', 'https://portal.andina.pe/EDPfotografia3/Thumbnail/2019/09/11/000618887W.jpg', 3, 2, '2022-06-20 21:28:43', '2022-06-20 21:28:43'),
(16, 'Sandía', 'Negra', 'https://www.palacios.es/palacios/usuariosFtp/conexion/imagenes4571a.jpg', 2, 2, '2022-06-21 00:27:58', '2022-06-21 00:27:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  `rol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `direccion`, `telefono`, `rol`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Alejandro Martín', 'alejandro@hotmail.com', 'c/amargura, 23', 666666666, 'admin', NULL, '$2y$10$YXHXi9tSyiT8eUS6Akec8.9VODNQDEMQ5iExh3rCbm6JOjNADHW1y', NULL, '2022-05-29 13:44:10', '2022-05-29 13:44:10'),
(3, 'Antonio Gutiérrez', 'antonio@gmail.com', 'calle melainvento, 32', 632498758, 'user', NULL, '$2y$10$A9eWYdzOe8ok4oEMM3rxEesTj371wkoxmPkdkO6HOcN8N5IqyzDve', NULL, '2022-06-05 16:40:10', '2022-06-05 16:40:10'),
(4, 'José Francisco Fernández', 'jose@gmail.com', 'calle nose, 534', 697412589, 'user', NULL, '$2y$10$YUgd/iJU/Fb2YfPkOKm78eGakN.zvbbliM/zd2298DxtP9kkkv7gO', NULL, '2022-06-05 16:40:32', '2022-06-05 16:40:32'),
(6, 'Fernando Tejero', 'fernando@gmail.com', 'calle antonio machado', 654789321, 'admin', NULL, '$2y$10$/8QRD/OoxDdDft7UO2j6M.orkUHYrV3lJ0gqTGDfs/EY56etqmLmC', NULL, '2022-06-11 08:27:30', '2022-06-11 08:27:30');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `shoppingcart`
--
ALTER TABLE `shoppingcart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
