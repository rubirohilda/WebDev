-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2018 at 07:20 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myrecipes`
--

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `favourite_id` int(10) NOT NULL,
  `favourite_rating` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`favourite_id`, `favourite_rating`) VALUES
(1, 'one'),
(2, 'two'),
(3, 'three'),
(4, 'four'),
(5, 'five');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ingredient_id` int(10) NOT NULL,
  `recipe_id` int(10) NOT NULL,
  `ingredient_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `recipe_id` int(10) NOT NULL,
  `recipe_name` varchar(40) NOT NULL,
  `sub_categoryId` int(10) NOT NULL,
  `favourite_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recipe_category`
--

CREATE TABLE `recipe_category` (
  `category_id` int(10) NOT NULL,
  `category_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe_category`
--

INSERT INTO `recipe_category` (`category_id`, `category_name`) VALUES
(1, 'Cuisine'),
(2, 'Event'),
(3, 'Preparation Method'),
(4, 'Ingredient type'),
(5, 'Meal Time'),
(6, 'Meal Type');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_subcategory`
--

CREATE TABLE `recipe_subcategory` (
  `sub_categoryId` int(10) NOT NULL,
  `sub_category_name` varchar(40) NOT NULL,
  `category_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe_subcategory`
--

INSERT INTO `recipe_subcategory` (`sub_categoryId`, `sub_category_name`, `category_id`) VALUES
(1, 'Breakfast', 5),
(2, 'Lunch', 5),
(3, 'Dinner', 5),
(4, 'Baking', 3),
(5, 'Grilling', 3),
(6, 'African', 1),
(7, 'West-European', 1),
(8, 'Asian', 1),
(9, 'Graduation', 2),
(10, 'Special Party', 2),
(11, 'Appetizer', 6),
(12, 'Main Dish', 6),
(13, 'Dessert', 6),
(14, 'Beef', 4),
(15, 'Chicken', 4),
(16, 'Beverage', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `userPassword` varchar(10) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_comment`
--

CREATE TABLE `user_comment` (
  `comment_id` int(10) NOT NULL,
  `recipe_id` int(10) NOT NULL,
  `comment_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`favourite_id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ingredient_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe_id`),
  ADD KEY `sub_categoryId` (`sub_categoryId`),
  ADD KEY `favourite_id` (`favourite_id`);

--
-- Indexes for table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `recipe_subcategory`
--
ALTER TABLE `recipe_subcategory`
  ADD PRIMARY KEY (`sub_categoryId`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_comment`
--
ALTER TABLE `user_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `favourite_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `ingredient_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipe_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipe_category`
--
ALTER TABLE `recipe_category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recipe_subcategory`
--
ALTER TABLE `recipe_subcategory`
  MODIFY `sub_categoryId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_comment`
--
ALTER TABLE `user_comment`
  MODIFY `comment_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`sub_categoryId`) REFERENCES `recipe_subcategory` (`sub_categoryId`),
  ADD CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`favourite_id`) REFERENCES `favourite` (`favourite_id`);

--
-- Constraints for table `recipe_subcategory`
--
ALTER TABLE `recipe_subcategory`
  ADD CONSTRAINT `recipe_subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `recipe_category` (`category_id`);

--
-- Constraints for table `user_comment`
--
ALTER TABLE `user_comment`
  ADD CONSTRAINT `user_comment_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
