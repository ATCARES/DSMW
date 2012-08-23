# Welcome to the DSMW wiki!

DSMW stands for Distributed Semantic Media Wiki. It allows to create a network of Semantic Media Wiki Server and synchronize data between them. DSMW can be understood as Git or Mercurial but for a networks semantic wikis.

## DSMW principles

With DSMW extension, each Semantic MediaWiki (SMW) server can create arbitrary number of pushFeeds and publish changes of selected Wiki pages in these pushFeeds. It can be understood as publish operation in publish subscribe paradigm. Next, any SMW server can also subscribe to remote pushfeeds by creating pullfeeds. It can be seen as subscribe operation in publish subscribe paradigm. Then, anyone can push and pull in these channels. DSMW extension ensure eventual consistency on whole network i.e. if the system is idle and every node connected, next all servers are in the same state (no divergence).



More explanation can be found at:
* Distributed Semantic MediaWiki. Hala Skaf-Molli, G�r�me Canals and Pascal Molli . In 7th Extended Semantic Web Conference, ESWC 2010 (Demo) , Heraklion, Greece , june 2010.

* [Multi-Synchronous Collaborative Semantic Wikis](http://pagesperso.lina.univ-nantes.fr/~molli-p/pmwiki/uploads/Main/Skaf09wise.pdf). Charbel Rahhal, Hala Skaf-Molli, Pascal Molli and St�phane Weiss . In Wise'09: International Conference on Web Information Systems , 2009.  

* Undo in Peer-to-peer Semantic Wikis. Charbel Rahhal, St�phane Weiss, and Hala Skaf-Molli, Pascal Urso and Pascal Molli. In SemWiki 2009 - 4rd Semantic Wiki Workshop, page 18 , Heraklion, Greece, May 2009.  

* SWooki: Un Wiki S�mantique sur r�seau Pair-�-Pair. Charbel Rahhal, Hala Skaf-Molli and Pascal Molli . Ing�nierie des Syst�mes d'Information , 14 ( 1 ), 2009.    


## DSMW authors
Pascal Molli, Hala Skaf, Jean-Philippe Muller, Marl�ne Hantz, Emmanuel Desmontils, St�phane Weiss, Emile Morel


