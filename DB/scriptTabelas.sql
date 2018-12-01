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

insert into country values ('BRA','BRASIL');

select *
from country;

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

insert into _user values('SR38A9C5BR','salvDali','salv_dali@domain.com','12thisAintMaPass',0,'BRA','LIB1054357');

select *
from _user;

create table plan
(
  PLANID char(3) not null,
  PLANNAME varchar(20) not null unique,
  PRICE numeric(6,2) not null,
  AVAILABLE boolean not null, 
  primary key(PLANID)

);
insert into plan values('PRE','PREMIUM',16.90,true);
insert into plan values('FAM','FAMILY',20,false);

select *
from plan;

create table genre
(
  GENREID char(5) not null,
  GENRENAME varchar(30) not null unique,
  primary key(GENREID)
);

insert into genre values('ROCK0','Rock');
insert into genre values('POP00','Pop');
insert into genre values('BRMUS','Musica Brasileira');
insert into genre values('SERT0','Sertanejo');
insert into genre values('CLAS0','Música Clássica');

select *
from genre;


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

insert into playlist values('PL3740192837461', 'The 60s are back', true,'ROCK0', 'POP00');

select *
from playlist;

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

insert into music values('MUS837401728492','Sweet Child O Mine','ROCK0');
insert into music values('MUS837401828492','Independência','ROCK0','POP00');
insert into music values('MUS837441928492','Evidências','BRMUS','SERT0');
insert into music values('MUS837401728122','Garota de Ipanema','BRMUS');


select * from music;

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

insert into album values('ALB019274659', 'Musicas Brasileiras', 'BRMUS');

select * from album;

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

insert into artist values('ART83740293','Skank','ROCK0','POP00');
insert into artist values('ART83750293','Johann Sebastian Bach','CLAS0');
insert into artist values('ART83740193','Tom Jobim','BRMUS');


select * from artist;


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

insert into contract values('CT38B978BR', 19.90,'10-06-2018','10-12-2018','DOC12485BR',2);
insert into contract values('CT38A778BR', 250000,'05-06-2018','05-10-2018','DOC13485BR',1);



select * from contract;

create table advertiser
(
   ADVID char(10) not null,
   ADVNAME varchar(30) not null,
   primary key(ADVID)
);

insert into advertiser values('ADV759289','Coca-Cola'); 
insert into advertiser values('ADV759249','Crina Brilhante SA');
insert into advertiser values('ADV759259','YouTube');

select * from advertiser;

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

insert into payment values('PAY839203928394',16.90,true,'09-10-2018','14-10-2018','11-10-2018','CT38B978BR');

select * from payment;

create table document
(
  DOCID char(10) not null,
  DOCLOC varchar(30) not null,
  primary key(DOCID)
);

insert into document values('DOC12485BR','./data/Docs/myDOC12485BR.pdf');

select * from document;

create table advertise
(
  ADID char(10) not null,
  SHOWCOUNT numeric(8)  not null,
  CLICKCOUNT numeric(8)  not null,
  primary key(ADID)
);

insert into advertise values('AD82402847',250,10);

select * from advertise ;

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

insert into waitingConfirmation values('SR38A9C5BR','CT38B978BR');

select * from waitingConfirmation;

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

insert into subscription values('CT38B978BR', 'SR38A9C5BR', 'SR38A9C5BR', 'PRE');

select * from subscription;

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

insert into lib_playlist values('LIB1054357','PL3740192837461');

select * from lib_playlist;

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

insert into lib_music values ('LIB1054357','MUS837401728122');

select * from lib_music;

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

insert into playlist_music values('PL3740192837461','MUS837401728122');

select * from playlist_music;

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
insert into album_music values('ALB019274659','MUS837401728122');


select * from album_music;

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

insert into artist_album values('ALB019274659','ART83740193');

select * from artist_album;

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

insert into artist_music values ('ART83740193','MUS837401728122');

select * from artist_music;

create table adv_contact
(
  ADVID char(10) not null,
  CONTACT varchar(50) not null,
  primary key(ADVID, CONTACT),
  foreign key(ADVID) references advertiser
  	on delete cascade
  	on update restrict
);

insert into adv_contact values('ADV759289','Rua indeterminada, nr 012');
insert into adv_contact values('ADV759259','contact@youtube.com');

select * from adv_contact;

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

insert into signed values('CT38A778BR','ADV759289');
insert into signed values('CT38A778BR','ADV759259');

select * from signed;

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

insert into clickers values('AD82402847','SR38A9C5BR');

select * from clickers;

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

 insert into contract_cover values(8375018395, 'CT38A778BR','BRA','AD82402847');

 select * from contract_cover;