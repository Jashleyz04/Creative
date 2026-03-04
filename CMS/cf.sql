--
-- Database: `phpbook-1`
-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`,`title`,`summary`,`content`,`created`,`category_id`,`member_id`,`image_id`,`published`) VALUES
(1,'Pokemon TCG Overview','Introduction to the Pokemon Trading Card Game','The Pokemon Trading Card Game is one of the most popular collectible card games worldwide. Players build decks around Pokemon creatures, energy cards, and trainers to battle opponents strategically. The game combines accessibility for beginners with deep competitive mechanics that reward planning and resource management.','2023-01-10 10:00:00',1,1,1,1),
(2,'Charizard Through the Years','Evolution of Charizard cards','Charizard has remained one of the most iconic cards in the Pokemon TCG. From the original Base Set holographic version to modern competitive variants, Charizard cards represent both nostalgia and competitive power within the community.','2023-01-12 11:00:00',1,2,2,1),
(3,'Yu-Gi-Oh Duel Mechanics','How modern dueling works','Yu-Gi-Oh features fast paced gameplay built around summoning monsters, activating spells, and setting traps. Modern formats emphasize combo sequencing and timing, making understanding chain resolution essential for competitive play.','2023-01-14 09:30:00',2,1,3,1),
(4,'Blue Eyes White Dragon Legacy','History of a legendary monster','Blue Eyes White Dragon has symbolized power since the early anime era. Its high attack value and cultural significance made it one of the most recognized cards in trading card history.','2023-01-16 14:00:00',2,3,4,1),
(5,'Magic The Gathering Basics','Learning the fundamentals of MTG','Magic The Gathering introduced many mechanics now standard in card games including mana systems, color identities, and stack interactions. Players construct decks using lands and spells to outmaneuver opponents strategically.','2023-01-18 16:00:00',3,2,5,1),
(6,'Commander Format Explained','Why Commander is so popular','Commander is a multiplayer Magic format focused on creativity and social gameplay. Each deck revolves around a legendary creature and singleton deck construction encourages variety and expression.','2023-01-20 18:30:00',3,1,6,1),
(7,'Digimon Card Game Revival','Return of Digimon in TCG form','The modern Digimon Card Game revitalized the franchise with innovative mechanics like memory gauges and evolving stacks, creating dynamic matches emphasizing tempo control.','2023-01-22 13:10:00',4,4,7,1),
(8,'Digivolution Strategy','Building evolving stacks','Digivolution allows players to layer cards into powerful forms while drawing additional resources. Managing evolution timing is key to maintaining advantage.','2023-01-23 10:45:00',4,2,8,1),
(9,'One Piece Card Game Rise','A new challenger in TCG space','The One Piece Card Game quickly gained popularity due to recognizable characters and leader based gameplay systems that reward aggressive and tactical decision making.','2023-01-25 15:22:00',5,3,9,1),
(10,'Straw Hat Deck Strategy','Aggressive playstyle analysis','Straw Hat leader decks emphasize tempo and board presence using character synergy to overwhelm opponents early in matches.','2023-01-27 12:05:00',5,1,10,1),
(11,'Pokemon Competitive Formats','Standard versus Expanded','Pokemon TCG competitive play includes multiple formats that determine which sets are legal. Standard format encourages fresh strategies while Expanded allows broader deck creativity.','2023-01-29 09:15:00',1,4,11,1),
(12,'Yu-Gi-Oh Tournament Scene','Understanding competitive events','Yu-Gi-Oh tournaments range from local events to world championships. Competitive players must master deck consistency and side deck strategies.','2023-02-01 17:00:00',2,3,12,1),
(13,'Planeswalkers Explained','Key MTG card type overview','Planeswalkers represent powerful allies that provide repeatable effects each turn. Properly protecting them often determines match outcomes.','2023-02-03 13:40:00',3,2,13,1),
(14,'Digimon Memory Gauge Guide','Controlling turn advantage','The memory gauge determines turn control in the Digimon Card Game. Skilled players manipulate memory values to extend turns and deny opponent momentum.','2023-02-05 08:20:00',4,1,14,1),
(15,'One Piece Leaders Guide','Choosing the right leader','Leaders define deck identity in the One Piece TCG. Each leader ability shapes strategy, encouraging specialized builds.','2023-02-07 20:00:00',5,4,15,1),
(16,'Rare Card Collecting','Investment side of TCGs','Collectors seek rare prints, alternate art cards, and limited releases. Condition grading significantly affects card value and long term investment potential.','2023-02-09 11:11:00',1,2,16,1),
(17,'Deck Building Fundamentals','Balancing consistency and power','Effective decks balance resource generation, win conditions, and defensive options. Testing and iteration remain critical to success.','2023-02-11 14:55:00',3,1,17,1),
(18,'TCG Tournament Preparation','How players prepare for events','Preparation includes matchup testing, sideboard planning, and understanding tournament rules to avoid penalties during competitive play.','2023-02-13 10:30:00',2,4,18,1),
(19,'Artwork in Trading Cards','Visual identity of TCGs','Illustrations contribute significantly to a card’s appeal. Artists help define each franchise aesthetic while enhancing immersion.','2023-02-15 09:00:00',1,3,19,1),
(20,'Future of Trading Card Games','Digital and physical balance','Modern TCGs integrate online platforms alongside physical cards, expanding accessibility while preserving traditional gameplay experiences.','2023-02-17 16:45:00',5,2,20,1),
(21,'Pokemon Energy Management','Optimizing energy attachments','Managing energy efficiently determines pacing in Pokemon matches and enables powerful attacks earlier.','2023-02-19 12:12:00',1,1,21,1),
(22,'Yu-Gi-Oh Combo Decks','Understanding combo sequencing','Combo decks rely on chaining multiple effects to build overwhelming boards within a single turn.','2023-02-21 18:18:00',2,3,22,1),
(23,'Magic Draft Format','Limited play explained','Draft formats require players to build decks from packs during events, emphasizing adaptability and card evaluation skills.','2023-02-23 09:45:00',3,4,23,1),
(24,'One Piece Tournament Meta','Current competitive trends','Competitive metas shift as new sets release, forcing players to adapt strategies and counter dominant decks.','2023-02-25 20:10:00',5,2,24,1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `navigation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`,`name`,`description`,`navigation`) VALUES
(1,'Pokemon TCG','Articles about the Pokemon Trading Card Game',1),
(2,'Yu-Gi-Oh!','Strategies and history of Yu-Gi-Oh',1),
(3,'Magic: The Gathering','Content focused on Magic gameplay and formats',1),
(4,'Digimon Card Game','Guides and analysis of Digimon TCG',1),
(5,'One Piece Card Game','News and strategies for One Piece TCG',1);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `file` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`,`file`,`alt`) VALUES
(1,'pokemon-logo.png','Pokemon TCG official logo'),
(2,'charizard-card.avif','Classic Charizard holographic card'),
(3,'yugioh-duel.png','Yu-Gi-Oh duel in progress'),
(4,'blue-eyes-dragon.jpg','Blue Eyes White Dragon card artwork'),
(5,'mtg-cards.webp','Magic The Gathering cards spread'),
(6,'commander-table.jpeg','Commander multiplayer game setup'),
(7,'digimon-battle.jpg','Digimon card battle scene'),
(8,'digivolution-stack.jpg','Digivolution card stack example'),
(9,'one-piece-logo.png','One Piece Card Game logo'),
(10,'straw-hat-deck.jpg','Straw Hat themed deck cards'),
(11,'pokemon-tournament.jpg','Pokemon tournament gameplay'),
(12,'yugioh-event.jpg','Yu-Gi-Oh competitive event'),
(13,'planeswalker-card.jpg','Magic planeswalker card art'),
(14,'memory-gauge.jpg','Digimon memory gauge board'),
(15,'one-piece-leader.jpg','One Piece leader card'),
(16,'rare-cards.jpg','Collection of rare trading cards'),
(17,'deck-building.jpg','Deck construction process'),
(18,'tcg-tournament.jpg','Players competing in tournament'),
(19,'tcg-artwork.jpg','Illustrated trading card artwork'),
(20,'tcg-future.avif','Modern trading card game display'),
(21,'pokemon-energy.jpg','Pokemon energy cards'),
(22,'yugioh-combo.jpg','Yu-Gi-Oh combo board state'),
(23,'mtg-draft.jpg','Magic draft event table'),
(24,'one-piece-meta.jpg','Competitive One Piece match');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `forename` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`,`forename`,`surname`,`email`,`password`,`joined`,`picture`) VALUES
(1,'Alex','Carter','alex@tcgpress.com','ab12-cd34-ef56-gh78','2023-01-01 09:00:00','alex.jpg'),
(2,'Mina','Lopez','mina@tcgpress.com','jk12-lm34-no56-pq78','2023-01-02 10:30:00','mina.jpg'),
(3,'Kenji','Tanaka','kenji@tcgpress.com','rs12-tu34-vw56-xy78','2023-01-03 11:45:00','kenji.jpg'),
(4,'Rafael','Santos','rafael@tcgpress.com','za12-bc34-de56-fg78','2023-01-04 14:20:00',NULL);

--
-- Indexes for dumped tables
--

ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`member_id`),
  ADD KEY `image_id` (`image_id`);

ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

ALTER TABLE `article`
  ADD CONSTRAINT `category_exists` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `image_exists` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `member_exists` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);