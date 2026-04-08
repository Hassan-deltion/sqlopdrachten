-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Gegenereerd op: 08 apr 2026 om 11:41
-- Serverversie: 12.2.2-MariaDB-ubu2404
-- PHP-versie: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flits`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cameras`
--

CREATE TABLE `cameras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `max_speed` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `cameras`
--

INSERT INTO `cameras` (`id`, `address`, `city`, `max_speed`) VALUES
(1, 'Wendtpad 307', 'Varsselder', 100),
(2, 'Sprongring 8-q', 'Haaften', 80),
(3, 'von Heinrich d\'Omóróviczastraat 7', 'Kwintsheul', 80),
(4, 'Wooningpad 78-91', 'Klarenbeek', 100),
(5, 'Coşkunstraat 12', 'Borgsweer', 80),
(6, 'Autarsteeg 86g', 'Hall', 80),
(7, 'Veenstralaan 4', 'Vught', 50),
(8, 'Ferranpad 3-2', 'Drachtstercompagnie', 50),
(9, 'Ramautarsingel 5-6', 'Steensel', 80),
(10, 'Dogansteeg 2', 'Slochteren', 100),
(11, 'de Langelaan 7j', 'Weert', 100),
(12, 'Tekinsteeg 8d', 'Achterveld', 80),
(13, 'de Grusonsingel 56-f', 'Bredevoort', 50),
(14, 'Vroeg in de Weiweg 1-s', 'Marijenkampen', 50),
(15, 'Zhangring 3428', 'Ten Boer', 100),
(16, 'Schatteleijndreef 70', 'Warder', 50),
(17, 'Simsekbaan 46-s', 'Oldebroek', 50),
(18, 'Kalloestraat 65-09', 'Ridderkerk', 50),
(19, 'Vinkbaan 53', 'Oldenzijl', 80),
(20, 'de Jongring 28-o', 'Nuth', 80);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `cameras`
--
ALTER TABLE `cameras`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `cameras`
--
ALTER TABLE `cameras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
