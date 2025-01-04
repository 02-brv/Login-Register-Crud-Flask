-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jan 2025 pada 16.43
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datauser`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`id`, `username`, `email`, `password`, `role`) VALUES
(23, 'admin', 'admin@gmail.com', 'scrypt:32768:8:1$jNM6UUGTVZLGIVkR$05d44e2be1dd511c098e4eccaf75288c6b483cecea49445b6da2bdfd364e7d028dccf0978cce0e2492e832052654c4d35e3d126d42cae64f62b45c610afdf4c3', 'Data scientist'),
(25, 'asd', 'asd@gmail.com', 'scrypt:32768:8:1$7lBHsZgts2IwK5au$bb7164e5534688f4d4e8d6630d5efba56f610720be6df164351b946cc7a16416c48523a7b1a7452f5060783292228f85b418dc735f0adf7ed8e882451dace03e', 'Web developer'),
(26, 'gung', 'gung@gmail.com', 'scrypt:32768:8:1$F3Lqw7LaSEgH6rtN$45108a38982ec77ac0dc6d4f6e104ad69ce379f0f08a6029b056af9d1aa89b1b1892b7ada40e97e59f24ce0e7196eae8a881a57aba7b4957e783e001fc2020d2', 'Game developer'),
(27, 'bara', 'barafitradestanta@gmail.com', 'scrypt:32768:8:1$gCc6nbqZnkAqZWu0$47057bde6ccc5fca1c0fd7f9ec9c2ea45aea342c6341be7690f3e55f8612d3f8e245414d5d2223f1486872af6a3e4875af689bd619b1f53fbbd7a28c1f782603', 'Cyber security analyst'),
(28, 'barv-02', 'destantabaravitra@gmail.com', 'scrypt:32768:8:1$Cwb3mAXg2jVqexAo$eb8cef70f66feec9f5ebe9b9d87fe609b3c670e76c0b25c402c24d93a0cc0a824a6c9cbbfbac7f7911d7d84f467d0fe20287609e1755792b545132a4e10730a9', 'Web developer'),
(29, 'arsa', 'arsa@gmai.com', 'scrypt:32768:8:1$ZQSMJWEUcDW7QxyR$2591fd36ee1876977a4bcbf412dba5cb60e04df72d6c07f6ed12535f3580cebd41381cf4e0ec5a9cd9211cd9b75b90e2ada9f197c8000242c5efc42088f07ec0', 'Web developer'),
(30, 'amikul', 'kul@gmail.com', 'scrypt:32768:8:1$d5Skx1tgeuBUExbG$3ba183adb72c0060b9f08b092eec1879f2c34da0c91adb287dd192f98117c746043d719adeeb3885cf0a64543ef588032c3b9e97d756d605806de39e37a19847', 'Web developer'),
(31, 'erwin', 'erwin@gmail.com', 'scrypt:32768:8:1$ZRv2kAJgRYrjDO3P$ad888bfabb8b7715c9a740960325b12a4843c763896f4f861586875e65503e634159beffce725697a309ac4108c7dfece5feda987422d50285a39a7151520462', 'Web developer'),
(32, 'farhan', 'farhan@gmail.com', 'scrypt:32768:8:1$mcrifj22LQLcl2sw$347f457e590f933b59badb2178f4f35379140d0ad8a10f989f9d2c2ff930b76dcc765d8948d4dc2167d523a8e7de5b2b0c6583445e055bba68a9d85a54766d65', 'Cyber security analyst'),
(33, 'yolan', 'yolan@gmail.com', 'scrypt:32768:8:1$12CKAXKAsGYKIBSl$d70289fecaf3f9d37578ec15c0a3ccf5fa58ffe5f4407690e74d8aecaf73030755ac5ddfad20b4823c81fda303185a93f14bb21771099560e3c86e2b6fe1ed60', 'Cyber security analyst'),
(34, 'vera', 'vera@gmail.com', 'scrypt:32768:8:1$VdBeTbApSZbYVvfI$9a20f26493c7319196b1f7e2d9d5afaf9ffb2aaf95b0920c4fb7e988297bc34b9c7f7d9a9949380b48350120b103e20a037b8f040006371ee0eeb7fee4b20dfe', 'Web developer'),
(35, 'andika', 'dik@gmail.com', 'scrypt:32768:8:1$tN0vzODIIVZXhgMX$f23edfedaed15ebb168ae9c9a5ed053549c318f047c44217c4115b80c187b26010a07fc85126c9fe6a765ee69841101e4bb045f15c1d89fc542ce665e464c625', 'Cyber security analyst'),
(36, 'gasbagas', 'bagas@gmail.com', 'scrypt:32768:8:1$zlmzYzL6bSRWi1Id$b7bdc7ea139167da128635e2ba060ed55c628217aea17568cddded58b9636a28301e093274bfe8822c3ef90ff44fb4364f53f501e1f8c7d65e021d7f5afc5a46', 'Cyber security analyst'),
(37, 'user', 'user@gmail.com', 'scrypt:32768:8:1$oLk0vFY3KKE8ufot$cf7b255260bb9209bea221527c1d8a21db06c9c7854dc54ea55188ab3fc65d8e3fb0a02cb2acf8b0f8d646090174b8cccbf1957ed051cfb7958fe059c5dae590', 'Web developer');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
