CREATE TABLE IF NOT EXISTS `kurse` (
  `kid` int(11) NOT NULL,
  `bezeichnung` varchar(45) NOT NULL,
  `preis` double NOT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `kursdaten` (
  `datum` date NOT NULL,
  `kid` int(11) NOT NULL,
  PRIMARY KEY (`datum`,`kid`),
 FOREIGN KEY (`kid`) REFERENCES `kurse` (`kid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `anmeldungen` (
 `aid` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(45) DEFAULT NULL,
 `vorname` varchar(45) DEFAULT NULL,
 `email` varchar(45) DEFAULT NULL,
 `datum` date NOT NULL,
 `kid` int(11) NOT NULL,
 PRIMARY KEY (`aid`),
 FOREIGN KEY (datum,kid) REFERENCES kursdaten (datum,kid) ON DELETE NO ACTION ON UPDATE NO ACTION 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `kurse` (`kid`, `bezeichnung`, `preis`) VALUES
(1, 'Microsoft Word 2013', 1200),
(2, 'Microsoft Excel  2013', 1500),
(3, 'Microsoft Powerpoint 2013', 1200),
(4, 'Micsosoft Windows 8', 1800),
(5, 'Ubuntu Desktop 14.10', 1200);

INSERT INTO `kursdaten` (`datum`, `kid`) VALUES
('2015-05-25', 1),
('2015-07-06', 1),
('2015-07-27', 1),
('2015-06-01', 2),
('2015-07-13', 2),
('2015-06-15', 3),
('2015-07-20', 3),
('2015-06-22', 4),
('2015-06-29', 5);

INSERT INTO `anmeldungen` (`aid`, `name`, `vorname`, `email`, `datum`, `kid`) VALUES
(1, 'muster', 'peter', 'peter.muster@bluewin.ch', '2015-07-20', 3),
(2, 'hans', 'hugentobler', 'hans.hugentobler@bluewin.ch', '2015-06-01', 2),
(3, 'fritz', 'fritz', 'fritz.steiner@solnet.com', '2015-06-29', 5);
