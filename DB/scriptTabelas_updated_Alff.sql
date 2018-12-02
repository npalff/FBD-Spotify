drop table if  exists waitingConfirmation;
drop table if  exists subscription;
drop table if  exists lib_playlist;
drop table if  exists lib_music;
drop table if  exists playlist_music;
drop table if  exists album_music;
drop table if  exists artist_album;
drop table if  exists artist_music;
drop table if  exists adv_contact;
drop table if  exists contract_cover;
drop table if  exists clickers;
drop table if  exists signed;
drop table if  exists _user;
drop table if  exists country;
drop table if  exists plan;
drop table if  exists music;
drop table if  exists playlist;
drop table if  exists album;
drop table if  exists artist;
drop table if  exists genre;
drop table if  exists payment;
drop table if  exists contract;
drop table if  exists advertise;
drop table if  exists advertiser;
drop table if  exists document;

create table country
(
COUNTRYID char(3) not null,
COUNTRYNAME varchar(30) not null unique,
primary key(COUNTRYID)
);

create table _user
(
  USERID char(10) not null,
  USERNAME varchar(20) not null unique,
  EMAIL varchar(40) not null unique,
  PASS varchar(20) not null,
  PREMIUMSTATE numeric(1) not null,
  USERCOUNTRY char(3) not null,
  LIBID char(10) not null unique,
  primary key(USERID),
  foreign key(USERCOUNTRY) references country
	on delete restrict
	on update cascade
);


create table plan
(
  PLANID char(3) not null,
  PLANNAME varchar(20) not null unique,
  PRICE numeric(6,2) not null,
  AVAILABLE boolean not null, 
  primary key(PLANID)

);

create table genre
(
  GENREID char(5) not null,
  GENRENAME varchar(30) not null unique,
  primary key(GENREID)
);


create table playlist
(
  PLAYID char(15) not null,
  PLAYNAME varchar(50) not null,
  ISPUBLIC boolean not null,
  GENRE1 char(5),
  GENRE2 char(5),
  primary key(PLAYID),
  foreign key(GENRE1) references genre
  	on delete set null
  	on update cascade,
  foreign key(GENRE2) references genre
  	on delete set null
  	on update cascade
);

create table music
(
  MUSICID char(15) not null,
  MUSICNAME varchar(30) not null,
  GENRE1 char(5),
  GENRE2 char(5),
  primary key(MUSICID),
  foreign key(GENRE1) references genre
  	on delete set null
  	on update cascade,
  foreign key(GENRE2) references genre
  	on delete set null
  	on update cascade
);


create table album
(
  ALBUMID char(12) not null,
  ALBUMNAME varchar(40) not null,
  GENRE1 char(5),
  GENRE2 char(5),
  primary key(ALBUMID),
  foreign key(GENRE1) references genre
  	on delete set null
  	on update cascade,
  foreign key(GENRE2) references genre
  	on delete set null
  	on update cascade
);


create table artist
(
  ARTID char(11) not null,
  ARTNAME varchar(30) not null,
  GENRE1 char(5),
  GENRE2 char(5),
  primary key(ARTID),
  foreign key(GENRE1) references genre
  	on delete set null
  	on update cascade,
  foreign key(GENRE2) references genre
  	on delete set null
  	on update cascade
);


create table contract
(
  CONTRACTID char(10) not null,
  VALUE numeric(8,2) not null,
  SIGNDATE date,
  EXPDATE date,
  DOCID char(10) not null,
  TYPE numeric(1) not null,
  primary key(CONTRACTID)
);

create table advertiser
(
   ADVID char(10) not null,
   ADVNAME varchar(30) not null,
   primary key(ADVID)
);


create table payment
(
  PAYID char(15) not null,
  VALUE numeric(6,2) not null,
  RECEIVED boolean not null,
  GENDATE date not null,
  EXPDATE date not null,
  DATERECEIV date,
  CONTRACTID char(10),
  primary key(PAYID),
  foreign key(CONTRACTID) references contract
  	on delete set null
  	on update restrict
);


create table document
(
  DOCID char(10) not null,
  DOCLOC varchar(30) not null,
  primary key(DOCID)
);


create table advertise
(
  ADID char(10) not null,
  SHOWCOUNT numeric(8)  not null,
  CLICKCOUNT numeric(8)  not null,
  primary key(ADID)
);


create table waitingConfirmation
(
  USERID char(10) not null,
  CONTRACTID char(10) not null,
  HOLDERID char(10) not null,
  primary key (USERID, CONTRACTID),
  foreign key(USERID) references _user
  	on delete cascade
  	on update restrict,
  foreign key(CONTRACTID) references contract
  	on delete cascade
  	on update restrict,
  foreign key(HOLDERID) references _user
  	on delete cascade
  	on update restrict
);

