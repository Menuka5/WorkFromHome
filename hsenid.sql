-- phpMyAdmin SQL Dump
-- version 4.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2016 at 04:32 PM
-- Server version: 5.6.30-0ubuntu0.15.10.1
-- PHP Version: 5.6.11-1ubuntu3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hsenid`
--

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `dob` date NOT NULL,
  `country` enum('Sri Lanka','Japan','United Kingdom','United States','Australia') NOT NULL,
  `email` varchar(100) NOT NULL,
  `mnumber` bigint(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`fname`, `lname`, `dob`, `country`, `email`, `mnumber`, `username`, `password`) VALUES
('batman', 'bruce', '1991-03-16', 'United States', 'menuka@gmail.com', 94716310375, 'batman', '5c6d9edc3a951cda763f650235cfc41a3fc23fe8'),
('huhhh', 'fhf', '1991-07-11', 'United Kingdom', 'menuka@gmail.com', 94716310375, 'grs', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
('help', 'help', '1111-03-08', 'United States', 'meefgartqtnuka@gmail.com', 94713314375, 'help', '92005ecf3788faea8346a7919fba0232188561ab'),
('hulk', '', '1990-04-13', 'Japan', 'dsfsafsdfa@gmail.com', 94716710375, 'hulk', 'c829575cb9bdd27191cb3377c4f2e1794d6dd236'),
('testlast', '', '1994-07-07', 'Sri Lanka', 'menuka@gmail.com', 94716310375, 'nbvnbv', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
('superman', 'Kent', '1989-03-23', 'Sri Lanka', 'gfsdgdsg@gmail.com', 94719910375, 'superman', '18c28604dd31094a8d69dae60f1bcd347f1afc5a'),
('Menuka', 'Ishan', '2016-04-12', 'Sri Lanka', 'menuka@gmail.com', 947166423, 'test', '7288edd0fc3ffcbe93a0cf06e3568e28521687bc'),
('testeeee', 'ddfg', '1991-03-16', 'Sri Lanka', 'menuka@gmail.com', 94716310375, 'test1', 'aaa'),
('hello', 'hiu', '1991-03-16', 'Sri Lanka', 'mgbdfsggenuka@gmail.com', 94716310375, 'test122', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
('Test SHA', 'SHAAA', '1991-03-16', 'United States', 'menmvbmnuka@gmail.com', 94716310375, 'test2', '7e240de74fb1ed08fa08d38063f6a6a91462a815'),
('test date', 'thada', '1995-07-06', 'Australia', 'menuka@gmail.com', 94716310375, 'tttyyyywfgd', '186154712b2d5f6791d85b9a0987b98fa231779c');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('test', '7288edd0fc3ffcbe93a0cf06e3568e28521687bc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
