-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Мар 17 2018 г., 20:06
-- Версия сервера: 10.1.26-MariaDB
-- Версия PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Lesson-14`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `parent_id`, `title`, `description`, `sort`, `created_at`, `updated_at`) VALUES
(1, 0, 'Books', 'Books category description', 1, '2018-03-16 17:21:47', '2018-03-16 19:21:47'),
(2, 1, 'Programming languages', 'Programming languages category description text', 1, '2018-03-16 17:21:47', '2018-03-16 19:21:47'),
(3, 0, 'CD/DVD', 'A lot of different digital information on CD/DVD', 2, '2018-03-16 17:24:30', '2018-03-16 19:24:30'),
(6, 3, 'DVD ', 'DVD disks', 1, '2018-03-17 17:43:13', '2018-03-17 19:43:13'),
(8, 3, 'CD', 'CD disks', 1, '2018-03-17 17:44:32', '2018-03-17 19:44:32'),
(10, 0, 'Furniture', 'Different home furniture', 1, '2018-03-17 17:51:54', '2018-03-17 19:51:54'),
(12, 10, 'Chair', 'Soft chair', 3, '2018-03-17 17:53:36', '2018-03-17 19:53:36'),
(13, 10, 'Table', 'Kitchen table', 2, '2018-03-17 17:53:36', '2018-03-17 19:53:36');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `total` decimal(16,4) NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `total`, `status`, `added_date`) VALUES
(1, '25.2000', 'in progress', '2018-03-13 18:55:51'),
(2, '36.0000', 'done', '2018-03-13 18:55:51'),
(3, '98.0000', 'в работе', '2018-03-13 18:59:06'),
(4, '3.5000', 'done', '2018-03-17 16:57:18'),
(5, '4.0000', 'available', '2018-03-17 16:57:18'),
(6, '3.5000', 'done', '2018-03-17 16:57:27'),
(7, '4.0000', 'available', '2018-03-17 16:57:27'),
(8, '30.0000', 'in progress', '2018-03-17 16:57:58'),
(9, '7.0000', 'available', '2018-03-17 16:57:58'),
(10, '30.0000', 'in progress', '2018-03-17 16:58:04'),
(11, '7.0000', 'available', '2018-03-17 16:58:04'),
(12, '25.2000', 'sold', '2018-03-17 16:58:15'),
(13, '25.2000', 'sold', '2018-03-17 16:58:18');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(16,4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(16,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `price`, `quantity`, `subtotal`) VALUES
(2, 2, 155, '625.2000', 3, '1875.6000'),
(3, 1, 9, '4.0000', 2, '8.0000'),
(4, 3, 7, '2.0000', 7, '14.0000'),
(5, 11, 2, '3.0000', 2, '6.0000'),
(6, 10, 5, '7.0000', 2, '14.0000'),
(7, 11, 4, '12.0000', 1, '12.0000'),
(8, 6, 8, '7.0000', 2, '14.0000'),
(9, 11, 4, '12.0000', 1, '12.0000'),
(10, 6, 8, '7.0000', 2, '14.0000'),
(11, 1, 9, '6.0000', 7, '42.0000'),
(12, 2, 6, '3.0000', 2, '6.0000'),
(13, 1, 9, '6.0000', 7, '42.0000'),
(14, 2, 6, '3.0000', 2, '6.0000');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(11,4) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Products table';

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `published`, `created_at`, `updated_at`) VALUES
(1, 'PHP Objects, Patterns, and Practice', 'PHP Objects, Patterns, and Practice is designed to help readers develop elegant and rock-solid systems through mastery of three key elements: object fundamentals, design principles, and development best practice. Authors: Zandstra, Matt', '1177.7700', 1, '2018-03-16 17:32:26', '2018-03-16 19:32:26'),
(2, 'PHP 7', 'Рассмотрены основы языка PHP и его рабочего окружения в Windows, Mac OS X и Linux.Отражены радикальные изменения в языке PHP, произошедшие с момента выхода предыдущего издания: трейты, пространство имен, анонимные функции, замыкания, элементы строгой типизации, генераторы, встроенный Web-сервер и многие другие возможности. Приведено описание синтаксиса PHP 7, а также функций для работы с массивами, файлами, СУБД MySQL, memcached, регулярными выражениями, графическими примитивами, почтой, сессиями и т. д. Авторы	Дмитрий Котеров, Игорь Симдянов', '331.2000', 1, '2018-03-16 17:45:11', '2018-03-16 19:45:11'),
(3, 'Збірка: Кращі пісні української естради XX сторіччя. Частина 1', 'Стиль:	Вокальная музыка, Современный инструментальный, Традиционный фолк, Поп-эстрада Исполнитель:	Ансамбль \"Мрія\", Лидия Видаш, Микола Кондратюк, Олександр Таранець, Олександр Трофимчук, Дмитрий Гнатюк, Государственная заслуженная капелла бандуристов Украины, Трио \"Маренич\", Тарас Петриненко, Алла Кудлай, Назарий Яремчук, Владимир Ивасюк, Людмила Маковецкая, Лилия Сандулеса, Андрей Кондратюк, Василий Михайлюк, Василий Марсюк, Женский вокальный квартет Скорика, Вокально-инструментальный ансамбль \"Кобза\", Вокально-инструментальный ансамбль \"Смерічка\", Ансамбль Рязанцева, Іво Бобул', '60.0000', 1, '2018-03-16 17:49:39', '2018-03-16 19:49:39'),
(4, 'Вбивство у «Східному експресі»', '«Вбивство у “Східному експресі”» – одна із найвідоміших детективних історій Аґати Крісті, що неодноразово втілювалась на екранах. Нова прем’єра — вже у листопаді 2017 року!\r\n', '82.0000', 1, '2018-03-17 17:01:35', '2018-03-17 19:01:35'),
(6, 'Аномальная зона', 'После Чернобыльской аварии почти всех жителей села Подлесное, что в Житомирской области, в экстренном порядке переселили: здесь творились странные дела… Люди пропадали и, если возвращались, то не помнили ни минуты с того момента, как их поглотила аномальная зона…', '83.0000', 1, '2018-03-17 17:04:28', '2018-03-17 19:04:28'),
(7, 'Великий замисел', 'Книжка написана живою мовою й розрахована на широке коло читачів без академічних знань з фізики. Це історія Всесвіту, в контексті якої автори спростовують традиційну теорію його появи, по-новому осмислюють теорію Великого вибуху та заперечують думку про те, що Земля — єдина планета, на якій є життя. Що, як окрім нашої галактики та всесвіту існує безліч інших унікальних космічних об’єктів? ', '206.3000', 1, '2018-03-17 17:04:28', '2018-03-17 19:04:28'),
(8, 'Таємниці походження всесвіту', 'Як виник Всесвіт? І як з’явилася наша реальність? І чому ми взагалі існуємо? Лоуренс Крайс запрошує вас у захопливу подорож, щоб дізнатися відповіді на ці та інші питання. В цій книзі він доступною мовою розповідає про фізику та її витоки, наукові дослідження появи Всесвіту, ділиться історіями з життя видатних науковців минулого та сучасності, їхніми досягненнями та відкриттями. Ніяких нудних термінів та незрозумілих формул. Книжка, яка розкриє всі таємниці походження Всесвіту.\r\n', '143.8000', 1, '2018-03-17 17:07:02', '2018-03-17 19:07:02'),
(9, 'English. Усі розмовні теми', 'У посібнику викладено всі розмовні теми, що вивчаються у школі та входять до випускних і вступних іспитів', '137.4000', 1, '2018-03-17 17:07:02', '2018-03-17 19:07:02'),
(10, 'Легенды Русского Рока выпуск 2', 'ЛЕГЕНДЫ РУССКОГО РОКА - выпуск 2\r\n6CD BOX SET \r\n1997, 6 GOLD CD, Made in Austria, состояние коллекционное, практически идеальное, оригинал.', '6000.0000', 1, '2018-03-17 18:00:42', '2018-03-17 20:00:42'),
(11, 'DVD \"Трое из Простоквашино\" сборник мультфильмов', 'DVD \"Трое из Простоквашино\" сборник мультфильмов, полная реставрация изображения и звука, состояние новое, в упаковке!', '150.0000', 1, '2018-03-17 18:00:42', '2018-03-17 20:00:42'),
(14, 'Кресло-груша', '* Размер кресла XL: 130x90 см\r\n* Ткань:Плащевка, Оксфорд,Оксфорд полиуретан(водоотталкивающая,грязеустойчивая,более износостойкая ткань,стрейчевая ткань(мебельная)\r\n* Наполнитель: гранула пенополистирола (цельные шарики). фракция 2-5 мм. ( Мы не используем дробленный пенопласт ( отходы)\r\n* Имеется съемный чехол . Возможность стирать\r\n* Ручка для переноса \r\nЕсть ОПТ,сотрудничаем с барами,кофейнями,кальянными,ресторанами.\r\nЕсть Viber, Telegram,пишите,звоните в любое время,всегда будем рады помочь в выборе кресла!', '690.0000', 1, '2018-03-17 18:03:16', '2018-03-17 20:03:16'),
(18, 'Стол из спила столетнего дуба', 'Стол из натурального дерева с  четырьмя регулируемыми металлическими ногами. Высота стола 60 см (600 мм) - столешница 10 см и ноги 50 см.\r\n\r\nСтолешница: спил дуба (возраст более 100 лет) толщиной 10 см (100 мм);\r\n\r\nразмер столешницы:\r\n\r\n - 91 см на 58 см (910х580 мм)\r\n\r\nвес столешницы:\r\n\r\n - около 29 кг у стола на четырех ногах;\r\n\r\nкрупные трещины залиты прозрачной эпоксидной смолой, дерево отшлифовано и покрыто натуральным льняным маслом с воском (блестит как лакированное, но это не лак).\r\n\r\nНоги:  четыре регулируемые съемные (вывинчиваются из крепежа) металлические ноги диаметром 65 мм и высотой 500 мм (+ регулировка); покрытие ног матовое; цвет \"сатин\".\r\n\r\nПрекрасно подойдет для интерьера в стиле кантри, шале, лофт. ', '5100.0000', 1, '2018-03-17 18:03:20', '2018-03-17 20:03:20');

-- --------------------------------------------------------

--
-- Структура таблицы `product_category`
--

CREATE TABLE `product_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `product_category`
--

INSERT INTO `product_category` (`product_id`, `category_id`, `created_at`) VALUES
(1, 1, '2018-03-16 17:35:05'),
(1, 2, '2018-03-16 17:35:05'),
(2, 1, '2018-03-16 17:45:24'),
(2, 2, '2018-03-16 17:45:24'),
(3, 3, '2018-03-16 17:50:19'),
(6, 1, '2018-03-17 17:55:41'),
(9, 1, '2018-03-17 17:55:41'),
(11, 3, '2018-03-17 18:05:03'),
(14, 10, '2018-03-17 18:05:03');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `fk_cat_id1` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fk_cat_id1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prod_id1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