create table subscription
(
  CONTRACTID char(10) not null,
  USERID char(10) not null,
  HOLDERID char(10) not null unique,
  PLANID char(3) not null,
  foreign key(CONTRACTID) references contract
  	on delete restrict
  	on update restrict,
  foreign key(USERID) references _user
  	on delete cascade
  	on update restrict,
  foreign key(HOLDERID) references _user
  	on delete cascade
  	on update restrict,
  foreign key(PLANID) references plan
  	on delete restrict
  	on update restrict
);


create table lib_playlist
(
  LIBID char(10) not null,
  PLAYID char(15) not null,
  primary key(LIBID, PLAYID),
  foreign key(LIBID) references _user(LIBID)
  	on delete cascade
  	on update restrict,
  foreign key(PLAYID) references playlist
  	on delete cascade
  	on update restrict
);



create table lib_music
(
  LIBID char(10) not null,
  MUSICID char(15) not null,
  primary key(LIBID, MUSICID),
  foreign key(LIBID) references _user(LIBID)
  	on delete cascade
  	on update restrict,
  foreign key(MUSICID) references music
  	on delete cascade
  	on update restrict
);



create table playlist_music
(
  PLAYID char(15) not null,
  MUSICID char(15) not null,
  primary key(PLAYID, MUSICID),
  foreign key(PLAYID) references playlist
  	on delete cascade
  	on update restrict,
  foreign key(MUSICID) references music
  	on delete cascade
  	on update restrict
);


create table album_music
(
  ALBUMID char(12) not null,
  MUSICID char(15) not null,
  primary key(ALBUMID, MUSICID),
  foreign key(ALBUMID) references album
  	on delete cascade
  	on update restrict,
  foreign key(MUSICID) references music
  	on delete restrict
  	on update restrict
);

create table artist_album
(
  ALBUMID char(12) not null,
  ARTID char(11) not null,
  primary key(ALBUMID, ARTID),
  foreign key(ALBUMID) references album
  	on delete cascade
  	on update restrict,
  foreign key(ARTID) references artist
  	on delete restrict
  	on update restrict
);


create table artist_music
(
  ARTID char(11) not null,
  MUSICID char(15) not null,
  primary key(ARTID, MUSICID),
  foreign key(ARTID) references artist
  	on delete restrict
  	on update restrict,
  foreign key(MUSICID) references music
  	on delete cascade
  	on update restrict
);



create table adv_contact
(
  ADVID char(10) not null,
  CONTACT varchar(50) not null,
  primary key(ADVID, CONTACT),
  foreign key(ADVID) references advertiser
  	on delete cascade
  	on update restrict
);


create table signed
(
  CONTRACTID char(10) not null,
  ADVID char(10) not null,
  primary key(CONTRACTID, ADVID),
  foreign key(CONTRACTID) references contract
  	on delete restrict
  	on update restrict,
  foreign key(ADVID) references advertiser
  	on delete restrict
  	on update restrict
);



create table clickers
(
  ADID char(10) not null,
  USERID char(10) not null,
  primary key(ADID, USERID),
  foreign key(ADID) references advertise
  	on delete cascade
  	on update restrict,
  foreign key(USERID) references _user
  	on delete set null
  	on update restrict
);



create table contract_cover
(
  COVERID numeric(10) not null,
  CONTRACTID char(10),
  COUNTRYID char(3) not null,
  ADID char(10) not null,
  primary key(COVERID),
  foreign key(CONTRACTID) references contract
  	on delete restrict
  	on update restrict,
  foreign key(ADID) references advertise
  	on delete cascade
  	on update restrict,
  foreign key(COUNTRYID) references country
  	on delete restrict
  	on update cascade
);


 -- Instancias de Country:
 insert into country values ('BRA','BRASIL');
 insert into country values ('USA','ESTADOS UNIDOS');
 insert into country values ('GER','ALEMANHA');
 insert into country values ('FRA','FRANÇA');
 insert into country values ('POR','PORTUGAL');
 insert into country values ('ESP','ESPANHA');
 insert into country values ('ING','REINO UNIDO');
 insert into country values ('ITA','ITALIA');
 insert into country values ('CAN','CANADA');
 insert into country values ('SWE','SUÉCIA');
 --insert into country values ('','');
  
select *
from country;

