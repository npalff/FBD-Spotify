drop table if  exists _user;
drop table if  exists country;
drop table if  exists library;
drop table if  exists playlist;
drop table if  exists genre;
drop table if  exists music;
drop table if  exists album;
drop table if  exists artist;
drop table if  exists advertise;
drop table if  exists plan;
drop table if  exists plancontract;
drop table if  exists contract;
drop table if  exists advcontract;
drop table if  exists advertiser;

create table country
(
COUNTRYID char(3) not null,
COUNTRYNAME varchar(40) not null,
primary key(COUNTRYID)
);

create table _user
(
USERID 	    char(6) not null,
USERNAME    varchar(30) not null,
USEREMAIL   varchar(40) not null,
USERCOUNTRY char(3) not null,
primary key(USERID),
foreign key(usercountry) references country
);


-- Verificar como linkar com USER
create table library
(
IDLIB char(3) not null,
primary key(IDLIB)
);

create table playlist
(
PLAYID char(3) not null,
PLAYNAME varchar(50) not null,
ISPUBLIC char(1) not null, -- T or F
primary key(PLAYID)
);

create table genre
(
GENREID char(3) not null,
GENRENAME varchar(30) not null,
primary key(GENREID)
);

create table music
(
MUSICID char(8) not null,
MUSICNAME varchar(30) not null,
primary key(MUSICID)
);

create table album
(
ALBUMID char(8) not null,
ALBUMNAME varchar(20) not null,
primary key(ALBUMID)
);

create table artist
(
ARTID char(5) not null,
ARTNAME varchar(40) not null,
primary key(ARTID)
);

create table advertise
(
ADVID char(5) not null,
SHOWCOUNT numeric  not null,
CLICKCOUNT numeric  not null,
primary key(ADVID)
);
create table plan
(
PLANID char(3) not null,
PLANNAME varchar(20),
PRICE numeric not null,
AVAILABLE char(1) not null, -- T or F
primary key(PLANID)
);

create table plancontract
(
  SIGNDATE char(8) not null, --DDMMAAAA
  EXPIREDATE char(8) not null, --DDMMAAAA
  HOLDER char(3) not null,
  primary key(HOLDER),
  --foreign key(HOLDER) references 
);

create table contract
(
  CONTRACTID char(6) not null,
  CONTDOC char(8) not null,
  primary key(CONTRACTID)
);

create table advcontract
(
  ACID char(3) not null, -- Advertising Contract ID
  SIGNDATE char(8), --DDMMAAAA
  EXPIREDATE char(8), --DDMMAAAA
  primary key(ACID)
   
);
create table advertiser
(
 ADVID char(3),
 ADVNAME varchar(30),
 CONTRACTINFO char(3),
 primary key(ADVID),
 foreign key(CONTRACTINFO) references advcontract
);

