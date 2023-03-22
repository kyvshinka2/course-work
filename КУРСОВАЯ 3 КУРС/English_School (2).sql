-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 22 2023 г., 11:14
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `English_School`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Class`
--

CREATE TABLE `Class` (
  `ID` int NOT NULL,
  `ID student` int NOT NULL,
  `ID teacher` int NOT NULL,
  `Date` date NOT NULL,
  `Type of activity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Class`
--

INSERT INTO `Class` (`ID`, `ID student`, `ID teacher`, `Date`, `Type of activity`) VALUES
(1, 1, 1, '2023-04-20', 'Индивидуальное'),
(2, 2, 2, '2027-03-20', 'Индивидуальное');

-- --------------------------------------------------------

--
-- Структура таблицы `Product`
--

CREATE TABLE `Product` (
  `ID` int NOT NULL,
  `Name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Content` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Product`
--

INSERT INTO `Product` (`ID`, `Name`, `Content`) VALUES
(1, 'Курс по английскому за 3 месяца', 'Ускоренный курс для вспоминания всех правил'),
(2, 'Словарь 2000 слов', 'Карманный словарь на все случаи жизни');

-- --------------------------------------------------------

--
-- Структура таблицы `Product type`
--

CREATE TABLE `Product type` (
  `ID` int NOT NULL,
  `ID product` int NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Product type`
--

INSERT INTO `Product type` (`ID`, `ID product`, `Type`) VALUES
(1, 1, 'Видео-курс'),
(2, 2, 'Книга');

-- --------------------------------------------------------

--
-- Структура таблицы `Purchase history`
--

CREATE TABLE `Purchase history` (
  `ID` int NOT NULL,
  `ID product` int NOT NULL,
  `ID student` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Purchase history`
--

INSERT INTO `Purchase history` (`ID`, `ID product`, `ID student`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Student`
--

CREATE TABLE `Student` (
  `ID` int NOT NULL,
  `Full name` varchar(60) NOT NULL,
  `Card` int NOT NULL,
  `log in` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Student`
--

INSERT INTO `Student` (`ID`, `Full name`, `Card`, `log in`, `password`) VALUES
(1, 'Томашевский Владислав Янович', 542897643, 'toma123', '12345'),
(2, 'Вильгаук Анастасия Андреевна', 925864378, 'nastia123', '12345');

-- --------------------------------------------------------

--
-- Структура таблицы `Teacher`
--

CREATE TABLE `Teacher` (
  `ID` int NOT NULL,
  `Full name` varchar(60) NOT NULL,
  `Diploma` varchar(40) NOT NULL,
  `number` int NOT NULL,
  `address` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Teacher`
--

INSERT INTO `Teacher` (`ID`, `Full name`, `Diploma`, `number`, `address`) VALUES
(1, 'Слободюк Ирина Владимирова', 'ГБПОУ \"ЮУМК\" - 1995г', 89063467, 'г. Челябинск, ул. Октябрская, д. 15'),
(2, 'Крэнч Мария Олеговна', 'ЧЕлГУ - Ин.Яз', 8895764, 'г. Владивосток, ул. Венерская, д.15');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID student` (`ID student`),
  ADD KEY `ID teacher` (`ID teacher`);

--
-- Индексы таблицы `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Product type`
--
ALTER TABLE `Product type`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID product` (`ID product`);

--
-- Индексы таблицы `Purchase history`
--
ALTER TABLE `Purchase history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID product` (`ID product`),
  ADD KEY `ID student` (`ID student`);

--
-- Индексы таблицы `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Teacher`
--
ALTER TABLE `Teacher`
  ADD PRIMARY KEY (`ID`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Class`
--
ALTER TABLE `Class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`ID student`) REFERENCES `Student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`ID teacher`) REFERENCES `Teacher` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Product type`
--
ALTER TABLE `Product type`
  ADD CONSTRAINT `product type_ibfk_1` FOREIGN KEY (`ID product`) REFERENCES `Product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Purchase history`
--
ALTER TABLE `Purchase history`
  ADD CONSTRAINT `purchase history_ibfk_1` FOREIGN KEY (`ID product`) REFERENCES `Product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `purchase history_ibfk_2` FOREIGN KEY (`ID student`) REFERENCES `Student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