-- Usuários:
insert into _user values('SR38A9C5BR','salvDali','salv_dali@domain.com','12thisAintMaPass',0,'BRA','LIB1054357');
insert into _user values('SR65879ABR','fang','fangorn@gmail.com','457oiui#a',1,'BRA','LIB1254617');
insert into _user values('SR3B56D5BR','joaoP','joao_pedro@gmail.com','asd1234',1,'BRA','LIB1054859');
insert into _user values('SR4BA135BR','duda465','duda465@domain.com','male5548!',1,'BRA','LIB1057547');

select *
from _user;

--Planos:
insert into plan values('PRE','PREMIUM',16.90,true);
insert into plan values('FAM','FAMILY',20,true);
insert into plan values('STU','STUDENT',8.50,true);
insert into plan values('FRE','FREE',0,false);

select *
from plan;

--Generos:
insert into genre values('ROCK0','Rock');
insert into genre values('POP00','Pop');
insert into genre values('BRMUS','Musica Brasileira');
insert into genre values('SERT0','Sertanejo');
insert into genre values('CLAS0','Música Clássica');
insert into genre values('FUNK0','Funk');
insert into genre values('INDIE','Indie');
insert into genre values('ELETR','Eletronica');
insert into genre values('METAL','Metal');
insert into genre values('JAZZ0','Jazz');
insert into genre values('MPB00','Música Popular Brasileira');
insert into genre values('BOSNV','Bossa Nova');

select *
from genre;


--Playlist:
insert into playlist values('PL3740192837461', 'The 60s are back', true,'ROCK0', 'POP00');

select *
from playlist;

--MUSICAS:
insert into music values('MUS837401728492','Sweet Child O Mine','ROCK0');
insert into music values('MUS837401828492','Independência','ROCK0','POP00');
insert into music values('MUS837441928492','Evidências','BRMUS','SERT0');
insert into music values('MUS332409297808','Next to Me','ROCK0');
insert into music values('MUS266909386861','I Don`t Know Why','ROCK0');
insert into music values('MUS755193587759','Believer','ROCK0','ELETR');
insert into music values('MUS370623362564','Rise Up','ROCK0');
insert into music values('MUS454041258580','Dancing In The Dark','ROCK0');
insert into music values('MUS554952917205','Castle on the Hill','INDIE','POP00');
insert into music values('MUS935191998048','Shape of You','INDIE','POP00');
insert into music values('MUS737006219502','Perfect','INDIE','POP00');
insert into music values('MUS630101192521','Barcelona','INDIE','POP00');
insert into music values('MUS405389935381','Dive','INDIE','POP00');
insert into music values('MUS404209528501','Mamma Mia','POP00');
insert into music values('MUS752990714170','S.O.S.','POP00');
insert into music values('MUS419094411426','Rock Me','POP00');
insert into music values('MUS904261820951','Crazy World','POP00');
insert into music values('MUS495587782738','Welcome To My Life','ROCK0','PUNK0');
insert into music values('MUS311209835116','Perfect World','ROCK0','PUNK0');
insert into music values('MUS441351335036','Me Against The World','ROCK0','PUNK0');
insert into music values('MUS321125420820','Untitled','ROCK0','PUNK0');
insert into music values('MUS803627890242','Take my Hand','ROCK0','PUNK0');
insert into music values('MUS499678189033','The End','ROCK0','PUNK0');
insert into music values('MUS510080132241','Save You','ROCK0','PUNK0');
insert into music values('MUS228473132080','You Suck At Love','ROCK0','PUNK0');
insert into music values('MUS346863688404','Astronaut','ROCK0');
insert into music values('MUS791445420693','Loser Of The Year','ROCK0');
insert into music values('MUS401692849216','A garota de Ipanema','BRMUS','BOSNV');
insert into music values('MUS465730078441','Corcovado','BRMUS','BOSNV');
insert into music values('MUS163639085346','Água de Beber','BRMUS','BOSNV');
insert into music values('MUS215217021095','O Grande Amor','BRMUS','BOSNV');
insert into music values('MUS748362550431','Independência','BRMUS');
insert into music values('MUS917486503201','Depois da Meia Noite','BRMUS','ROCK0');
insert into music values('MUS517656588407','Que País é Esse?','BRMUS','ROCK0');
insert into music values('MUS492164908762','Fátima','BRMUS');
insert into music values('MUS769656264453','Metamorfose Ambulante','BRMUS','MPB00');
insert into music values('MUS452082827221','Eu Nasci há 10 Mil Anos Atrás','BRMUS','MPB00');
insert into music values('MUS122683391529','A Hora Do Trem','BRMUS','BRMUS');
insert into music values('MUS223996176968','Novo Aeon','BRMUS');
insert into music values('MUS632071860242','Wake me Up','ELETR');
insert into music values('MUS620191878095','Hey Brother','ELETR');
insert into music values('MUS886791081825','Liar Liar','ELETR');
insert into music values('MUS743001163796','Story of my Life','CLAS0');
insert into music values('MUS446643415008','Let it Go','CLAS0');
insert into music values('MUS623910304593','Batman Evolution','CLAS0');
insert into music values('MUS514042991087','Lord of the Rings','CLAS0');
insert into music values('MUS151464375612','Nascemos Pra Cantar','BRMUS','SERT0');
insert into music values('MUS612402017387','Alô','BRMUS','SERT0');
insert into music values('MUS147627982192','Evidências','BRMUS','SERT0');
insert into music values('MUS726627602241','Era Uma Vez','BRMUS','SERT0');


