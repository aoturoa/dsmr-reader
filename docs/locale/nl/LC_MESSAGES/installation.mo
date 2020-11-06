��    �      l  �   �      �  t   �  �   .  �   �  �   �      �     �     �     �       !   ,     N  $   \     �     �  B   �     �       �   !  `   �  2    D   H  L   �  �   �     ~     �  %   �  (   �     �  L        U  
   ^  �   i  -     �   =  h   .  \   �  �   �  =   �     �  =     2   @  e   s     �  �   �  
   w  C   �  d   �  S   +  �     $     ?   )  	   i  a   s     �  I   �  ^   &  �   �  �   a          0     G  �   T  8   �  S   5  }   �  /      �   7   s   �   U   p!  W   �!  _   "  L   ~"  R   �"  l   #  Q   �#  �   �#  �   �$  .   j%  2   �%  *   �%  !   �%  #   &     =&  D   Z&  1   �&     �&  z   �&     f'     m'  �   t'     F(     e(  _   ~(  G   �(  %   &)      L)  j   m)     �)  �   �)  
   �*  B   �*     �*  "   +  �   &+  �   �+  K   A,  �   �,  g   -  A   �-  (   ).  a   R.  �   �.  I   c/  8   �/  A   �/  U   (0  �   ~0  |   1  n   �1  �   �1  '   �2  s   �2  "   43  c   W3  L   �3  1   4  �   :4  �   �4    R5  v   l6  -   �6  �   7  �   �7  �   �8     -9  -   K9  4   y9  �  �9  y   _;  �   �;  -  �<  �   >     �>     	?     ?     ,?     C?  "   _?     �?     �?     �?     �?  ?   �?     @     4@  �   P@  V   �@  j  FA  P   �B  ^   C  �   aC     D     D  +   4D  '   `D     �D  P   �D     �D     �D  �   	E  3   �E  �   �E  h   �F  �   'G  �   �G  Z   zH     �H  V   �H  4   HI  s   }I     �I  �   J  
   �J  B   �J  n   �J  `   TK  �   �K  1   GL  .   yL  
   �L  K   �L     �L  Z   M  m   aM    �M  �   �N     �O     �O     �O  �   �O  H   ~P  z   �P  �   BQ  0   �Q  �   -R  �   S  ^   �S  i   �S  {   LT  m   �T  r   6U  ^   �U  Y   V  �   bV  �   NW  0   �W  6   0X  *   gX  (   �X  '   �X     �X  I   �X  1   IY     {Y  �   �Y     Z     &Z     -Z  !   .[     P[  j   o[  G   �[  +   "\  +   N\  k   z\     �\  �   �\  
   �]  I   �]  #   >^  "   b^  �   �^  �   $_  0   �_  �   �_  i   �`  K   @a  0   �a  t   �a  �   2b  a   �b  9   ]c  `   �c  j   �c  �   cd  �   e  w   �e  �   !f  =   �f  �   *g  &   �g  Z   �g  J   7h  E   �h  �   �h  �   Ii  ?  �i  y   k  3   �k    �k  �   �l  �   �m     3n  -   Qn  4   n     f   X              g       s           d       h   `   \   S       y   D              .            !                  �   +   r   o   '       G       ;   W   e   ?   Y      >      )      8   4   2          M   =       p   w      b   #       H   ~       Q               F   t       �           _   }   �          
   (      J   {   l   [   9      z   	               ,               n   a   �      k           K       1   A             N   <       �   :       �   �       B         |          j      3       T   L   5         C   ]           E   �   V   O       7   ^       $   0   v   -      c   �   @       /      R                  �       I   q       x   %       m   u   &      6       "   �   *   i   U   Z                 P    (!) Ignore any '*could not change directory to "/root": Permission denied*' errors for the following three commands. **Installation of the requirements below might take a while**, depending on your Internet connection, RaspberryPi speed and resources (generally CPU) available. Nothing to worry about. :] **OPTIONAL**: You may skip this section as it's not required for the application to install. However, if you have never read your meter's P1 telegram port before, I recommend to perform an initial reading to make sure everything works as expected. *We will now prepare the webserver, Nginx. It will serve all application's static files directly and proxy any application requests to the backend, Gunicorn controlled by Supervisor, which we will configure later on.* 1. Database backend (PostgreSQL) 10. Supervisor 2. Dependencies 3. Application user 4. Webserver/Nginx (part 1) 5. Clone project code from Github 6. Virtualenv 7. Application configuration & setup 8. Bootstrapping 9. Webserver/Nginx (part 2) :doc:`Finished? Go to setting up the application<../application>`. A. Serial port (``.env``) API config (``.env``) Add the schema (``http://``/``https://``) and hostname/port to ``DATALOGGER_API_HOSTS``. Add the API key to ``DATALOGGER_API_KEYS``. For example:: Also, you should disable the datalogger process over there, since you won't be using it anyway:: Although it's just a folder inside our user's homedir, it's very effective as it allows us to keep dependencies isolated or to run different versions of the same package on the same machine. `More information about this subject can be found here <http://docs.python-guide.org/en/latest/dev/virtualenvs/>`_. Are you using a cable to read telegrams directly from a serial port? Are you using a network socket for reading the telegrams? E.g.: ``ser2net``. Are you using the remote datalogger for multiple instances of DSMR-reader? Then use ``DATALOGGER_API_HOSTS`` and ``DATALOGGER_API_KEYS`` as comma separated lists:: Author B. Network socket (``.env``) Choose either ``A.`` or ``B.`` below. Choose either option A, B, C or D below. Clone the repository:: Contains just a list of commands needed for the installation of DSMR-reader. Contents Continue:: Copy application vhost, **it will listen to any hostname** (wildcard), but you may change that if you feel like you need to. It won't affect the application anyway:: Copy the configuration files for Supervisor:: Create a new file ``/home/dsmr/dsmr_datalogger_api_client.py`` with the following contents: `dsmr_datalogger_api_client.py on GitHub <https://github.com/dsmrreader/dsmr-reader/blob/v4/dsmr_datalogger/scripts/dsmr_datalogger_api_client.py>`_ Create a new supervisor config in ``/etc/supervisor/conf.d/dsmr_remote_datalogger.conf`` with contents:: Create a new virtualenv, we usually use the same name for it as the application or project:: Create an application superuser with the following command. The ``DSMR_USER`` and ``DSMR_PASSWORD`` :doc:`as defined in Env Settings<../env_settings>` will be used for the credentials. Create another file ``/home/dsmr/.env`` and add as contents:: Create database user:: Create database, owned by the database user we just created:: Create folder for the virtualenv(s) of this user:: Create user with homedir. The application code and virtualenv will reside in this directory as well:: Datalogger script Django will later copy all static files to the directory below, used by Nginx to serve statics. Therefor it requires (write) access to it:: Docker Hub Does PostgreSQL not start/create the cluster due to locales? E.g.:: Each time you work as ``dsmr`` user, you will have to switch to the virtualenv with these commands:: Either proceed to the next heading **for a test reading** or continue at chapter 4. Enter these commands (**listed after the** ``>``). It will ask Supervisor to recheck its config directory and use/reload the files:: Example of everything running well:: Execute this to initialize the database we've created earlier:: Execute:: For others users who want some addition explanation about what they are exactly doing/installing. Github Have Supervisor reread and update its configs to initialize the process:: If you need to restore a database backup with your existing data, this is the moment to do so. If your smart meter only supports DSMR v2 (or you are using a non Dutch smart meter), make sure to change the DSMR version :doc:`in the configuration<../configuration>` as well, to have DSMR-reader parse them correctly. Install ``cu``. The CU program allows easy testing for your DSMR serial connection. It's very basic but also very effective to simply test whether your serial cable setup works properly:: Install database:: Install dependencies:: Installation It's possible to have other applications use Nginx as well, but that requires you to remove the wildcard in the ``dsmr-webinterface`` vhost, which you will copy below. Keep the file open for multiple edits / additions below. Let Nginx verify vhost syntax and restart Nginx when the ``-t`` configtest passes:: Let's have both commands executed **automatically** every time we login as ``dsmr`` user, by adding them ``~/.bashrc`` file:: Login to ``supervisorctl`` management console:: Make sure to first prepare the API at the DSMR-reader instance you'll forward the telegrams to. You can enable the API and view/edit the API key used :doc:`in the configuration<../configuration>`. Make sure you are acting here as ``root`` or ``sudo`` user. If not, press CTRL + D to log out of the ``dsmr`` user. Make sure you are now acting as ``dsmr`` user (if not then enter: ``sudo su - dsmr``) Make sure you are still acting as ``dsmr`` user (if not then enter: ``sudo su - dsmr``) Make sure you've read and executed the note above, because you'll need it for the next chapter. Note that it's important to specify **Python 3** as the default interpreter. Now is the time to clone the code from the repository into the homedir we created. Now it's time to bootstrap the application and check whether all settings are good and requirements are met. Now login as the user we have just created, to perform our very first reading! :: Now we configure `Supervisor <http://supervisord.org/>`_, which is used to run our application's web interface and background jobs used. It's also configured to bring the entire application up again after a shutdown or reboot. Now you'll have to install several utilities, required for the Nginx webserver, Gunicorn application server and cloning the application code from the Github repository:: Option A: Install DSMR-reader manually (quick) Option B: Install DSMR-reader manually (explained) Option C: Install DSMR-reader using Docker Option D: Install datalogger only Optional: Restore a database backup Optional: Your first reading Or execute the following to download it directly to the path above:: Or test with ``cu`` for **DSMR 2.2** (untested):: Other settings (``.env``) Our user also requires dialout permissions. So allow the user to perform a dialout by adding it to the ``dialout`` group:: Part 1 Part 2 Prepare static files for webinterface. This will copy all static files to the directory we created for Nginx earlier in the process. It allows us to have Nginx serve static files outside our project/code root. Receiving DSMR-reader instance Remote datalogger device Remove the default Nginx vhost (**only when you do not use it yourself, see the note above**):: Restoring a database backup? :doc:`See the FAQ for instructions <faq>`. Serial port or network socket config? Set password for database user:: Set the hostname or IP address in ``DATALOGGER_NETWORK_HOST`` and the port in ``DATALOGGER_NETWORK_PORT``. Setup local config:: Still no luck? Try editing ``/etc/environment``, add ``LC_ALL="en_US.utf-8"`` and reboot. Then try ``pg_createcluster 9.4 main --start`` again (or whatever version you are using). Supervisor Switch to the device you want to install the remote datalogger on. Sync static files:: Test with ``cu`` for **DSMR 4+**:: The ``.env`` file below is not mandatory to use. Alternatively you can specify all settings mentioned below as system environment variables. The application runs as ``dsmr`` user by default. This way we do not have to run the application as ``root``, which is a bad practice anyway. The application stores by default all readings taken from the serial cable. The application will also need the appropriate database client, which is not installed by default. For this I created two ready-to-use requirements files, which will also install all other dependencies required, such as the Django framework. The dependencies our application uses are stored in a separate environment, also called **VirtualEnv**. The device (or server) hosting the receiving DSMR-reader instance The device hosting the remote datalogger The following steps are also meant for the device you've just installed the remote datalogger on. The remote datalogger script has been overhauled in DSMR-reader ``v4.1``. If you installed a former version, reconsider reinstalling it completely with the new version below. The script should now forward telegrams to the API host(s) you specified. Then add the following contents to ``/home/dsmr/.env``:: These settings are **optional** but can be tweaked when required: This installation guide asumes you run the Nginx webserver for this application only. This may take a few seconds. When finished, you should see a new folder called ``dsmr-reader``, containing a clone of the Github repository. This will both activate the virtual environment and cd you into the right directory on your **next login** as ``dsmr`` user. This will install a datalogger that will forward telegrams to a remote instance of DSMR-reader, using its API. Three processes should be started or running. Make sure they don't end up in ``ERROR`` or ``BACKOFF`` state, so refresh with the ``status`` command a few times. To be clear, there should be two hosts: To exit cu, type "``q.``", hit Enter and wait for a few seconds. It should exit with the message ``Disconnected.``. Try: ``dpkg-reconfigure locales``. Use this to host both the datalogger and application on the same machine by installing it manually. Want to quit supervisor? Press ``CTRL + D`` to exit supervisor command line. When still in ``supervisorctl``'s console, type:: When using a different port or baud rate, change the ``DATALOGGER_SERIAL_PORT`` / ``DATALOGGER_SERIAL_BAUDRATE`` values accordingly. You can easily test whether you've configured this correctly by logging out the ``dsmr`` user (CTRL + D) and login again using ``sudo su - dsmr``. You now should see something similar to ``Connected.`` and a wall of text and numbers *within 10 seconds*. Nothing? Try different BAUD rate, as mentioned above. You might also check out a useful blog, `such as this one (Dutch) <http://gejanssen.com/howto/Slimme-meter-uitlezen/>`_. You should see the terminal have a ``(dsmrreader)`` prefix now, for example: ``(dsmrreader)dsmr@rasp:~/dsmr-reader $`` You've almost completed the installation now. ``DATALOGGER_DEBUG_LOGGING``: Set to ``true`` or ``1`` to enable verbose debug logging. Omit to disable. Warning: Enabling this logging for a long period of time on a Raspberry Pi may cause accelerated wearing of your SD card! ``DATALOGGER_SLEEP``: The time in seconds that the datalogger will pause after each telegram written to the DSMR-reader API. Omit to use the default value. ``DATALOGGER_TIMEOUT``: The timeout in seconds that applies to reading the serial port and/or writing to the DSMR-reader API. Omit to use the default value. ``xirixiz`` (Bram van Dartel) https://github.com/xirixiz/dsmr-reader-docker https://hub.docker.com/r/xirixiz/dsmr-reader-docker/ Project-Id-Version: DSMR Reader
Report-Msgid-Bugs-To: Dennis Siemensma <github@dennissiemensma.nl>
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Dennis Siemensma <github@dennissiemensma.nl>
Language: nl
Language-Team: Dennis Siemensma <github@dennissiemensma.nl>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 (!) Negeer voor de volgende drie commando's de foutmelding: '*could not change directory to "/root": Permission denied*'. **De installatie van de volgende afhankelijkheden kan enige tijd in beslag nemen**. Dit varieert en is sterk afhankelijk van de snelheid van je Internet-verbinding en je RaspberryPi. Je hoeft je dus niet zorgen te maken wanneer dit lang lijkt te duren. :] **OPTIONEEL**: Je kunt deze stap overslaan wanneer je al eerder een (test)meting hebt gedaan met je slimme meter. Ik raad het dus vooral aan als je nog nooit eerder je P1-poort hebt uitgelezen. Hiermee verzeker je jezelf ook dat de applicatie straks dezelfde (werkende) toegang heeft voor de metingen. *We configureren vervolgens de webserver (Nginx). Deze serveert alle statische bestanden en geeft de applicatie-verzoeken door naar de backend, waar de applicatie in Gunicorn draait onder Supervisor. Deze stellen we later in.* 1. Databaseopslag (PostgreSQL) 10. Supervisor 2. Afhankelijkheden 3. Applicatiegebruiker 4. Webserver/Nginx (deel 1) 5. Kloon project code vanaf Github 6. VirtualEnv 7. Applicatieconfiguratie 8. Initialisatie 9. Webserver/Nginx (deel 2) :doc:`Klaar? Ga dan naar applicatie instellen<../application>`. A. Seriële poort (``.env``) API-configuratie (``.env``) Voeg het schema (``http://``/``https://``) en hostnaam/poort toe aan ``DATALOGGER_API_HOSTS``. Voeg de API key toe aan ``DATALOGGER_API_KEYS``. Bijvoorbeeld:: Verder kun je hier het datalogger proces uitschakelen, gezien die toch niet nodig is:: Dit is allemaal erg handig, ondanks dat het feitelijk niets meer voorstelt dan een aparte map binnen de homedir van onze gebruiker. Hierdoor kunnen we namelijk meerdere versie van software op hetzelfde systeem installeren, zonder dat dat elkaar bijt. Meer informatie hierover `kan hier gevonden worden <http://docs.python-guide.org/en/latest/dev/virtualenvs/>`_. Gebruik je een kabel om telegrammen direct vanaf de seriële poort uit te lezen? Gebruik je een netwerk socket voor het uitlezen van de telegrammen? Bijvoorbeeld: ``ser2net``. Gebruik je dezelfde remote datalogger voor meerdere instanties van DSMR-reader? Gebruik dan ``DATALOGGER_API_HOSTS`` en ``DATALOGGER_API_KEYS`` als komma-gescheiden lijsten:: Auteur B. Netwerk socket (``.env``) Kies hieronder voor ofwel ``A.`` of ``B.``. Kies hieronder voor optie A, B, C of D. Kloon de repository:: Bevat alleen een lijst met commando's nodig voor de installatie van DSMR-reader. Inhoudsopgave Ga verder:: Kopieer de vhost voor de applicatie. Deze luistert standaard naar **elke hostname** (wildcard), maar dat is natuurlijk naar eigen wens aan te passen:: Kopieer de configuratie-bestanden voor Supervisor:: Maak een nieuw bestand ``/home/dsmr/dsmr_datalogger_api_client.py`` met deze inhoud: `dsmr_datalogger_api_client.py op GitHub <https://github.com/dsmrreader/dsmr-reader/blob/v4/dsmr_datalogger/scripts/dsmr_datalogger_api_client.py>`_ Maak een nieuwe Supervisor-config in ``/etc/supervisor/conf.d/dsmr_remote_datalogger.conf`` met inhoud:: Maak een nieuwe VirtualEnv aan. Het is gebruikelijk om hiervoor dezelfde naam te gebruiken als die van de applicatie of het project:: Maak een applicatie superuser aan met het volgende commando. De ``DSMR_USER`` en ``DSMR_PASSWORD`` :doc:`zoals ze in de Env-instellingen<../env_settings>` staan, worden daarbij gebruikt als inloggegevens. Maak een ander bestand genaamd ``/home/dsmr/.env`` aan en zet daar de volgende inhoud in:: Creëer databasegebruiker:: Creëer database, met als eigenaar de databasegebruiker die we net hebben aangemaakt:: Maak map aan voor de VirtualEnv van deze gebruiker:: Maak een aparte gebruiker aan met eigen homedir. De code voor de applicatie en VirtualEnv zetten we later hier in:: Datalogger script Django kopieert alle statische bestanden naar een aparte map, die weer door Nginx gebruikt wordt. Daarom is er tevens (schrijf)toegang voor nodig:: Docker Hub Start PostgreSQL niet wegens een fout in 'locales'? Bijvoorbeeld:: Elke keer dat je als ``dsmr`` gebruiker werkt, zul je moeten wisselen naar de virtualenv met deze commando's:: Ga ofwel door naar het volgende hoofdstuk **voor een testmeting** of ga direct door naar stap 4. Voer de volgende commando's in (**degene na de** ``>``). Dit zorgt ervoor dat Supervisor zijn eigen configuratie opnieuw controleert en toepast:: Voorbeeld van wanneer alles naar behoren draait:: Voer dit uit om de database te initialiseren:: Voer uit:: Voor alle andere gebruikers, die graag willen weten wat ze exact uitvoeren. Github Laat Supervisor zijn eigen instellingen uitlezen en doorvoeren, om het proces te starten:: Indien je een back-up van de database wilt terugzetten met je oude gegevens, nu is het moment om dat te doen. Wanneer je slimme meter alleen DSMR v2 ondersteunt (of je gebruikt een niet-Nederlandse slimme meter), zorg er dan voor dat je de DSMR-versie aanpast :doc:`in de datalogger-configuratie <../configuration>`, zodat DSMR-reader de telegrammen goed kan verwerken. Installeer ``cu``. Met dit programmaatje kunnen kun je vrij gemakkelijk de DSMR-verbinding testen naar je slimme meter toe. Erg handig om te kijken of dat überhaupt al lekker werkt:: Installeer database:: Installeer afhankelijkheden:: Installatie Het is uiteraard mogelijk dat andere applicaties ook Nginx gebruiken, maar daarvoor zul je de wildcard moet weghalen in de ``dsmr-webinterface`` vhost, die je hieronder kopieert. Houd het bestand open voor meerdere wijziginge / toevoegingen hieronder. Laat Nginx controleren of je geen typefouten hebt gemaakt en herstart Nginx vervolgens wanneer de ``-t`` configtest lukt:: Laten we ervoor zorgen dat deze commando's **automatisch** uitgevoerd worden, zodra we inloggen als ``dsmr`` gebruiker. Dit doen we door ze toe te voegen aan het ``~/.bashrc`` bestand:: Wissel naar de ``supervisorctl`` beheerconsole:: Zorg ervoor dat je eerste de API van de ontvangende DSMR-reader-instantie klaar hebt staan. Je kunt daar de API inschakelen en bijbehorende API-sleutel inzien/bewerken :doc:`in de configuratie<../configuration>`. Zorg ervoor dat je hier ``root``- of ``sudo``-gebruiker bent. Zo niet, druk op CTRL + D om uit te loggen als ``dsmr`` gebruiker. Zorg ervoor dat je ingelogd bent als ``dsmr``-gebruiker (zo niet, typ dan: ``sudo su - dsmr``) Zorg ervoor dat je nog steeds ingelogd bent als ``dsmr``-gebruiker (zo niet, typ dan: ``sudo su - dsmr``) Zorg ervoor dat je de bovenstaande notitie hebt gelezen en uitgevoerd, aangezien ze nodig zijn voor het volgende hoofdstuk. N.B.: het is belangrijk dat je voor deze VirtualEnv aangeeft dat **Python 3** de gewenste standaardversie is. Nu kunnen we de code van de applicatie van Github downloaden en in de homedir zetten die we net aangemaakt hebben. Tijd om te kijken of alles goed is ingesteld. We gaan de applicatie proberen te initialiseren. Log nu in als de gebruiker die we zojuist hebben aangemaakt voor de eerste testmeting! :: We gaan nu `Supervisor <http://supervisord.org/>`_ configureren, die gebruikt wordt om de applicatie en achtergrondprocessen te draaien. Tevens zorgt Supervisor ervoor dat deze processen bij het (opnieuw) opstarten automatisch draaien. Tijd om diverse tools te installeren. Deze zijn nodig voor de Nginx webserver, de Gunicorn applicatieserver en voor het binnenhalen van de code van de applicatie vanaf Github:: Optie A: Installeer DSMR-reader handmatig (snel) Optie B: Installeer DSMR-reader handmatig (toegelicht) Optie C: Installeer DSMR-reader met Docker Optie D: Installeer alleen de datalogger Optioneel: Database back-up terugzetten Optioneel: Je eerste meting Of voer het volgende uit om het direct op bovenstaand pad te downloaden:: Of test met ``cu`` voor **DSMR 2.2** (ongetest):: Overige instellingen (``.env``) De gebruiker heeft ook toegang nodig om de kabel te kunnen uitlezen. Hiervoor voegen de we gebruiker toe aan de groep ``dialout``:: Deel 1 Deel 2 Ga nu bezig met de statische bestanden voor de webinterface. Dit kopieert alle statische bestanden in de map die we eerder, vlak na de installatie voor Nginx, hebben aangemaakt. Het zorgt ervoor dat Nginx deze bestanden kan hosten buiten de code-bestanden. Ontvangende DSMR-reader-instantie Apparaat met remote datalogger Verwijder de standaard vhost van Nginx **wanneer je deze niet zelf gebruikt** (zie de notitie hierboven):: Database back-up terugzetten? :doc:`Zie de FAQ voor instructies <faq>`. Seriële poort of netwerk socket instellen? Stel wachtwoord in voor databasegebruiker:: Stel de hostnaam of IP-adres in als ``DATALOGGER_NETWORK_HOST``en de poort als ``DATALOGGER_NETWORK_PORT``. Stel lokale config in:: Werkt het nog steeds niet? Open dan dit bestand ``/etc/environment``, voeg onderaan de regel ``LC_ALL="en_US.utf-8"`` toe en herstart het systeem. Probeer daarna ``pg_createcluster 9.4 main --start`` (of welke versie je ook gebruikt). Supervisor Wissel naar het apparaat waarop je de remote datalogger wilt installeren. Synchroniseer statische bestanden:: Test met ``cu`` voor **DSMR 4+**:: Je bent niet verplicht om het ``.env``-bestand te gebruiken. Als alternatief kun je alle instellingen hieronder ook als systeem-omgevingsvariabelen instellen. De applicatie draait standaard onder de gebruiker ``dsmr``. Hierdoor heeft het geen ``root``-rechten (nodig), wat over het algemeen zeer afgeraden wordt. De applicatie slaat de P1-metingen standaard op. De applicatie heeft een databaseconnector nodig om de gegevens te kunnen opslaan. Daarvoor heb ik een tweetal requirements-bestanden gemaakt, waar alles al in staat wat nodig is. Zoals bijvoorbeeld Django en de databaseverbinding. Alle (externe) afhankelijkheden worden opgeslagen in een aparte omgeving, ook wel **VirtualEnv** genoemd. Het apparaat (of server) waarop de ontvangende DSMR-reader-instantie draait Het apparaat waar de remote datalogger op draait De stappen hieronder zijn eveneens bedoeld voor het apparaat waar je net de remote datalogger op geinstalleerd hebt. Het script voor de remote datalogger is op de schop gegaan in DSMR-reader ``v4.1``. Mocht je een eerdere versie gebruiken, overweeg dan om deze opnieuw te installeren met de nieuwere versie hieronder. Het script zou nu telegrammen moeten doorsturen naar de API host(s) die je eerder hebt ingevoerd. Voeg dan de volgende inhoud toe aan ``/home/dsmr/.env``:: De volgende instellingen zijn **optioneel** en kunnen naar wens aangepast worden, wanneer nodig: Deze installatiehandleiding gaat er vanuit dat je de Nginx webserver alleen gebruikt voor deze applicatie. Dit kan enkele seconden in beslag nemen. Als het goed is zie je hierna een map genaamd ``dsmr-reader``, met daarin een kopie van de repository zoals die op Github staat. Hiermee wordt zowel de VirtualEnv geactiveerd en ga je direct naar de juiste map. Dit werkt de **eerstvolgende keer** dat je inlogt als ``dsmr`` gebruiker. Dit installeert een datalogger, die telegrammen doorstuurt naar een installatie van DSMR-reader op afstand, via de API. Er draaien als het goed is altijd **drie** processen. Kijk goed of ze uiteindelijk niet in ``ERROR`` of ``BACKOFF`` status terecht zijn gekomen. Je kunt het overzicht verversen door ``status`` te typen. Voor de duidelijkheid, er zouden twee omgevingen moeten zijn: Om cu af te sluiten, typ "``q.``", druk op Enter en wacht voor een paar seconden. Het programma sluit af met de melding ``Disconnected.``. Probeer: ``dpkg-reconfigure locales``. Gebruik dit om zowel de datalogger als de applicatie op hetzelfde apparaat te installeren. Wil je uit supervisor? Druk dan op ``CTRL + D`` om uit supervisor te gaan. Typ het volgende wanneer je nog in ``supervisorctl``'s console bent:: Als je een andere poort of baud waarde gebruikt, wijzig dit dan in  ``DATALOGGER_SERIAL_PORT`` / ``DATALOGGER_SERIAL_BAUDRATE``. Je kunt dit vrij gemakkelijk testen door uit te loggen als ``dsmr`` gebruiker (met CTRL + D) en vervolgens weer in te loggen met ``sudo su - dsmr``. Je zou nu iets moeten zien als ``Connected.``. Vervolgens krijg je, als het goed is, binnen tien seconden een hele lap tekst te zijn met een hoop cijfers. Werkt het niet? Probeer dan een andere BAUD-waarde, zoals hierboven beschreven. Of `kijk op een nuttig weblog <http://gejanssen.com/howto/Slimme-meter-uitlezen/>`_. Als het goed is heeft je terminal nu een ``(dsmrreader)`` prefix, bijvoorbeeld: ``(dsmrreader)dsmr@rasp:~/dsmr-reader $`` Je bent op dit punt bijna klaar met de installatie. ``DATALOGGER_DEBUG_LOGGING``: Stel in op ``true`` of ``1`` om uitgebreide debug-logging in te schakelen. Laat weg om uit te schakelen. Waarschuwing: Indien voor langere tijd ingeschakeld kan dit bijdragen aan de slijtage van je SD-kaartje op een Raspberry Pi! ``DATALOGGER_SLEEP``: De tijd in seconden dat de remote datalogger pauseert, nadat deze een telegram naar de DSMR-reader API heeft verstuurt. Laat weg om de standaardwaarde te gebruiken. ``DATALOGGER_TIMEOUT``: De tijd in seconden dat maximaal gewacht wordt op de datalogger en de ontvangende DSMR-reader API. Laat weg om de standaardwaarde te gebruiken. ``xirixiz`` (Bram van Dartel) https://github.com/xirixiz/dsmr-reader-docker https://hub.docker.com/r/xirixiz/dsmr-reader-docker/ 