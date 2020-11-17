-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 17 2020 г., 18:47
-- Версия сервера: 5.5.25
-- Версия PHP: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `hornsandhooves`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `CatID` int(11) NOT NULL AUTO_INCREMENT,
  `CatName` varchar(100) NOT NULL,
  PRIMARY KEY (`CatID`),
  KEY `CatName` (`CatName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`) VALUES
(1, 'Category A'),
(2, 'Category B'),
(3, 'Category C'),
(4, 'Category D');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `ClientID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(40) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  PRIMARY KEY (`ClientID`),
  KEY `LastName` (`LastName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`ClientID`, `FirstName`, `LastName`, `Phone`) VALUES
(1, 'James', 'Bond', '123-45-67'),
(2, 'Peter', 'Parker', '321-54-76'),
(3, 'Harry', 'Potter', '147-25-36'),
(4, 'Sheldon', 'Cooper', '745-85-96');

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(100) NOT NULL,
  `Price` int(11) DEFAULT NULL,
  `Info` varchar(255) DEFAULT NULL,
  `CatID` int(11) NOT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `ItemName` (`ItemName`,`CatID`),
  KEY `CatID` (`CatID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`ItemID`, `ItemName`, `Price`, `Info`, `CatID`) VALUES
(1, 'Item A', 25, 'something interesting', 1),
(2, 'Item B', 5, 'something interesting', 2),
(3, 'Item C', 123, 'something interesting', 1),
(4, 'Item D', 456, 'something interesting', 4),
(5, 'Item E', 78, 'something interesting', 3),
(6, 'Item F', 97, 'something interesting', 3),
(7, 'Item G', 321, 'something interesting', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `ItemID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ItmQnt` int(11) NOT NULL,
  PRIMARY KEY (`ItemID`,`OrderID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orderdetails`
--

INSERT INTO `orderdetails` (`ItemID`, `OrderID`, `ItmQnt`) VALUES
(1, 2, 3),
(1, 4, 2),
(3, 1, 1),
(3, 6, 10),
(5, 1, 1),
(5, 3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `Info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `ClientId` (`ClientId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`OrderID`, `ClientId`, `OrderDate`, `Info`) VALUES
(1, 1, '2020-11-17', 'some info'),
(2, 2, '2020-11-16', 'some info'),
(3, 3, '2020-11-15', 'some info'),
(4, 4, '2020-11-17', 'some info'),
(5, 1, '2020-11-17', 'some info'),
(6, 3, '2020-11-17', 'some info');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`CatID`) REFERENCES `categories` (`CatID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`ClientID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