select * from music;

--ALBUNS:
insert into album values('ALB019274659', 'Musicas Brasileiras', 'BRMUS');
insert into album values('ALB563372963', 'Evolve', 'ROCK0','ELETR');
insert into album values('ALB427886832', '÷', 'ROCK0');
insert into album values('ALB55247632', 'Mamma Mia!', 'POP00');
insert into album values('ALB21680880', 'Still Not Getting Any', 'ROCK0','PUNK0');
insert into album values('ALB502330527', 'Simple Plan', 'ROCK0','PUNK0');
insert into album values('ALB911494226', 'Get Your Heart On!', 'ROCK0','PUNK0');
insert into album values('ALB320972960', 'Garota de Ipanema', 'BRMUS','BOSNV');
insert into album values('ALB321679927', 'Rock in Rio 2011', 'ROCK0','BRMUS');
insert into album values('ALB503744461', 'A Arte de Raul Seixas', 'BRMUS','MPB00');
insert into album values('ALB916339644', 'True', 'ELETR','ROCK0');
insert into album values('ALB675586793', 'Wonders', 'CLAS0');
insert into album values('ALB77113286', 'Elas em Evidências', 'BRMUS','SERT0');


select * from album;

--ARTISTAS:
insert into artist values('ART83740293','Skank','ROCK0','POP00');
insert into artist values('ART83750293','Johann Sebastian Bach','CLAS0');
insert into artist values('ART83740193','Tom Jobim','BRMUS', 'BOSNV');
insert into artist values('ART51372041','Imagine Dragons','ELETR', 'ROCK0');
insert into artist values('ART42678568','Ed Sheeran','POP00', 'INDIE');
insert into artist values('ART98477554','Abba','POP00');
insert into artist values('ART24444317','Simple Plan','ROCK0', 'PUNK0');
insert into artist values('ART30417603','Capital Inicial','BRMUS', 'ROCK0');
insert into artist values('ART87095276','Raul Seixas','BRMUS', 'MPB00');
insert into artist values('ART92880259','Avicii','ELETR', 'ROCK0');
insert into artist values('ART84684495','The Piano Guys','CLAS0');
insert into artist values('ART46692091','Chitãozinho e Xororó','BRMUS', 'SERT0');

select * from artist;

--CONTRATOS

insert into contract values('CT38B978BR', 16.90,'10-06-2018','10-12-2018','DOC12485BR',2);
insert into contract values('CT38A778BR', 350000,'05-06-2018','05-10-2018','DOC13485BR',1);
insert into contract values('CT832196BR', 650000,'01-01-2018','01-01-2019','DOC58352BR',1);
insert into contract values('CT763126BR', 100000,'10-12-2018','10-01-2019','DOC13045BR',1);
insert into contract values('CT633045BR', 8.50,'10-12-2018','10-01-2019','DOC87252BR',2);
insert into contract values('CT744062BR', 20.00,'10-11-2018','10-12-2018','DOC92368BR',2);
insert into contract values('CT000001BR', 00.00,'10-11-2018','10-12-2025','DOC00001BR',0); 

select * from contract;

--ADVERTISER
insert into advertiser values('ADV759289','Coca-Cola'); 
insert into advertiser values('ADV759249','Crina Brilhante SA');
insert into advertiser values('ADV759259','YouTube');
insert into advertiser values('ADV292901','McDonalds');
insert into advertiser values('ADV189046','Spotify');
insert into advertiser values('ADV544016','Fang Company');
insert into advertiser values('ADV123598','WikiPedia');
insert into advertiser values('ADV282653','Google');
insert into advertiser values('ADV735016','Microsoft');



select * from advertiser;

