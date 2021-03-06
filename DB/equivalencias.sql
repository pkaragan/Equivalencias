-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2019 at 09:58 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `equivalencias`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `AdminDNI` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `AdminNombre` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `AdminApellido` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `AdminTelefono` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `AdminDireccion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaCodigo` varchar(70) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `AdminDNI`, `AdminNombre`, `AdminApellido`, `AdminTelefono`, `AdminDireccion`, `CuentaCodigo`) VALUES
(1, '1234567', 'Francisco G', 'Mendoza', '6561234567', 'Las Parcelas 4720', 'AC39666591'),
(7, '11111', 'Karen', 'Monares', '65612225897', 'Av del Charro 2358', 'AC65804162'),
(8, '22222', 'Carlos', 'Mendoza', '6681020305', 'Matacahui 189', 'AC92369973');

-- --------------------------------------------------------

--
-- Table structure for table `alumno`
--

CREATE TABLE `alumno` (
  `id` int(10) NOT NULL,
  `AlumnoNombre` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `AlumnoApellido` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `AlumnoFecNac` date NOT NULL,
  `AlumnoTelefono` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `AlumnoCodigo` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `AlumnoEmail` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `AlumnoUniversidad` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `AlumnoCarrera` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `AlumnoSemestre` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `alumno`
--

INSERT INTO `alumno` (`id`, `AlumnoNombre`, `AlumnoApellido`, `AlumnoFecNac`, `AlumnoTelefono`, `AlumnoCodigo`, `AlumnoEmail`, `AlumnoUniversidad`, `AlumnoCarrera`, `AlumnoSemestre`) VALUES
(26, 'Francisco', 'Mendoza', '1987-11-15', '6563769461', 'AL66156711', 'frgmendoza@gmail.com', 'UV92210553', 'CR04289877', 4);

-- --------------------------------------------------------

--
-- Table structure for table `alumnomaterias`
--

CREATE TABLE `alumnomaterias` (
  `id` int(11) NOT NULL,
  `CodigoAlumno` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `CodigoMateria` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `CalificacionMateria` decimal(10,0) NOT NULL,
  `MateriaUacj` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `EstatusMateria` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `alumnomaterias`
--

INSERT INTO `alumnomaterias` (`id`, `CodigoAlumno`, `CodigoMateria`, `CalificacionMateria`, `MateriaUacj`, `EstatusMateria`) VALUES
(71, 'AL66156711', 'MT33939782', '0', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(10) NOT NULL,
  `BitacoraCodigo` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `BitacoraFecha` date NOT NULL,
  `BitacoraHoraInicio` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `BitacoraHoraFinal` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `BitacoraTipo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `BitacoraYear` int(4) NOT NULL,
  `CuentaCodigo` varchar(70) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `bitacora`
--

INSERT INTO `bitacora` (`id`, `BitacoraCodigo`, `BitacoraFecha`, `BitacoraHoraInicio`, `BitacoraHoraFinal`, `BitacoraTipo`, `BitacoraYear`, `CuentaCodigo`) VALUES
(1, 'CB49146401', '2019-02-20', '12:17:27 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(2, 'CB25726262', '2019-02-20', '12:17:38 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(3, 'CB05136203', '2019-02-20', '12:17:43 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(4, 'CB69196884', '2019-02-20', '12:17:49 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(5, 'CB56490635', '2019-02-20', '12:20:23 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(7, 'CB76570707', '2019-02-20', '12:32:06 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(8, 'CB73673848', '2019-02-20', '02:06:48 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(9, 'CB23640719', '2019-02-21', '10:30:13 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(10, 'CB345842110', '2019-02-21', '10:36:47 am', '11:17:10 am', 'Administrador', 2019, 'AC39666591'),
(11, 'CB504053711', '2019-02-21', '10:37:27 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(12, 'CB052189312', '2019-02-21', '10:38:29 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(13, 'CB960277813', '2019-02-21', '10:39:38 am', '10:53:18 am', 'Administrador', 2019, 'AC39666591'),
(14, 'CB421995814', '2019-02-21', '10:54:01 am', '10:54:04 am', 'Administrador', 2019, 'AC39666591'),
(15, 'CB593507415', '2019-02-21', '10:56:37 am', '10:56:41 am', 'Administrador', 2019, 'AC39666591'),
(16, 'CB232155016', '2019-02-21', '11:17:27 am', '11:17:34 am', 'Administrador', 2019, 'AC39666591'),
(17, 'CB546374117', '2019-02-21', '12:57:33 pm', '01:36:40 pm', 'Administrador', 2019, 'AC39666591'),
(20, 'CB068439020', '2019-02-21', '02:23:04 pm', '02:32:47 pm', 'Administrador', 2019, 'AC39666591'),
(21, 'CB319275221', '2019-02-26', '10:57:54 am', '11:14:43 am', 'Administrador', 2019, 'AC39666591'),
(23, 'CB186814423', '2019-02-26', '11:29:41 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(24, 'CB134545124', '2019-02-26', '11:50:45 am', '12:24:07 pm', 'Administrador', 2019, 'AC39666591'),
(25, 'CB142755125', '2019-02-26', '12:24:10 pm', '01:59:17 pm', 'Administrador', 2019, 'AC39666591'),
(26, 'CB702425826', '2019-02-26', '12:42:21 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(27, 'CB622248823', '2019-02-26', '02:08:03 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(28, 'CB046877624', '2019-02-27', '12:04:23 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(29, 'CB338604625', '2019-02-27', '01:54:07 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(30, 'CB032346526', '2019-02-27', '01:55:52 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(31, 'CB473967927', '2019-02-27', '01:56:36 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(32, 'CB868862328', '2019-02-27', '01:59:33 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(33, 'CB372189129', '2019-02-27', '02:58:56 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(34, 'CB663027630', '2019-02-28', '10:56:37 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(35, 'CB890201931', '2019-02-28', '11:59:26 am', '01:40:29 pm', 'Administrador', 2019, 'AC39666591'),
(36, 'CB312175632', '2019-02-28', '01:49:09 pm', '01:53:53 pm', 'Administrador', 2019, 'AC39666591'),
(37, 'CB729121933', '2019-02-28', '01:53:57 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(38, 'CB655624034', '2019-03-01', '11:30:48 am', '02:39:17 pm', 'Administrador', 2019, 'AC39666591'),
(39, 'CB959258335', '2019-03-01', '02:58:36 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(40, 'CB167376336', '2019-03-01', '03:13:00 pm', '03:13:56 pm', 'Administrador', 2019, 'AC39666591'),
(41, 'CB439693137', '2019-03-01', '03:14:00 pm', '03:15:28 pm', 'Cliente', 2019, 'CC33358054'),
(42, 'CB647991238', '2019-03-01', '03:15:31 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(43, 'CB554541439', '2019-03-04', '12:55:32 pm', '01:02:58 pm', 'Administrador', 2019, 'AC39666591'),
(44, 'CB723937440', '2019-03-04', '04:40:34 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(45, 'CB202521341', '2019-03-04', '04:43:50 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(46, 'CB811302042', '2019-03-04', '05:30:06 pm', '07:06:43 pm', 'Administrador', 2019, 'AC39666591'),
(47, 'CB656521143', '2019-03-04', '07:06:46 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(48, 'CB601819244', '2019-03-05', '10:52:25 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(49, 'CB855489345', '2019-03-05', '01:52:45 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(50, 'CB750824146', '2019-03-05', '01:58:01 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(51, 'CB332577347', '2019-03-05', '01:58:39 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(52, 'CB209650048', '2019-03-06', '10:38:44 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(53, 'CB440035249', '2019-03-07', '12:05:32 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(54, 'CB356965350', '2019-03-07', '06:02:16 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(55, 'CB141901751', '2019-03-07', '09:21:38 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(56, 'CB864666652', '2019-03-07', '10:29:09 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(57, 'CB024514453', '2019-03-11', '09:55:48 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(58, 'CB861421554', '2019-03-11', '09:56:27 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(59, 'CB792092755', '2019-03-11', '09:57:07 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(60, 'CB879990856', '2019-03-11', '05:05:55 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(61, 'CB057328157', '2019-03-12', '10:03:20 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(62, 'CB805189358', '2019-03-12', '05:31:28 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(63, 'CB335857959', '2019-03-13', '08:06:00 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(64, 'CB052427560', '2019-03-14', '10:37:20 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(65, 'CB946751161', '2019-03-15', '10:39:26 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(66, 'CB465904962', '2019-03-15', '12:05:14 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(67, 'CB583972863', '2019-03-15', '06:37:50 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(68, 'CB745566764', '2019-03-19', '09:57:39 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(69, 'CB169637765', '2019-03-19', '02:58:12 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(70, 'CB028584166', '2019-03-19', '05:21:02 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(71, 'CB312620467', '2019-03-19', '09:13:43 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(72, 'CB092984268', '2019-03-20', '09:22:21 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(73, 'CB938442969', '2019-03-20', '04:41:17 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(74, 'CB349820270', '2019-03-20', '07:51:52 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(75, 'CB866377071', '2019-03-23', '01:23:43 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(76, 'CB221429072', '2019-03-25', '01:11:56 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(77, 'CB592280373', '2019-03-26', '12:14:43 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(78, 'CB570634274', '2019-03-26', '12:41:49 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(79, 'CB231758375', '2019-03-26', '12:42:31 pm', '01:03:02 pm', 'Administrador', 2019, 'AC39666591'),
(80, 'CB238171276', '2019-03-26', '01:06:54 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(81, 'CB550255877', '2019-03-27', '03:47:51 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(82, 'CB170249078', '2019-03-28', '10:35:17 am', '01:58:34 pm', 'Administrador', 2019, 'AC39666591'),
(83, 'CB187368079', '2019-03-28', '01:58:37 pm', '04:42:23 pm', 'Administrador', 2019, 'AC39666591'),
(84, 'CB151298180', '2019-03-28', '04:42:27 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(85, 'CB034280981', '2019-03-28', '05:13:12 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(86, 'CB482561882', '2019-04-01', '10:17:13 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(87, 'CB040545583', '2019-04-01', '11:06:05 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(88, 'CB665120184', '2019-04-01', '01:11:07 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(89, 'CB820982385', '2019-04-01', '01:20:20 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(90, 'CB792702386', '2019-04-01', '10:03:41 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(91, 'CB042292887', '2019-04-01', '10:08:30 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(92, 'CB704772288', '2019-04-01', '10:12:36 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(93, 'CB981388589', '2019-04-01', '10:16:13 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(94, 'CB868444090', '2019-04-01', '10:16:27 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(95, 'CB790666891', '2019-04-01', '10:17:26 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(96, 'CB584592892', '2019-04-01', '10:30:12 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(97, 'CB202957293', '2019-04-01', '10:56:23 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(98, 'CB882861994', '2019-04-02', '11:42:28 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(99, 'CB169024995', '2019-04-02', '01:08:12 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(100, 'CB720276496', '2019-04-02', '01:08:23 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(101, 'CB919798097', '2019-04-02', '01:32:20 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(102, 'CB618974498', '2019-04-02', '03:50:53 pm', '04:52:10 pm', 'Administrador', 2019, 'AC39666591'),
(103, 'CB540196999', '2019-04-02', '04:52:14 pm', '05:24:32 pm', 'Administrador', 2019, 'AC39666591'),
(104, 'CB7379179100', '2019-04-02', '06:43:16 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(105, 'CB2513511101', '2019-04-03', '10:25:14 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(106, 'CB6930068102', '2019-04-03', '03:08:58 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(107, 'CB9611627103', '2019-04-03', '03:10:02 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(108, 'CB7088860104', '2019-04-03', '03:12:33 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(109, 'CB3756835105', '2019-04-03', '03:14:27 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(110, 'CB5532437106', '2019-04-03', '03:17:57 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(111, 'CB3870572107', '2019-04-03', '07:01:24 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(112, 'CB3023867108', '2019-04-04', '11:04:44 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(113, 'CB5153134109', '2019-04-04', '12:18:56 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(114, 'CB2095070110', '2019-04-04', '04:48:00 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(115, 'CB5127361111', '2019-04-08', '11:05:12 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(116, 'CB8996250112', '2019-04-08', '02:59:10 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(117, 'CB4170422113', '2019-04-08', '07:26:13 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(118, 'CB2710769114', '2019-04-30', '11:41:22 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(119, 'CB1588158115', '2019-05-01', '12:35:32 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(120, 'CB7799401116', '2019-05-01', '12:35:50 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(121, 'CB9661257117', '2019-05-01', '02:46:12 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(122, 'CB6864959118', '2019-05-01', '05:49:09 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(123, 'CB9072364119', '2019-05-01', '06:50:58 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(124, 'CB1257070120', '2019-05-01', '10:41:52 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(125, 'CB7907420121', '2019-05-01', '10:45:57 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(126, 'CB1692884122', '2019-05-01', '10:53:19 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(127, 'CB4188910123', '2019-05-02', '10:38:17 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(128, 'CB3798520124', '2019-05-02', '10:48:04 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(129, 'CB4510642125', '2019-05-02', '12:15:16 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(130, 'CB8515349126', '2019-11-05', '01:52:18 pm', '06:36:56 pm', 'Administrador', 2019, 'AC39666591'),
(131, 'CB8418870127', '2019-11-06', '06:37:00 pm', '06:41:24 pm', 'Administrador', 2019, 'AC39666591'),
(132, 'CB9038952128', '2019-11-06', '06:41:29 pm', '08:21:37 pm', 'Administrador', 2019, 'AC39666591'),
(133, 'CB8640607129', '2019-11-06', '08:21:41 pm', '09:42:12 pm', 'Administrador', 2019, 'AC39666591'),
(134, 'CB3996830130', '2019-11-06', '09:41:19 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(135, 'CB6489120131', '2019-11-06', '09:42:15 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(136, 'CB2197738132', '2019-11-08', '01:40:16 am', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(137, 'CB5629079133', '2019-11-13', '08:27:04 pm', '09:14:14 pm', 'Administrador', 2019, 'AC39666591'),
(138, 'CB0024621134', '2019-11-13', '09:42:03 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(139, 'CB6847009135', '2019-11-14', '08:43:12 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(140, 'CB0961383136', '2019-11-16', '02:20:39 pm', 'Sin registro', 'Administrador', 2019, 'AC39666591'),
(141, 'CB3600033137', '2019-11-16', '03:09:57 pm', '01:54:25 pm', 'Administrador', 2019, 'AC39666591');

-- --------------------------------------------------------

--
-- Table structure for table `carrera`
--

CREATE TABLE `carrera` (
  `id` int(11) NOT NULL,
  `CarreraNombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `CarreraCodigo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `CarreraCodigoUniversidad` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `carrera`
--

INSERT INTO `carrera` (`id`, `CarreraNombre`, `CarreraCodigo`, `CarreraCodigoUniversidad`) VALUES
(3, 'Ingenieria en sistemas digitales', 'CR91787422', 'UV97784701'),
(6, 'Ingenieria Ambiental', 'CR89637355', 'UV97784701'),
(9, 'Ingenieria Industrial', 'CR81139885', 'UV97784701'),
(10, 'Ingenieria Civil', 'CR05620084', 'UV97784701'),
(13, 'Ingenieria Mecatronica', 'CR98464235', 'UV97784701'),
(14, 'Criminologia', 'CR90534746', 'UV92121712'),
(15, 'Ingenieria en sistemas computacionales', 'CR04289877', 'UV92210553');

-- --------------------------------------------------------

--
-- Table structure for table `carrerauacj`
--

CREATE TABLE `carrerauacj` (
  `CarreraNombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `CarreraCodigo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `carrerauacj`
--

INSERT INTO `carrerauacj` (`CarreraNombre`, `CarreraCodigo`) VALUES
('Ingenierí­a en Sistemas Digitales y Comunicaciones', 'CU08241731'),
('Ingeniería en Sistemas Computacionales', 'CU36749831'),
('Ingeniería Biomédica', 'CU64417521'),
('Ingenierí­a Eléctrica', 'CU94079411'),
('Ingenierí­a de Softwarew', 'CU98959691');

-- --------------------------------------------------------

--
-- Table structure for table `cuenta`
--

CREATE TABLE `cuenta` (
  `id` int(10) NOT NULL,
  `CuentaCodigo` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaPrivilegio` int(1) NOT NULL,
  `CuentaUsuario` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaClave` varchar(535) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaEmail` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaEstado` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaTipo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaGenero` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaFoto` varchar(535) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `cuenta`
--

INSERT INTO `cuenta` (`id`, `CuentaCodigo`, `CuentaPrivilegio`, `CuentaUsuario`, `CuentaClave`, `CuentaEmail`, `CuentaEstado`, `CuentaTipo`, `CuentaGenero`, `CuentaFoto`) VALUES
(1, 'AC39666591', 1, 'admin', 'MkVOTWwrbTFVZzdQR1RqMjBYQUxOZz09', 'admin@admin.com', 'Activo', 'Administrador', 'Masculino', 'Male3Avatar.png'),
(16, 'AC65804162', 2, 'kmonares', 'SmtMN0RqemMzVmRXeUZLT1RaMExLdz09', 'kmonares@hotmail.com', 'Activo', 'Administrador', 'Femenino', 'Female3Avatar.png'),
(17, 'AC92369973', 3, 'cmendoza', 'Wm96aWFXWTlrVWhNcVBjUGhkc3hlQT09', 'cmendoza@live.com', 'Activo', 'Administrador', 'Masculino', 'Male3Avatar.png'),
(18, 'CC33358054', 4, 'cliente', 'WWU5LzdIek9PUTF6alh2OW92SVpMUT09', 'cliente@hotmail.com', 'Activo', 'Cliente', 'Masculino', 'Male2Avatar.png');

-- --------------------------------------------------------

--
-- Table structure for table `materia`
--

CREATE TABLE `materia` (
  `MateriaCodigo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `MateriaNombre` varchar(170) COLLATE utf8_spanish2_ci NOT NULL,
  `MateriaCarrera` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `MateriaUacj` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `materia`
--

INSERT INTO `materia` (`MateriaCodigo`, `MateriaNombre`, `MateriaCarrera`, `MateriaUacj`) VALUES
('MT33939782', 'asdad', 'CR04289877', NULL),
('MT92181311', 'Matemáticas', 'CR91787422', 'CBE120196');

-- --------------------------------------------------------

--
-- Table structure for table `materiauacj`
--

CREATE TABLE `materiauacj` (
  `MateriaUacjNombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `MateriaUacjClave` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `MateriaUacjCreditos` tinyint(2) NOT NULL,
  `MateriaUacjObligatoria` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `MateriaUacjCarrera` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `MateriaUacjSemestre` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `materiauacj`
--

INSERT INTO `materiauacj` (`MateriaUacjNombre`, `MateriaUacjClave`, `MateriaUacjCreditos`, `MateriaUacjObligatoria`, `MateriaUacjCarrera`, `MateriaUacjSemestre`) VALUES
('Calculo I', 'CBE100296', 8, 'obl', 'CU36749831', 1),
('Fi­sica I', 'CBE120196', 8, 'obl', 'CU36749831', 2),
('Algebra', 'CBE122396', 8, 'obl', 'CU36749831', 2),
('Química', 'CBE150196', 8, 'obl', 'CU36749831', 1),
('Fundamentos de Programción', 'IEC980900', 8, 'obl', 'CU36749831', 4);

-- --------------------------------------------------------

--
-- Table structure for table `universidad`
--

CREATE TABLE `universidad` (
  `id` int(10) NOT NULL,
  `UniversidadCodigo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `UniversidadNombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `UniversidadTelefono` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `UniversidadDireccion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `UniversidadIniciales` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `UniversidadTipo` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  `UniversidadPais` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `UniversidadEstado` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `UniversidadCiudad` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `universidad`
--

INSERT INTO `universidad` (`id`, `UniversidadCodigo`, `UniversidadNombre`, `UniversidadTelefono`, `UniversidadDireccion`, `UniversidadIniciales`, `UniversidadTipo`, `UniversidadPais`, `UniversidadEstado`, `UniversidadCiudad`) VALUES
(12, 'UV97784701', 'universidad autonoma de ciudad juarez', '6561000000', 'av del charro', 'uacj', 'Publica', 'mexico', 'chihuahua', 'ciudad juarez'),
(13, 'UV92121712', 'Universidad Cultural', '6566666666', 'Simona Barba', 'UC', 'Privada', 'Mexico', 'Chihuahua', 'Ciudad Juarez'),
(14, 'UV92210553', 'Instituto Tecnologico de Ciudad Juarez', '6561000000', 'Av Tecnologico', 'ITCJ', 'Publica', 'Mexico', 'Chihuahua', 'Ciudad Juarez'),
(16, 'UV18257634', 'asdasda', '1231312333', 'sadasd', 'asd', 'Publica', 'asdasd', 'adadas', 'asdasd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CuentaCodigo` (`CuentaCodigo`);

--
-- Indexes for table `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CuentaCodigo` (`AlumnoCodigo`);

--
-- Indexes for table `alumnomaterias`
--
ALTER TABLE `alumnomaterias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CuentaCodigo` (`CuentaCodigo`);

--
-- Indexes for table `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `CarreraCodigo` (`CarreraCodigo`);

--
-- Indexes for table `carrerauacj`
--
ALTER TABLE `carrerauacj`
  ADD PRIMARY KEY (`CarreraCodigo`) USING BTREE;

--
-- Indexes for table `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CuentaCodigo` (`CuentaCodigo`);

--
-- Indexes for table `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`MateriaCodigo`) USING BTREE;

--
-- Indexes for table `materiauacj`
--
ALTER TABLE `materiauacj`
  ADD PRIMARY KEY (`MateriaUacjClave`);

--
-- Indexes for table `universidad`
--
ALTER TABLE `universidad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UniversidadCodigo` (`UniversidadCodigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `alumnomaterias`
--
ALTER TABLE `alumnomaterias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `universidad`
--
ALTER TABLE `universidad`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
