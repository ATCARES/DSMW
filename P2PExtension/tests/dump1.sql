-- MySQL dump 10.11
--
-- Host: localhost    Database: wikidb2
-- ------------------------------------------------------
-- Server version	5.0.75-0ubuntu10.2

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
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `archive` (
  `ar_namespace` int(11) NOT NULL default '0',
  `ar_title` varbinary(255) NOT NULL default '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` tinyblob NOT NULL,
  `ar_user` int(10) unsigned NOT NULL default '0',
  `ar_user_text` varbinary(255) NOT NULL,
  `ar_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL default '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned default NULL,
  `ar_text_id` int(10) unsigned default NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL default '0',
  `ar_len` int(10) unsigned default NULL,
  `ar_page_id` int(10) unsigned default NULL,
  `ar_parent_id` int(10) unsigned default NULL,
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL auto_increment,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL default '0',
  `cat_subcats` int(11) NOT NULL default '0',
  `cat_files` int(11) NOT NULL default '0',
  `cat_hidden` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL default '0',
  `cl_to` varbinary(255) NOT NULL default '',
  `cl_sortkey` varbinary(70) NOT NULL default '',
  `cl_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `externallinks` (
  `el_from` int(10) unsigned NOT NULL default '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL auto_increment,
  `fa_name` varbinary(255) NOT NULL default '',
  `fa_archive_name` varbinary(255) default '',
  `fa_storage_group` varbinary(16) default NULL,
  `fa_storage_key` varbinary(64) default '',
  `fa_deleted_user` int(11) default NULL,
  `fa_deleted_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` blob,
  `fa_size` int(10) unsigned default '0',
  `fa_width` int(11) default '0',
  `fa_height` int(11) default '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) default '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') default 'unknown',
  `fa_minor_mime` varbinary(32) default 'unknown',
  `fa_description` tinyblob,
  `fa_user` int(10) unsigned default '0',
  `fa_user_text` varbinary(255) default NULL,
  `fa_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hitcounter`
--

DROP TABLE IF EXISTS `hitcounter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `hitcounter` (
  `hc_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 MAX_ROWS=25000;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `hitcounter`
--

LOCK TABLES `hitcounter` WRITE;
/*!40000 ALTER TABLE `hitcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `hitcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `image` (
  `img_name` varbinary(255) NOT NULL default '',
  `img_size` int(10) unsigned NOT NULL default '0',
  `img_width` int(11) NOT NULL default '0',
  `img_height` int(11) NOT NULL default '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL default '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `img_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `img_description` tinyblob NOT NULL,
  `img_user` int(10) unsigned NOT NULL default '0',
  `img_user_text` varbinary(255) NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL default '',
  `img_sha1` varbinary(32) NOT NULL default '',
  PRIMARY KEY  (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL default '0',
  `il_to` varbinary(255) NOT NULL default '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL default '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
INSERT INTO `interwiki` VALUES ('acronym','http://www.acronymfinder.com/af-query.asp?String=exact&Acronym=$1',0,0),('advogato','http://www.advogato.org/$1',0,0),('annotationwiki','http://www.seedwiki.com/page.cfm?wikiid=368&doc=$1',0,0),('arxiv','http://www.arxiv.org/abs/$1',0,0),('c2find','http://c2.com/cgi/wiki?FindPage&value=$1',0,0),('cache','http://www.google.com/search?q=cache:$1',0,0),('codersbase','http://www.codersbase.com/index.php/$1',0,0),('commons','http://commons.wikimedia.org/wiki/$1',0,0),('corpknowpedia','http://corpknowpedia.org/wiki/index.php/$1',0,0),('dictionary','http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1',0,0),('disinfopedia','http://www.disinfopedia.org/wiki.phtml?title=$1',0,0),('docbook','http://wiki.docbook.org/topic/$1',0,0),('drumcorpswiki','http://www.drumcorpswiki.com/index.php/$1',0,0),('dwjwiki','http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1',0,0),('efnetceewiki','http://purl.net/wiki/c/$1',0,0),('efnetcppwiki','http://purl.net/wiki/cpp/$1',0,0),('efnetpythonwiki','http://purl.net/wiki/python/$1',0,0),('efnetxmlwiki','http://purl.net/wiki/xml/$1',0,0),('elibre','http://enciclopedia.us.es/index.php/$1',0,0),('eljwiki','http://elj.sourceforge.net/phpwiki/index.php/$1',0,0),('emacswiki','http://www.emacswiki.org/cgi-bin/wiki.pl?$1',0,0),('eokulturcentro','http://esperanto.toulouse.free.fr/wakka.php?wiki=$1',0,0),('foldoc','http://foldoc.org/?$1',0,0),('foxwiki','http://fox.wikis.com/wc.dll?Wiki~$1',0,0),('freebsdman','http://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1',0,0),('gej','http://www.esperanto.de/cgi-bin/aktivikio/wiki.pl?$1',0,0),('gentoo-wiki','http://gentoo-wiki.com/$1',0,0),('google','http://www.google.com/search?q=$1',0,0),('googlegroups','http://groups.google.com/groups?q=$1',0,0),('gotamac','http://www.got-a-mac.org/$1',0,0),('hammondwiki','http://www.dairiki.org/HammondWiki/$1',0,0),('hewikisource','http://he.wikisource.org/wiki/$1',1,0),('hrwiki','http://www.hrwiki.org/index.php/$1',0,0),('imdb','http://us.imdb.com/Title?$1',0,0),('infosecpedia','http://www.infosecpedia.org/pedia/index.php/$1',0,0),('jargonfile','http://sunir.org/apps/meta.pl?wiki=JargonFile&redirect=$1',0,0),('jspwiki','http://www.jspwiki.org/wiki/$1',0,0),('keiki','http://kei.ki/en/$1',0,0),('kmwiki','http://kmwiki.wikispaces.com/$1',0,0),('linuxwiki','http://linuxwiki.de/$1',0,0),('lojban','http://www.lojban.org/tiki/tiki-index.php?page=$1',0,0),('lqwiki','http://wiki.linuxquestions.org/wiki/$1',0,0),('lugkr','http://lug-kr.sourceforge.net/cgi-bin/lugwiki.pl?$1',0,0),('mathsongswiki','http://SeedWiki.com/page.cfm?wikiid=237&doc=$1',0,0),('meatball','http://www.usemod.com/cgi-bin/mb.pl?$1',0,0),('mediawikiwiki','http://www.mediawiki.org/wiki/$1',0,0),('mediazilla','http://bugzilla.wikipedia.org/$1',1,0),('memoryalpha','http://www.memory-alpha.org/en/index.php/$1',0,0),('metawiki','http://sunir.org/apps/meta.pl?$1',0,0),('metawikipedia','http://meta.wikimedia.org/wiki/$1',0,0),('moinmoin','http://purl.net/wiki/moin/$1',0,0),('mozillawiki','http://wiki.mozilla.org/index.php/$1',0,0),('oeis','http://www.research.att.com/cgi-bin/access.cgi/as/njas/sequences/eisA.cgi?Anum=$1',0,0),('openfacts','http://openfacts.berlios.de/index.phtml?title=$1',0,0),('openwiki','http://openwiki.com/?$1',0,0),('orgpatterns','http://www.bell-labs.com/cgi-user/OrgPatterns/OrgPatterns?$1',0,0),('patwiki','http://gauss.ffii.org/$1',0,0),('pmeg','http://www.bertilow.com/pmeg/$1.php',0,0),('ppr','http://c2.com/cgi/wiki?$1',0,0),('pythoninfo','http://wiki.python.org/moin/$1',0,0),('rfc','http://www.rfc-editor.org/rfc/rfc$1.txt',0,0),('s23wiki','http://is-root.de/wiki/index.php/$1',0,0),('seattlewiki','http://seattle.wikia.com/wiki/$1',0,0),('seattlewireless','http://seattlewireless.net/?$1',0,0),('senseislibrary','http://senseis.xmp.net/?$1',0,0),('slashdot','http://slashdot.org/article.pl?sid=$1',0,0),('sourceforge','http://sourceforge.net/$1',0,0),('squeak','http://wiki.squeak.org/squeak/$1',0,0),('susning','http://www.susning.nu/$1',0,0),('svgwiki','http://wiki.svg.org/$1',0,0),('tavi','http://tavi.sourceforge.net/$1',0,0),('tejo','http://www.tejo.org/vikio/$1',0,0),('theopedia','http://www.theopedia.com/$1',0,0),('tmbw','http://www.tmbw.net/wiki/$1',0,0),('tmnet','http://www.technomanifestos.net/?$1',0,0),('tmwiki','http://www.EasyTopicMaps.com/?page=$1',0,0),('twiki','http://twiki.org/cgi-bin/view/$1',0,0),('uea','http://www.tejo.org/uea/$1',0,0),('unreal','http://wiki.beyondunreal.com/wiki/$1',0,0),('usemod','http://www.usemod.com/cgi-bin/wiki.pl?$1',0,0),('vinismo','http://vinismo.com/en/$1',0,0),('webseitzwiki','http://webseitz.fluxent.com/wiki/$1',0,0),('why','http://clublet.com/c/c/why?$1',0,0),('wiki','http://c2.com/cgi/wiki?$1',0,0),('wikia','http://www.wikia.com/wiki/$1',0,0),('wikibooks','http://en.wikibooks.org/wiki/$1',1,0),('wikicities','http://www.wikicities.com/index.php/$1',0,0),('wikif1','http://www.wikif1.org/$1',0,0),('wikihow','http://www.wikihow.com/$1',0,0),('wikimedia','http://wikimediafoundation.org/wiki/$1',0,0),('wikinews','http://en.wikinews.org/wiki/$1',1,0),('wikinfo','http://www.wikinfo.org/index.php/$1',0,0),('wikipedia','http://en.wikipedia.org/wiki/$1',1,0),('wikiquote','http://en.wikiquote.org/wiki/$1',1,0),('wikisource','http://sources.wikipedia.org/wiki/$1',1,0),('wikispecies','http://species.wikipedia.org/wiki/$1',1,0),('wikitravel','http://wikitravel.org/en/$1',0,0),('wikt','http://en.wiktionary.org/wiki/$1',1,0),('wiktionary','http://en.wiktionary.org/wiki/$1',1,0),('wlug','http://www.wlug.org.nz/$1',0,0),('zwiki','http://zwiki.org/$1',0,0),('zzz wiki','http://wiki.zzz.ee/index.php/$1',0,0);
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL auto_increment,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL default '0',
  `ipb_by` int(10) unsigned NOT NULL default '0',
  `ipb_by_text` varbinary(255) NOT NULL default '',
  `ipb_reason` tinyblob NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL default '0',
  `ipb_anon_only` tinyint(1) NOT NULL default '0',
  `ipb_create_account` tinyint(1) NOT NULL default '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL default '1',
  `ipb_expiry` varbinary(14) NOT NULL default '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL default '0',
  `ipb_block_email` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL auto_increment,
  `job_cmd` varbinary(60) NOT NULL default '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_params` blob NOT NULL,
  PRIMARY KEY  (`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL default '0',
  `ll_lang` varbinary(20) NOT NULL default '',
  `ll_title` varbinary(255) NOT NULL default '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `log_type` varbinary(10) NOT NULL default '',
  `log_action` varbinary(10) NOT NULL default '',
  `log_timestamp` binary(14) NOT NULL default '19700101000000',
  `log_user` int(10) unsigned NOT NULL default '0',
  `log_namespace` int(11) NOT NULL default '0',
  `log_title` varbinary(255) NOT NULL default '',
  `log_comment` varbinary(255) NOT NULL default '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` VALUES (1,'patrol','patrol','20090611080827',1,0,'UNTITLED','','2\n0\n1',0);
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `math`
--

DROP TABLE IF EXISTS `math`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `math` (
  `math_inputhash` varbinary(16) NOT NULL,
  `math_outputhash` varbinary(16) NOT NULL,
  `math_html_conservativeness` tinyint(4) NOT NULL,
  `math_html` blob,
  `math_mathml` blob,
  UNIQUE KEY `math_inputhash` (`math_inputhash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `math`
--

LOCK TABLES `math` WRITE;
/*!40000 ALTER TABLE `math` DISABLE KEYS */;
/*!40000 ALTER TABLE `math` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `model` (
  `rev_id` int(10) NOT NULL,
  `session_id` varbinary(50) NOT NULL,
  `blob_info` longblob,
  `causal_barrier` blob,
  PRIMARY KEY  (`rev_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL default '',
  `value` mediumblob,
  `exptime` datetime default NULL,
  UNIQUE KEY `keyname` (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
INSERT INTO `objectcache` VALUES ('wikidb2:messages:en','K�2��.�2�R\ns\r\n���S�δ2��\0','2009-06-12 08:05:23'),('wikidb2:pcache:idhash:1-0!1!0!!en!2','�Vmo�6���W0�lIv�&��ahӴ@�xK�|���6�H*�W��\\�M��]�80�x���s���a�M�6��*[V֋��胉#/���M���I<�H. �V�	���\03U��1�J�5�X.%d�؟%��z����e�L%-�K`1gK\r�Soim�~�Vh7\'�B/|��YFxт��c��Ɯz���Y�ɬ��Քy�b^HY���O��s��+�A������gέ(����p�� 3�ܮ�����!)�#�s���	m!��/�IlJ�61d�\ZHɶ��ɇ�:���aP.�_��.�P�	_�O</��];%�{c�4���E�9�X��m�MB�w���mA�W�%�L\n^�{�5Wb#�ŕLb)��\n�Z��\0ϧ\"\\pUqIe��E�]j������~��ro��V�Ia\\^���w�����(��ȟF�_i�<bv� �B�\\9u�����J�J�	���CBp��P����6����~��.a5��B���,��M�.��phU�Kѡ����ӛ���;7ñNe�JF��ap�\"<��ڂ��@^Jn�q��r$�/�=����V:es�ѵS�< �~�E~���)O��%����l6�Jw�v��`?���A����t�żd� 8	��08�#F�j�F�բB�x\'ԝ��<\n�Q�t������� �#����_��Ϣ�,�ºA筏m�tz�j�Aⴱ�$��hp�&n���݂����t�M�����۬#!�os��Mi8k�x��V���i[�ER@\'��Pc� x������(���s��&�1�n�O�ʗ�9�o��:}��୅ܥ0�b�M���l^����3�\"uW9�.��ޮK�^�R�.!>���!�^���h�y_߂�%�󂣇c�ǫ���^D�9��P1������(�}���o�Vum��Mfvg����\Z�!F��}G�e�`��]�o�H�x}q������=�E�����*\nql��5`9�H�q�s*���{������%\n�$��|�N{��)Q8�c�Pܧd7��R6C�њ~�%p4զ3��_\'D�h�Q7-����������ҋ������	�i��I��Y�S���_v����]Te]�us�\r(���|��9h]����uR�����?�r��R܆;��ʊ���\r��6׶��S�M+\Z���\\�nD�u�$��qM��\"��~�pq�r��`t�c�','2009-06-12 08:05:23'),('wikidb2:pcache:idhash:2-0!1!0!!en!2','�UMo�8͵��{ha�#�?M�H��6ǀ��6�$H*����!%���b��;�Ǚ�7o&�4�h4eƂ����\\D�c���\Z�sغh�ߓs\Z���uU�;�\0RY(�bGƌ�\r,/��s���f��Pp��O|��*�_⛭i��t�K-��2��H.����#� �%�;�Ҁ���Z*!�&�:��8fW�q��W0 �	l�S\"x���ʸ�?���Ze�T�\\U�Q��i~zSe�\0��ɂp��\nA���$q�\\��\'J���急��oU� �op7[��>ѡ+dY��!�x����^�|ƞ�o�9��@6ܭ���XdT�sʋ5�k�\r�~�O�}��x���`+5ɒ�\"9M��<9�Έ��M��GG�1���\n�|�шф�x�X����u+e8tg>��c\\�{Q|a+�G�M|�$�BZs,��x]ޟ���o`|�i�O��6��{��*�SO��d�6m�g��ۢ��oK|n�e�i̺�����Dd��騕�8���W:M�\'&�ݫ����[�O�ٖ�GS,kA��7c�D�`\"Pw�3��8bLk�s��x�ݶ���g2����\\G̈́�Wd1�l�z�?Ը���3Aѻ87_�?��ſ�P#�Xb�/=\'{7���+�R�>]`���������xS�4�R�)Cu��Q�-vx̲��7s��!��A�n����5s,\Z��m�Πd�_8���8z{d��w����bM�=ߘ�\0�j��]>�=���7�K��\n�b�#� .���1�{uCW�����Y\Z���{�il;�B�rG��W�f9x�H{�]�֯�e�t�c��a�=+]7u��iߓ3�j4���Q�`�k.�B��v����Ǎ^(��:�GSU�\Z�)�I+��Ͼն\r{���	��1��}�=2�5�3ϡ��/�E�����͗�\0','2009-06-12 08:08:27');
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `oldimage` (
  `oi_name` varbinary(255) NOT NULL default '',
  `oi_archive_name` varbinary(255) NOT NULL default '',
  `oi_size` int(10) unsigned NOT NULL default '0',
  `oi_width` int(11) NOT NULL default '0',
  `oi_height` int(11) NOT NULL default '0',
  `oi_bits` int(11) NOT NULL default '0',
  `oi_description` tinyblob NOT NULL,
  `oi_user` int(10) unsigned NOT NULL default '0',
  `oi_user_text` varbinary(255) NOT NULL,
  `oi_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `oi_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL default '0',
  `oi_sha1` varbinary(32) NOT NULL default '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL auto_increment,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_counter` bigint(20) unsigned NOT NULL default '0',
  `page_is_redirect` tinyint(3) unsigned NOT NULL default '0',
  `page_is_new` tinyint(3) unsigned NOT NULL default '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,'Main_Page','',1,0,0,0.950519306779,'20090611080035',1,449),(2,0,'UNTITLED','',0,0,1,0.690741045929,'20090611080827',2,98);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  PRIMARY KEY  (`pp_page`,`pp_propname`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page_restrictions` (
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) default NULL,
  `pr_expiry` varbinary(14) default NULL,
  `pr_id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`pr_page`,`pr_type`),
  UNIQUE KEY `pr_id` (`pr_id`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL default '0',
  `pl_namespace` int(11) NOT NULL default '0',
  `pl_title` varbinary(255) NOT NULL default '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patchs`
--

DROP TABLE IF EXISTS `patchs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `patchs` (
  `id` int(10) NOT NULL,
  `patch_id` varbinary(50) NOT NULL,
  `operations` longblob NOT NULL,
  `is_active` int(8) default NULL,
  `rev_id` int(8) NOT NULL,
  `page_id` int(10) NOT NULL,
  PRIMARY KEY  (`id`,`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `patchs`
--

LOCK TABLES `patchs` WRITE;
/*!40000 ALTER TABLE `patchs` DISABLE KEYS */;
/*!40000 ALTER TABLE `patchs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` tinyblob,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL default '',
  `pt_create_perm` varbinary(60) NOT NULL,
  PRIMARY KEY  (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL default '0',
  `qc_namespace` int(11) NOT NULL default '0',
  `qc_title` varbinary(255) NOT NULL default '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL default '',
  `qci_timestamp` binary(14) NOT NULL default '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL default '0',
  `qcc_namespace` int(11) NOT NULL default '0',
  `qcc_title` varbinary(255) NOT NULL default '',
  `qcc_namespacetwo` int(11) NOT NULL default '0',
  `qcc_titletwo` varbinary(255) NOT NULL default '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL auto_increment,
  `rc_timestamp` varbinary(14) NOT NULL default '',
  `rc_cur_time` varbinary(14) NOT NULL default '',
  `rc_user` int(10) unsigned NOT NULL default '0',
  `rc_user_text` varbinary(255) NOT NULL,
  `rc_namespace` int(11) NOT NULL default '0',
  `rc_title` varbinary(255) NOT NULL default '',
  `rc_comment` varbinary(255) NOT NULL default '',
  `rc_minor` tinyint(3) unsigned NOT NULL default '0',
  `rc_bot` tinyint(3) unsigned NOT NULL default '0',
  `rc_new` tinyint(3) unsigned NOT NULL default '0',
  `rc_cur_id` int(10) unsigned NOT NULL default '0',
  `rc_this_oldid` int(10) unsigned NOT NULL default '0',
  `rc_last_oldid` int(10) unsigned NOT NULL default '0',
  `rc_type` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_ns` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_title` varbinary(255) NOT NULL default '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL default '0',
  `rc_ip` varbinary(40) NOT NULL default '',
  `rc_old_len` int(11) default NULL,
  `rc_new_len` int(11) default NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rc_logid` int(10) unsigned NOT NULL default '0',
  `rc_log_type` varbinary(255) default NULL,
  `rc_log_action` varbinary(255) default NULL,
  `rc_params` blob,
  PRIMARY KEY  (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
INSERT INTO `recentchanges` VALUES (1,'20090611080827','20090611080827',1,'WikiSysop',0,'UNTITLED','Dummy article created for Simple Forms extension',1,0,1,2,2,0,1,0,'',1,'::1',0,98,0,0,NULL,'','');
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL default '0',
  `rd_namespace` int(11) NOT NULL default '0',
  `rd_title` varbinary(255) NOT NULL default '',
  PRIMARY KEY  (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL auto_increment,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` tinyblob NOT NULL,
  `rev_user` int(10) unsigned NOT NULL default '0',
  `rev_user_text` varbinary(255) NOT NULL default '',
  `rev_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL default '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rev_len` int(10) unsigned default NULL,
  `rev_parent_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`rev_page`,`rev_id`),
  UNIQUE KEY `rev_id` (`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,'',0,'MediaWiki default','20090611080035',0,0,449,0),(2,2,2,'Dummy article created for Simple Forms extension',1,'WikiSysop','20090611080827',1,0,98,0);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL default '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `site` (
  `site_id` int(3) NOT NULL auto_increment,
  `site_url` varbinary(70) NOT NULL,
  `site_name` varbinary(50) NOT NULL,
  PRIMARY KEY  (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_cnt`
--

DROP TABLE IF EXISTS `site_cnt`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `site_cnt` (
  `site_id` int(3) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `counter` int(10) default NULL,
  PRIMARY KEY  (`site_id`,`page_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `site_cnt`
--

LOCK TABLES `site_cnt` WRITE;
/*!40000 ALTER TABLE `site_cnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_cnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_views` bigint(20) unsigned default '0',
  `ss_total_edits` bigint(20) unsigned default '0',
  `ss_good_articles` bigint(20) unsigned default '0',
  `ss_total_pages` bigint(20) default '-1',
  `ss_users` bigint(20) default '-1',
  `ss_admins` int(11) default '-1',
  `ss_images` int(11) default '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` VALUES (1,1,1,0,1,1,1,0);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_atts2`
--

DROP TABLE IF EXISTS `smw_atts2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_atts2` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `value_unit` varchar(63) character set latin1 collate latin1_bin default NULL,
  `value_xsd` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `value_num` double default NULL,
  KEY `s_id` (`s_id`),
  KEY `p_id` (`p_id`),
  KEY `value_num` (`value_num`),
  KEY `value_xsd` (`value_xsd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_atts2`
--

LOCK TABLES `smw_atts2` WRITE;
/*!40000 ALTER TABLE `smw_atts2` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_atts2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_conc2`
--

DROP TABLE IF EXISTS `smw_conc2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_conc2` (
  `s_id` int(8) unsigned NOT NULL,
  `concept_txt` mediumblob,
  `concept_docu` mediumblob,
  `concept_features` int(8) default NULL,
  `concept_size` int(8) default NULL,
  `concept_depth` int(8) default NULL,
  `cache_date` int(8) unsigned default NULL,
  `cache_count` int(8) unsigned default NULL,
  PRIMARY KEY  (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_conc2`
--

LOCK TABLES `smw_conc2` WRITE;
/*!40000 ALTER TABLE `smw_conc2` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_conc2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_conccache`
--

DROP TABLE IF EXISTS `smw_conccache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_conccache` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned NOT NULL,
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_conccache`
--

LOCK TABLES `smw_conccache` WRITE;
/*!40000 ALTER TABLE `smw_conccache` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_conccache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_ids`
--

DROP TABLE IF EXISTS `smw_ids`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_ids` (
  `smw_id` int(8) unsigned NOT NULL auto_increment,
  `smw_namespace` int(11) NOT NULL,
  `smw_title` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `smw_iw` varchar(32) character set latin1 collate latin1_bin default NULL,
  `smw_sortkey` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  PRIMARY KEY  (`smw_id`),
  KEY `smw_title` (`smw_title`,`smw_namespace`,`smw_iw`),
  KEY `smw_sortkey` (`smw_sortkey`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_ids`
--

LOCK TABLES `smw_ids` WRITE;
/*!40000 ALTER TABLE `smw_ids` DISABLE KEYS */;
INSERT INTO `smw_ids` VALUES (1,102,'Has_type',':smw-preprop','Has_type'),(2,102,'Equivalent_URI',':smw-preprop','Equivalent_URI'),(4,102,'_INST',':smw-intprop','_INST'),(7,102,'Display_units',':smw-preprop','Display_units'),(8,102,'Imported_from',':smw-preprop','Imported_from'),(12,102,'Corresponds_to',':smw-preprop','Corresponds_to'),(13,102,'Provides_service',':smw-preprop','Provides_service'),(14,102,'Allows_value',':smw-preprop','Allows_value'),(15,102,'_REDI',':smw-intprop','_REDI'),(17,102,'Subproperty_of',':smw-preprop','Subproperty_of'),(18,102,'_SUBC',':smw-intprop','_SUBC'),(19,102,'_CONC',':smw-intprop','_CONC'),(20,102,'_SF_DF',':smw-intprop','_SF_DF'),(21,102,'_SF_AF',':smw-intprop','_SF_AF'),(50,0,'',':smw-border','');
/*!40000 ALTER TABLE `smw_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_inst2`
--

DROP TABLE IF EXISTS `smw_inst2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_inst2` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned NOT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_inst2`
--

LOCK TABLES `smw_inst2` WRITE;
/*!40000 ALTER TABLE `smw_inst2` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_inst2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_redi2`
--

DROP TABLE IF EXISTS `smw_redi2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_redi2` (
  `s_title` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `s_namespace` int(11) NOT NULL,
  `o_id` int(8) unsigned NOT NULL,
  KEY `s_title` (`s_title`,`s_namespace`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_redi2`
--

LOCK TABLES `smw_redi2` WRITE;
/*!40000 ALTER TABLE `smw_redi2` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_redi2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_rels2`
--

DROP TABLE IF EXISTS `smw_rels2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_rels2` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned NOT NULL,
  KEY `s_id` (`s_id`),
  KEY `p_id` (`p_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_rels2`
--

LOCK TABLES `smw_rels2` WRITE;
/*!40000 ALTER TABLE `smw_rels2` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_rels2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_spec2`
--

DROP TABLE IF EXISTS `smw_spec2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_spec2` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `value_string` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  KEY `s_id` (`s_id`),
  KEY `p_id` (`p_id`),
  KEY `s_id_2` (`s_id`,`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_spec2`
--

LOCK TABLES `smw_spec2` WRITE;
/*!40000 ALTER TABLE `smw_spec2` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_spec2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_subs2`
--

DROP TABLE IF EXISTS `smw_subs2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_subs2` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned NOT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_subs2`
--

LOCK TABLES `smw_subs2` WRITE;
/*!40000 ALTER TABLE `smw_subs2` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_subs2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_text2`
--

DROP TABLE IF EXISTS `smw_text2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smw_text2` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `value_blob` mediumblob,
  KEY `s_id` (`s_id`),
  KEY `p_id` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smw_text2`
--

LOCK TABLES `smw_text2` WRITE;
/*!40000 ALTER TABLE `smw_text2` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_text2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL default '0',
  `tl_namespace` int(11) NOT NULL default '0',
  `tl_title` varbinary(255) NOT NULL default '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL auto_increment,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY  (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'<big>\'\'\'MediaWiki has been successfully installed.\'\'\'</big>\n\nConsult the [http://meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [http://www.mediawiki.org/wiki/Manual:Configuration_settings Configuration settings list]\n* [http://www.mediawiki.org/wiki/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]','utf-8'),(2,'Dummy article used by [http://www.mediawiki.org/wiki/Extension:Simple_Forms Extension:SimpleForms]','utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackbacks`
--

DROP TABLE IF EXISTS `trackbacks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `trackbacks` (
  `tb_id` int(11) NOT NULL auto_increment,
  `tb_page` int(11) default NULL,
  `tb_title` varbinary(255) NOT NULL,
  `tb_url` blob NOT NULL,
  `tb_ex` blob,
  `tb_name` varbinary(255) default NULL,
  PRIMARY KEY  (`tb_id`),
  KEY `tb_page` (`tb_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `trackbacks`
--

LOCK TABLES `trackbacks` WRITE;
/*!40000 ALTER TABLE `trackbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcache`
--

DROP TABLE IF EXISTS `transcache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` blob,
  `tc_time` int(11) NOT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `transcache`
--

LOCK TABLES `transcache` WRITE;
/*!40000 ALTER TABLE `transcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  PRIMARY KEY  (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varbinary(255) NOT NULL default '',
  `user_real_name` varbinary(255) NOT NULL default '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) default NULL,
  `user_email` tinyblob NOT NULL,
  `user_options` blob NOT NULL,
  `user_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) default NULL,
  `user_email_token` binary(32) default NULL,
  `user_email_token_expires` binary(14) default NULL,
  `user_registration` binary(14) default NULL,
  `user_editcount` int(11) default NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'WikiSysop','',':B:d199ea85:7d728465c7fc94a80189b40ecfef75a7','',NULL,'','quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=0\najaxsearch=0\nskin=\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nenotifwatchlistpages=0\nenotifusertalkpages=1\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=1\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nshowjumplinks=1\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nvariant=en\nlanguage=en\nsearchNs0=1','20090611080832','c43be39ed325052d99ae273c0dbb51fe',NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20090611080035',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL default '0',
  `ug_group` varbinary(16) NOT NULL default '',
  PRIMARY KEY  (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'bureaucrat'),(1,'sysop');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_newtalk` (
  `user_id` int(11) NOT NULL default '0',
  `user_ip` varbinary(40) NOT NULL default '',
  `user_last_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `watchlist` (
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL default '0',
  `wl_title` varbinary(255) NOT NULL default '',
  `wl_notificationtimestamp` varbinary(14) default NULL,
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-06-12 10:19:42
