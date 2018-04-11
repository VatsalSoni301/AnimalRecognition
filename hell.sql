-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: animal_recognition
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal` (
  `animal_id` int(11) NOT NULL AUTO_INCREMENT,
  `animal_name` varchar(100) DEFAULT NULL,
  `animal_information` varchar(3000) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`animal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'Dog','Dogs have four legs and make a \"bark,\" \"woof,\" or \"arf\" sound. Dogs often chase cats, and most dogs will fetch a ball or stick.Dogs can smell and hear better than humans, but cannot see well in color because they are color blind. Due to the anatomy of the eye, dogs can see better in dim light than humans. They also have a wider field of vision. Like wolves, wild dogs travel in groups called packs. Packs of dogs are ordered by rank, and dogs with low rank will submit to other dogs with higher rank. The highest ranked dog is called the alpha male. A dog in a group helps and cares for others. Domesticated dogs often view their owner as the alpha male.','dog.jpg'),(2,'Cat','Cats are similar in anatomy to the other felids, with a strong flexible body, quick reflexes, sharp retractable claws and teeth adapted to killing small prey. Cat senses fit a crepuscular and predatory ecological niche. Cats can hear sounds too faint or too high in frequency for human ears, such as those made by mice and other small animals. They can see in near darkness. Like most other mammals, cats have poorer color vision and a better sense of smell than humans. Cats, despite being solitary hunters, are a social species, and cat communication includes the use of a variety of vocalizations (mewing, purring, trilling, hissing, growling and grunting) as well as cat pheromones and types of cat-specific body language.','cat.jpg'),(3,'Cow','Cows are raised for many reasons including: milk, cheese, other dairy products, also  for meat such as beef and veal and materials such as leather hide. In older times they were used as work animals to pull carts and to plow fields.In some countries such as India, cows were classed as sacred animals and were used in religious ceremonies and treated with much respect.Today, cows are domesticated ungulates (hoofed animals with two toes on each hoof) that we see very often chewing the grass in farmers fields as we walk or drive through the countryside.There is an estimated 1.3 billion head of cattle and 920 breeds of cow in the world today. Cows are referred to as the fosters mothers to the human race because they produce most of the milk that people drink.','cow.jpg'),(4,'Bear','Bears are found on the continents of North America, South America, Europe, and Asia. Common characteristics of modern bears include large bodies with stocky legs, long snouts, small rounded ears, shaggy hair, plantigrade paws with five nonretractile claws, and short tails.While the polar bear is mostly carnivorous, and the giant panda feeds almost entirely on bamboo, the remaining six species are omnivorous with varied diets. With the exception of courting individuals and mothers with their young, bears are typically solitary animals. They may be diurnal or nocturnal and have an excellent sense of smell. Despite their heavy build and awkward gait, they are adept runners, climbers, and swimmers. Bears use shelters, such as caves and logs, as their dens; most species occupy their dens during the winter for a long period of hibernation, up to 100 days.Bears have been hunted since prehistoric times for their meat and fur; they have been used for bear-baiting and other forms of entertainment, such as being made to dance. With their powerful physical presence, they play a prominent role in the arts, mythology, and other cultural aspects of various human societies. In modern times, bears have come under pressure through encroachment on their habitats and illegal trade in bear parts, including the Asian bile bear market. The IUCN lists six bear species as vulnerable or endangered, and even least concern species, such as the brown bear, are at risk of extirpation in certain countries. The poaching and international trade of these most threatened populations are prohibited, but still ongoing.','bear.jpeg'),(5,'Horse','Most breeds of horses are able to perform work such as carrying humans on their backs or be harnessed to pull objects such as carts or plows. However, horse breeds were developed to allow horses to be specialized for certain tasks. Lighter horses were bred for racing or riding, heavier horses for farming and other tasks requiring pulling power. Some horses, such as the miniature horse, can be kept as pets.The horse plays a prominent role as a figure in the ideals of religion and art and plays an important role in transportation, agriculture and warfare.','horse.jpeg'),(6,'Zebra','Zebras are equids - members of the horse family (Equidae) and are medium sized, odd-toed ungulates. Zebras are native to southern and central Africa. Although zebras are very adaptable animals as far as their habitats are concerned, most zebras live in grasslands and savannas. The Grevy zebra (Equus grevyi) prefers to live in sub desert and arid grasslands.Zebras were the second species to diverge from the earliest proto-horses, after the asses, around 4 million years ago. The Grevy zebra is believed to have been the first zebra species to emerge.','zebra.jpeg'),(7,'Elephant','Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia. Elephantidae is the only surviving family of the order Proboscidea; other, now extinct, members of the order include deinotheres, gomphotheres, mammoths, and mastodons. All elephants have several distinctive features, the most notable of which is a long trunk (also called a proboscis), used for many purposes, particularly breathing, lifting water, and grasping objects. Their incisors grow into tusks, which can serve as weapons and as tools for moving objects and digging. Elephants large ear flaps help to control their body temperature. Their pillar-like legs can carry their great weight. African elephants have larger ears and concave backs while Asian elephants have smaller ears and convex or level backs. Elephants are herbivorous and can be found in different habitats including savannahs, forests, deserts, and marshes. They prefer to stay near water. They are considered to be keystone species due to their impact on their environments. Other animals tend to keep their distance from elephants while predators, such as lions, tigers, hyenas, and any wild dogs, usually target only young elephants (or \"calves\"). Elephants have a fission-fusion society in which multiple family groups come together to socialise.','elephant.jpg'),(8,'Giraffe','The Giraffe (Giraffa camelopardalis meaning fast walking camel leopard) is an African even-toed ungulate mammal, the tallest of all land-living animal species.The giraffe is related to deer and cattle, however, it is placed in a separate family, the Giraffidae, consisting only of the giraffe and its closest relative, the okapi.The giraffes range extends from Chad to South Africa. Although the Okapi is much shorter than the giraffe, it also has a long neck and eats leaves and both animals have long tongues and skin-covered horns. The giraffes ancestors first appeared in central Asia about 15 million years ago, however, the earliest fossil records of the giraffe itself, from Israel and Africa, date back about 1.5 million years.Male giraffes are called Bulls, female giraffes are called Cows and baby giraffes are called Calves.','giraffe.jpeg'),(9,'Sheep','Domestic sheep are relatively small ruminants, typically with horns forming a lateral spiral and crimped hair called wool. A sheep is an animal which has a thick coat of fleece on its body. Another trait unique to sheep are their wide variation in colour. Wild sheep are largely variations of brown hues. Colours of domestic sheep range from pure white to dark chocolate brown and even spotted or piebald. Selection for easily dyeable white fleeces began early in sheep domestication and as white wool is a dominant trait it spread quickly. However, coloured sheep do appear in many modern breeds and may even appear as a recessive trait in white flocks.Depending on breed, sheep show a range of heights and weights. Their rate of growth and mature weight is often selected for in breeding. Ewes typically weigh between 100 and 225 pounds (45 - 100 kg), with the larger rams between 100 and 350 pounds (45 - 160 kg). Mature sheep have 32 teeth. As with other ruminants, the eight incisors are in the lower jaw and bite against a hard, toothless pad in the upper jaw, picking off vegetation. Sheep have no canines, instead there is a large gap instead between the incisors and the premolars. Until the age of four (when all the adult teeth have erupted), it is possible to see the age of sheep from their front teeth, as a pair of incisors erupts each year.','sheep.jpeg');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `image` varchar(500) DEFAULT NULL,
  `animal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `result` varchar(20) DEFAULT NULL,
  `date_reg` varchar(50) DEFAULT NULL,
  KEY `idx_history` (`animal_id`),
  KEY `idx_history_0` (`user_id`),
  CONSTRAINT `fk_history` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_history_0` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES ('horses.jpg',5,1,'91%','2018-04-04'),('cow.jpg',3,1,'93%','2018-04-04'),('bear.jpeg',4,1,'94%','2018-04-08');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query`
--

DROP TABLE IF EXISTS `query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`query_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query`
--

LOCK TABLES `query` WRITE;
/*!40000 ALTER TABLE `query` DISABLE KEYS */;
INSERT INTO `query` VALUES (1,'Vatsal','vatsal@xyz.com','Subject','dklkdlkjflkdsj'),(2,'','','',''),(3,'','','','');
/*!40000 ALTER TABLE `query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Vatsal','vatsal123@gmail.com','123456'),(2,'abc','as@abc.com','123456'),(3,'abcdefghij','abc@xyz.com','123456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-11 21:22:55