-- PAYMENNTS
insert into payment values('PAY839203928394',16.90,true,'09-06-2018','14-10-2018','11-10-2018','CT38B978BR');
insert into payment values('PAY693700543015',16.90,false,'09-06-2018','11-10-2018','CT38B978BR');
insert into payment values('PAY707720324996',16.90,true,'15-10-2018','18-10-2018','17-10-2018','CT38B978BR');
insert into payment values('PAY325013997392',350000,true,'09-05-2018','14-05-2018','11-05-2018','CT38A778BR');
insert into payment values('PAY804228814360',350000,true,'10-06-2018','14-06-2018','11-06-2018','CT38A778BR');
insert into payment values('PAY133788432121',650000,true,'09-12-2017','14-12-2017','11-12-2017','CT832196BR');
insert into payment values('PAY777602716397',650000,false,'29-11-2018','14-12-2018','CT832196BR');
insert into payment values('PAY326493833787',100000,true,'20-11-2018','24-11-2018','21-11-2018','CT763126BR');
insert into payment values('PAY793300952268',8.50,true,'10-11-2018','28-11-2018','11-11-2018','CT633045BR');
insert into payment values('PAY504805424065',8.50,true,'01-12-2018','29-12-2018','12-12-2018','CT633045BR');
insert into payment values('PAY975979006570',20,false,'05-12-2018','10-12-2018','CT744062BR');
insert into payment values('PAY288457351224',0,true,'01-01-2018','03-01-2018','01-02-2018','CT000001BR');

select * from payment;

--DOCUMENTS

insert into document values('DOC12485BR','./data/Docs/myDOC12485BR.pdf');
insert into document values('DOC13485BR','./data/Docs/myDOC13485BR.pdf');
insert into document values('DOC58352BR','./data/Docs/myDOC58352BR.pdf');
insert into document values('DOC13045BR','./data/Docs/myDOC13045BR.pdf');
insert into document values('DOC87252BR','./data/Docs/myDOC87252BR.pdf');
insert into document values('DOC92368BR','./data/Docs/myDOC92368BR.pdf');
insert into document values('DOC00001BR','./data/Docs/myDOC00001BR.pdf');

select * from document;

--ADVERTISE
insert into advertise values('AD82402847',250,10);
insert into advertise values('AD54388617',500,400);
insert into advertise values('AD70985105',1000,152);
insert into advertise values('AD48747680',300,15);
insert into advertise values('AD52184055',350,30);
insert into advertise values('AD39222699',30,1);
insert into advertise values('AD39233587',1100,250);
insert into advertise values('AD59957494',459,152);

select * from advertise ;
--waitingConfirmation
insert into waitingConfirmation values('SR38A9C5BR','CT38B978BR','SR38A9C5BR');
insert into waitingConfirmation values('SR38A9C5BR','CT38B978BR','SR38A9C5BR');
insert into waitingConfirmation values('SR38A9C5BR','CT38B978BR','SR38A9C5BR');
insert into waitingConfirmation values('SR38A9C5BR','CT38B978BR','SR38A9C5BR');
insert into waitingConfirmation values('SR38A9C5BR','CT38B978BR','SR38A9C5BR');


select * from waitingConfirmation;


--SUBSCRIPTIONS
insert into subscription values('CT38B978BR', 'SR38A9C5BR', 'SR38A9C5BR', 'PRE');

select * from subscription;

--LIB_PLAYLIST
insert into lib_playlist values('LIB1054357','PL3740192837461');

select * from lib_playlist;

--LIB_MUSIC
insert into lib_music values ('LIB1054357','MUS837401728122');

select * from lib_music;

--PLAYLIST_MUSIC
insert into playlist_music values('PL3740192837461','MUS837401728122');

select * from playlist_music;

--ALBUM_MUSIC
insert into album_music values('ALB019274659','MUS837401728122');


select * from album_music;

--ARTIST_ALBUM
insert into artist_album values('ALB019274659','ART83740193');

select * from artist_album;

--ARTIST_MUSIC
insert into artist_music values ('ART83740193','MUS837401728122');

select * from artist_music;

--ADV_CONTACT
insert into adv_contact values('ADV759289','Rua indeterminada, nr 012');
in2sert into adv_contact values('ADV759259','contact@youtube.com');

select * from adv_contact;

--SIGNED
insert into signed values('CT38A778BR','ADV759289');
insert into signed values('CT38A778BR','ADV759259');

select * from signed;

--CLICKERS
insert into clickers values('AD82402847','SR38A9C5BR');

select * from clickers;

--CONTRACT_COVER
 insert into contract_cover values(8375018395, 'CT38A778BR','BRA','AD82402847');

 select * from contract_cover;




