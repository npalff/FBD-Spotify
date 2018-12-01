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
  primary key (USERID, CONTRACTID),
  foreign key(USERID) references _user
  	on delete cascade
  	on update restrict,
  foreign key(CONTRACTID) references contract
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
insert into plan values('FAM','FAMILY',20,false);
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
insert into music values('MUS837401728122','Garota de Ipanema','BRMUS');


select * from music;

--ALBUNS:
insert into album values('ALB019274659', 'Musicas Brasileiras', 'BRMUS');

select * from album;

--ARTISTAS:
insert into artist values('ART83740293','Skank','ROCK0','POP00');
insert into artist values('ART83750293','Johann Sebastian Bach','CLAS0');
insert into artist values('ART83740193','Tom Jobim','BRMUS');


select * from artist;
