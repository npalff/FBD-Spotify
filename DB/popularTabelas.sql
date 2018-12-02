
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
  
-- Usuários:
insert into _user values('SR38A9C5BR','salvDali','salv_dali@domain.com','12thisAintMaPass',0,'BRA','LIB1054357');
insert into _user values('SR65879ABR','fang','fangorn@gmail.com','457oiui#a',1,'BRA','LIB1254617');
insert into _user values('SR3B56D5BR','joaoP','joao_pedro@gmail.com','asd1234',1,'BRA','LIB1054859');
insert into _user values('SR4BA135BR','duda465','duda465@domain.com','male5548!',1,'BRA','LIB1057547');
insert into _user values('SR468950BR','Guilherme','gui.lherme@gmail.com','gui123',1,'BRA','LIB4064848');
insert into _user values('SR128102BR','jorge45','jorge_silva@gmail.com','#50adVWRa',0,'BRA','LIB8648628');
insert into _user values('SR380530BR','Maria00','maria.duda@domain.com','asdee47',1,'BRA','LIB2039464');
insert into _user values('SR684526BR','billM1cr0','bill@microsoft.com','WIN32',1,'USA','LIB2927674');
insert into _user values('SR967408BR','steveII','steve@apple.com','AppleII',1,'USA','LIB6995051');
insert into _user values('SR655356BR','johann123','johann@gmail.de','einstein',1,'GER','LIB5223336');


--Planos:
insert into plan values('PRE','PREMIUM',16.90,true);
insert into plan values('FAM','FAMILY',20,true);
insert into plan values('STU','STUDENT',8.50,true);
insert into plan values('FRE','FREE',0,false);


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
insert into genre values('PUNK0','Punk');


--Playlist:
insert into playlist values('PL3740192837461', 'Músicas Brasileiras', true,'BRMUS');
insert into playlist values('PL5990339375132', 'On the Go', true,'POP00');
insert into playlist values('PL4662273392645', 'Aleatorias', true);
insert into playlist values('PL8986640286510', 'Rock Nacional', true,'BRMUS', 'ROCK0');


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


--ALBUNS:
insert into album values('ALB019274659', 'Musicas Brasileiras', 'BRMUS');
insert into album values('ALB563372963', 'Evolve', 'ROCK0','ELETR');
insert into album values('ALB427886832', '÷', 'ROCK0');
insert into album values('ALB552476320', 'Mamma Mia!', 'POP00');
insert into album values('ALB216808800', 'Still Not Getting Any', 'ROCK0','PUNK0');
insert into album values('ALB502330527', 'Simple Plan', 'ROCK0','PUNK0');
insert into album values('ALB911494226', 'Get Your Heart On!', 'ROCK0','PUNK0');
insert into album values('ALB320972960', 'Garota de Ipanema', 'BRMUS','BOSNV');
insert into album values('ALB321679927', 'Rock in Rio 2011', 'ROCK0','BRMUS');
insert into album values('ALB503744461', 'A Arte de Raul Seixas', 'BRMUS','MPB00');
insert into album values('ALB916339644', 'True', 'ELETR','ROCK0');
insert into album values('ALB675586793', 'Wonders', 'CLAS0');
insert into album values('ALB771132860', 'Elas em Evidências', 'BRMUS','SERT0');


--ARTISTAS:
insert into artist values('ART8374029','Skank','ROCK0','POP00');
insert into artist values('ART8375029','Johann Sebastian Bach','CLAS0');
insert into artist values('ART8374019','Tom Jobim','BRMUS', 'BOSNV');
insert into artist values('ART5137204','Imagine Dragons','ELETR', 'ROCK0');
insert into artist values('ART4267856','Ed Sheeran','POP00', 'INDIE');
insert into artist values('ART9847755','Abba','POP00');
insert into artist values('ART2444431','Simple Plan','ROCK0', 'PUNK0');
insert into artist values('ART3041760','Capital Inicial','BRMUS', 'ROCK0');
insert into artist values('ART8709527','Raul Seixas','BRMUS', 'MPB00');
insert into artist values('ART9288025','Avicii','ELETR', 'ROCK0');
insert into artist values('ART8468449','The Piano Guys','CLAS0');
insert into artist values('ART4669209','Chitãozinho e Xororó','BRMUS', 'SERT0');

--CONTRATOS 
select * from contract;

insert into contract values('CT38B978BR', 16.90,'10-06-2018','10-12-2018','DOC12485BR',2);
insert into contract values('CT432711BR', 16.90,'15-10-2018','15-04-2018','DOC12485BR',2);
insert into contract values('CT979258BR', 16.90,'10-05-2018','10-11-2018','DOC12485BR',2);
insert into contract values('CT827014BR', 16.90,'17-08-2018','17-02-2018','DOC12485BR',2);
insert into contract values('CT38A778BR', 16.90,'19-07-2018','19-01-2018','DOC12485BR',2);
insert into contract values('CT832196BR', 20.00,'10-11-2018','10-05-2018','DOC92368BR',2);

insert into contract values('CT633045BR', 8.50,'10-12-2018','10-06-2019','DOC87252BR',2);
insert into contract values('CT744062BR', 8.50,'16-11-2018','16-04-2019','DOC87252BR',2);

insert into contract values('CT420346BR', 350000,'05-06-2018','05-10-2018','DOC13485BR',1);
insert into contract values('CT603360BR', 650000,'01-01-2018','01-01-2019','DOC58352BR',1);
insert into contract values('CT661533BR', 100000,'10-12-2018','10-01-2019','DOC13045BR',1);
insert into contract values('CT000001BR', 00.00,'10-11-2018','10-12-2025','DOC00001BR',0); 

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


-- PAYMENNTS
insert into payment values('PAY839203928394',16.90,true,'09-06-2018','14-10-2018','11-10-2018','CT38B978BR');
insert into payment values('PAY693700543015',16.90,false,'09-06-2018','11-10-2018',null,'CT979258BR');
insert into payment values('PAY707720324996',16.90,true,'15-10-2018','18-10-2018','17-10-2018','CT38A778BR');

insert into payment values('PAY793300952268',8.50,true,'10-11-2018','28-11-2018','11-11-2018','CT633045BR');
insert into payment values('PAY504805424065',8.50,false,'01-11-2018','19-11-2018',null,'CT744062BR');

insert into payment values('PAY288457351224',0,true,'01-01-2018','03-01-2018','01-02-2018','CT000001BR');
insert into payment values('PAY325013997392',350000.00,true,'09-05-2018','14-05-2018','11-05-2018','CT38A778BR');
insert into payment values('PAY804228814360',350000,true,'10-06-2018','14-06-2018','11-06-2018','CT38A778BR');
insert into payment values('PAY133788432121',650000,true,'09-12-2017','14-12-2017','11-12-2017','CT832196BR');


--DOCUMENTS

insert into document values('DOC12485BR','./data/Docs/myDOC12485BR.pdf');
insert into document values('DOC13485BR','./data/Docs/myDOC13485BR.pdf');
insert into document values('DOC58352BR','./data/Docs/myDOC58352BR.pdf');

insert into document values('DOC13045BR','./data/Docs/myDOC13045BR.pdf');
insert into document values('DOC87252BR','./data/Docs/myDOC87252BR.pdf');
insert into document values('DOC92368BR','./data/Docs/myDOC92368BR.pdf');
insert into document values('DOC00001BR','./data/Docs/myDOC00001BR.pdf');


--ADVERTISE
insert into advertise values('AD82402847',250,10);
insert into advertise values('AD54388617',500,400);
insert into advertise values('AD70985105',1000,152);
insert into advertise values('AD48747680',300,15);
insert into advertise values('AD52184055',350,30);
insert into advertise values('AD39222699',30,1);
insert into advertise values('AD39233587',1100,250);
insert into advertise values('AD59957494',459,152);

--waitingConfirmation
insert into waitingConfirmation values('SR38A9C5BR','CT38B978BR','SR38A9C5BR');
insert into waitingConfirmation values('SR3B56D5BR','CT832196BR','SR3B56D5BR');
insert into waitingConfirmation values('SR128102BR','CT744062BR','SR128102BR');
insert into waitingConfirmation values('SR468950BR','CT633045BR','SR468950BR');
insert into waitingConfirmation values('SR684526BR','CT979258BR','SR684526BR');
insert into waitingConfirmation values('SR967408BR','CT432711BR','SR967408BR');


--SUBSCRIPTIONS
insert into subscription values('CT38B978BR', 'SR38A9C5BR', 'SR38A9C5BR', 'PRE');
insert into subscription values('CT633045BR', 'SR468950BR', 'SR468950BR', 'STU');
insert into subscription values('CT744062BR', 'SR128102BR', 'SR128102BR', 'PRE');
insert into subscription values('CT832196BR', 'SR3B56D5BR', 'SR4BA135BR', 'FAM');
insert into subscription values('CT38A778BR', 'SR65879ABR', 'SR65879ABR', 'PRE');
insert into subscription values('CT827014BR', 'SR380530BR', 'SR380530BR', 'PRE');
insert into subscription values('CT979258BR', 'SR684526BR', 'SR684526BR', 'PRE');
insert into subscription values('CT432711BR', 'SR967408BR', 'SR967408BR', 'PRE');

--LIB_PLAYLIST
insert into lib_playlist values('LIB1054357','PL3740192837461');
insert into lib_playlist values('LIB1054357','PL5990339375132');
insert into lib_playlist values('LIB1054357','PL4662273392645');
insert into lib_playlist values('LIB1054357','PL8986640286510');
insert into lib_playlist values('LIB1254617','PL5990339375132');
insert into lib_playlist values('LIB1254617','PL8986640286510');
insert into lib_playlist values('LIB1054859','PL5990339375132');
insert into lib_playlist values('LIB1054859','PL4662273392645');
insert into lib_playlist values('LIB1054859','PL3740192837461');
insert into lib_playlist values('LIB4064848','PL5990339375132');
insert into lib_playlist values('LIB4064848','PL8986640286510');
insert into lib_playlist values('LIB2039464','PL3740192837461');
insert into lib_playlist values('LIB2039464','PL5990339375132');
insert into lib_playlist values('LIB2039464','PL4662273392645');
insert into lib_playlist values('LIB2039464','PL8986640286510');

--LIB_MUSIC
insert into lib_music values ('LIB1054357', 'MUS332409297808');
insert into lib_music values ('LIB1054357', 'MUS266909386861');
insert into lib_music values ('LIB1054357', 'MUS755193587759');
insert into lib_music values ('LIB1054357', 'MUS370623362564');
insert into lib_music values ('LIB1054357', 'MUS454041258580');
insert into lib_music values ('LIB1054357', 'MUS554952917205');
insert into lib_music values ('LIB1054357', 'MUS935191998048');
insert into lib_music values ('LIB1054357', 'MUS737006219502');
insert into lib_music values ('LIB1054357', 'MUS630101192521');
insert into lib_music values ('LIB1054357', 'MUS405389935381');
insert into lib_music values ('LIB1054357', 'MUS404209528501');
insert into lib_music values ('LIB1054357', 'MUS752990714170');
insert into lib_music values ('LIB1054357', 'MUS419094411426');
insert into lib_music values ('LIB1054357', 'MUS904261820951');
insert into lib_music values ('LIB1054357', 'MUS495587782738');
insert into lib_music values ('LIB1054357', 'MUS311209835116');
insert into lib_music values ('LIB1054357', 'MUS441351335036');
insert into lib_music values ('LIB1054357', 'MUS321125420820');
insert into lib_music values ('LIB1054357', 'MUS803627890242');
insert into lib_music values ('LIB1054357', 'MUS499678189033');
insert into lib_music values ('LIB1054357', 'MUS510080132241');
insert into lib_music values ('LIB1054357', 'MUS228473132080');
insert into lib_music values ('LIB1054357', 'MUS346863688404');
insert into lib_music values ('LIB1054357', 'MUS791445420693');
insert into lib_music values ('LIB1054357', 'MUS401692849216');
insert into lib_music values ('LIB1054357', 'MUS465730078441');
insert into lib_music values ('LIB1054357', 'MUS163639085346');
insert into lib_music values ('LIB1054357', 'MUS215217021095');
insert into lib_music values ('LIB1054357', 'MUS748362550431');
insert into lib_music values ('LIB1054357', 'MUS917486503201');
insert into lib_music values ('LIB1054357', 'MUS517656588407');
insert into lib_music values ('LIB1054357', 'MUS492164908762');
insert into lib_music values ('LIB1054357', 'MUS769656264453');
insert into lib_music values ('LIB1054357', 'MUS452082827221');
insert into lib_music values ('LIB1054357', 'MUS122683391529');
insert into lib_music values ('LIB1054357', 'MUS223996176968');
insert into lib_music values ('LIB1054357', 'MUS632071860242');
insert into lib_music values ('LIB1054357', 'MUS620191878095');
insert into lib_music values ('LIB1054357', 'MUS886791081825');
insert into lib_music values ('LIB1054357', 'MUS743001163796');
insert into lib_music values ('LIB1054357', 'MUS446643415008');
insert into lib_music values ('LIB1054357', 'MUS623910304593');
insert into lib_music values ('LIB1054357', 'MUS514042991087');
insert into lib_music values ('LIB1054357', 'MUS151464375612');
insert into lib_music values ('LIB1054357', 'MUS612402017387');
insert into lib_music values ('LIB1054357', 'MUS147627982192');
insert into lib_music values ('LIB1054357', 'MUS726627602241');
insert into lib_music values ('LIB1254617', 'MUS332409297808');
insert into lib_music values ('LIB1254617', 'MUS755193587759');
insert into lib_music values ('LIB1254617', 'MUS454041258580');
insert into lib_music values ('LIB1254617', 'MUS554952917205');
insert into lib_music values ('LIB1254617', 'MUS935191998048');
insert into lib_music values ('LIB1254617', 'MUS737006219502');
insert into lib_music values ('LIB1254617', 'MUS405389935381');
insert into lib_music values ('LIB1254617', 'MUS404209528501');
insert into lib_music values ('LIB1254617', 'MUS752990714170');
insert into lib_music values ('LIB1254617', 'MUS495587782738');
insert into lib_music values ('LIB1254617', 'MUS311209835116');
insert into lib_music values ('LIB1254617', 'MUS441351335036');
insert into lib_music values ('LIB1254617', 'MUS321125420820');
insert into lib_music values ('LIB1254617', 'MUS499678189033');
insert into lib_music values ('LIB1254617', 'MUS510080132241');
insert into lib_music values ('LIB1254617', 'MUS228473132080');
insert into lib_music values ('LIB1254617', 'MUS465730078441');
insert into lib_music values ('LIB1254617', 'MUS163639085346');
insert into lib_music values ('LIB1254617', 'MUS215217021095');
insert into lib_music values ('LIB1254617', 'MUS632071860242');
insert into lib_music values ('LIB1254617', 'MUS620191878095');
insert into lib_music values ('LIB1254617', 'MUS743001163796');
insert into lib_music values ('LIB1254617', 'MUS514042991087');
insert into lib_music values ('LIB1254617', 'MUS151464375612');
insert into lib_music values ('LIB1254617', 'MUS612402017387');
insert into lib_music values ('LIB1254617', 'MUS147627982192');
insert into lib_music values ('LIB1254617', 'MUS726627602241');
insert into lib_music values ('LIB1054859', 'MUS163639085346');
insert into lib_music values ('LIB1054859', 'MUS215217021095');
insert into lib_music values ('LIB1054859', 'MUS748362550431');
insert into lib_music values ('LIB1054859', 'MUS917486503201');
insert into lib_music values ('LIB1054859', 'MUS517656588407');
insert into lib_music values ('LIB1054859', 'MUS492164908762');
insert into lib_music values ('LIB1054859', 'MUS769656264453');
insert into lib_music values ('LIB1054859', 'MUS452082827221');
insert into lib_music values ('LIB1054859', 'MUS122683391529');
insert into lib_music values ('LIB1054859', 'MUS223996176968');
insert into lib_music values ('LIB1054859', 'MUS632071860242');
insert into lib_music values ('LIB1054859', 'MUS620191878095');
insert into lib_music values ('LIB1054859', 'MUS886791081825');
insert into lib_music values ('LIB1054859', 'MUS743001163796');
insert into lib_music values ('LIB1054859', 'MUS446643415008');
insert into lib_music values ('LIB1054859', 'MUS623910304593');
insert into lib_music values ('LIB1054859', 'MUS514042991087');
insert into lib_music values ('LIB1054859', 'MUS151464375612');
insert into lib_music values ('LIB1054859', 'MUS612402017387');
insert into lib_music values ('LIB1054859', 'MUS147627982192');
insert into lib_music values ('LIB1054859', 'MUS726627602241');
insert into lib_music values ('LIB1057547', 'MUS266909386861');
insert into lib_music values ('LIB1057547', 'MUS755193587759');
insert into lib_music values ('LIB1057547', 'MUS370623362564');
insert into lib_music values ('LIB1057547', 'MUS454041258580');
insert into lib_music values ('LIB1057547', 'MUS554952917205');
insert into lib_music values ('LIB1057547', 'MUS935191998048');
insert into lib_music values ('LIB1057547', 'MUS737006219502');
insert into lib_music values ('LIB1057547', 'MUS630101192521');
insert into lib_music values ('LIB1057547', 'MUS405389935381');
insert into lib_music values ('LIB1057547', 'MUS404209528501');
insert into lib_music values ('LIB1057547', 'MUS752990714170');
insert into lib_music values ('LIB1057547', 'MUS419094411426');
insert into lib_music values ('LIB1057547', 'MUS904261820951');
insert into lib_music values ('LIB1057547', 'MUS495587782738');
insert into lib_music values ('LIB1057547', 'MUS311209835116');
insert into lib_music values ('LIB1057547', 'MUS441351335036');
insert into lib_music values ('LIB1057547', 'MUS321125420820');
insert into lib_music values ('LIB1057547', 'MUS803627890242');
insert into lib_music values ('LIB1057547', 'MUS499678189033');
insert into lib_music values ('LIB1057547', 'MUS510080132241');
insert into lib_music values ('LIB1057547', 'MUS228473132080');
insert into lib_music values ('LIB1057547', 'MUS346863688404');
insert into lib_music values ('LIB1057547', 'MUS791445420693');
insert into lib_music values ('LIB1057547', 'MUS632071860242');
insert into lib_music values ('LIB1057547', 'MUS620191878095');
insert into lib_music values ('LIB1057547', 'MUS886791081825');
insert into lib_music values ('LIB1057547', 'MUS743001163796');
insert into lib_music values ('LIB1057547', 'MUS446643415008');
insert into lib_music values ('LIB1057547', 'MUS514042991087');
insert into lib_music values ('LIB4064848', 'MUS401692849216');
insert into lib_music values ('LIB4064848', 'MUS465730078441');
insert into lib_music values ('LIB4064848', 'MUS163639085346');
insert into lib_music values ('LIB4064848', 'MUS215217021095');
insert into lib_music values ('LIB4064848', 'MUS748362550431');
insert into lib_music values ('LIB4064848', 'MUS917486503201');
insert into lib_music values ('LIB4064848', 'MUS517656588407');
insert into lib_music values ('LIB4064848', 'MUS492164908762');
insert into lib_music values ('LIB4064848', 'MUS769656264453');
insert into lib_music values ('LIB4064848', 'MUS452082827221');
insert into lib_music values ('LIB4064848', 'MUS122683391529');
insert into lib_music values ('LIB4064848', 'MUS223996176968');
insert into lib_music values ('LIB4064848', 'MUS151464375612');
insert into lib_music values ('LIB4064848', 'MUS612402017387');
insert into lib_music values ('LIB4064848', 'MUS147627982192');
insert into lib_music values ('LIB4064848', 'MUS726627602241');
insert into lib_music values ('LIB8648628', 'MUS332409297808');
insert into lib_music values ('LIB8648628', 'MUS266909386861');
insert into lib_music values ('LIB8648628', 'MUS755193587759');
insert into lib_music values ('LIB8648628', 'MUS370623362564');
insert into lib_music values ('LIB8648628', 'MUS454041258580');
insert into lib_music values ('LIB8648628', 'MUS554952917205');
insert into lib_music values ('LIB8648628', 'MUS935191998048');
insert into lib_music values ('LIB8648628', 'MUS737006219502');
insert into lib_music values ('LIB8648628', 'MUS630101192521');
insert into lib_music values ('LIB8648628', 'MUS405389935381');
insert into lib_music values ('LIB8648628', 'MUS404209528501');
insert into lib_music values ('LIB8648628', 'MUS752990714170');
insert into lib_music values ('LIB8648628', 'MUS419094411426');
insert into lib_music values ('LIB8648628', 'MUS904261820951');
insert into lib_music values ('LIB8648628', 'MUS495587782738');
insert into lib_music values ('LIB8648628', 'MUS311209835116');
insert into lib_music values ('LIB8648628', 'MUS441351335036');
insert into lib_music values ('LIB8648628', 'MUS321125420820');
insert into lib_music values ('LIB8648628', 'MUS803627890242');
insert into lib_music values ('LIB8648628', 'MUS499678189033');
insert into lib_music values ('LIB8648628', 'MUS510080132241');
insert into lib_music values ('LIB8648628', 'MUS228473132080');
insert into lib_music values ('LIB8648628', 'MUS346863688404');
insert into lib_music values ('LIB8648628', 'MUS791445420693');
insert into lib_music values ('LIB8648628', 'MUS401692849216');
insert into lib_music values ('LIB8648628', 'MUS465730078441');
insert into lib_music values ('LIB8648628', 'MUS163639085346');
insert into lib_music values ('LIB8648628', 'MUS215217021095');
insert into lib_music values ('LIB8648628', 'MUS748362550431');
insert into lib_music values ('LIB2039464', 'MUS332409297808');
insert into lib_music values ('LIB2039464', 'MUS755193587759');
insert into lib_music values ('LIB2039464', 'MUS370623362564');
insert into lib_music values ('LIB2039464', 'MUS454041258580');
insert into lib_music values ('LIB2039464', 'MUS554952917205');
insert into lib_music values ('LIB2039464', 'MUS935191998048');
insert into lib_music values ('LIB2039464', 'MUS737006219502');
insert into lib_music values ('LIB2039464', 'MUS630101192521');
insert into lib_music values ('LIB2039464', 'MUS404209528501');
insert into lib_music values ('LIB2039464', 'MUS752990714170');
insert into lib_music values ('LIB2039464', 'MUS419094411426');
insert into lib_music values ('LIB2039464', 'MUS904261820951');
insert into lib_music values ('LIB2039464', 'MUS495587782738');
insert into lib_music values ('LIB2039464', 'MUS311209835116');
insert into lib_music values ('LIB2039464', 'MUS441351335036');
insert into lib_music values ('LIB2039464', 'MUS321125420820');
insert into lib_music values ('LIB2039464', 'MUS803627890242');
insert into lib_music values ('LIB2039464', 'MUS228473132080');
insert into lib_music values ('LIB2039464', 'MUS346863688404');
insert into lib_music values ('LIB2039464', 'MUS791445420693');
insert into lib_music values ('LIB2039464', 'MUS215217021095');
insert into lib_music values ('LIB2039464', 'MUS748362550431');
insert into lib_music values ('LIB2039464', 'MUS517656588407');
insert into lib_music values ('LIB2039464', 'MUS492164908762');
insert into lib_music values ('LIB2039464', 'MUS223996176968');
insert into lib_music values ('LIB2039464', 'MUS632071860242');
insert into lib_music values ('LIB2039464', 'MUS620191878095');
insert into lib_music values ('LIB2039464', 'MUS886791081825');
insert into lib_music values ('LIB2039464', 'MUS743001163796');
insert into lib_music values ('LIB2039464', 'MUS446643415008');

--PLAYLIST_MUSIC
insert into playlist_music values('PL3740192837461','MUS401692849216');
insert into playlist_music values('PL3740192837461','MUS465730078441');
insert into playlist_music values('PL3740192837461','MUS163639085346');
insert into playlist_music values('PL3740192837461','MUS215217021095');
insert into playlist_music values('PL3740192837461','MUS748362550431');
insert into playlist_music values('PL3740192837461','MUS917486503201');
insert into playlist_music values('PL3740192837461','MUS517656588407');
insert into playlist_music values('PL3740192837461','MUS492164908762');
insert into playlist_music values('PL3740192837461','MUS769656264453');
insert into playlist_music values('PL3740192837461','MUS452082827221');
insert into playlist_music values('PL3740192837461','MUS122683391529');
insert into playlist_music values('PL3740192837461','MUS223996176968');
insert into playlist_music values('PL3740192837461','MUS151464375612');
insert into playlist_music values('PL3740192837461','MUS612402017387');
insert into playlist_music values('PL3740192837461','MUS147627982192');
insert into playlist_music values('PL3740192837461','MUS726627602241');
insert into playlist_music values('PL5990339375132','MUS755193587759');
insert into playlist_music values('PL5990339375132','MUS454041258580');
insert into playlist_music values('PL5990339375132','MUS554952917205');
insert into playlist_music values('PL5990339375132','MUS737006219502');
insert into playlist_music values('PL5990339375132','MUS404209528501');
insert into playlist_music values('PL5990339375132','MUS904261820951');
insert into playlist_music values('PL5990339375132','MUS495587782738');
insert into playlist_music values('PL5990339375132','MUS311209835116');
insert into playlist_music values('PL5990339375132','MUS441351335036');
insert into playlist_music values('PL5990339375132','MUS321125420820');
insert into playlist_music values('PL4662273392645','MUS495587782738');
insert into playlist_music values('PL4662273392645','MUS311209835116');
insert into playlist_music values('PL4662273392645','MUS510080132241');
insert into playlist_music values('PL4662273392645','MUS228473132080');
insert into playlist_music values('PL4662273392645','MUS791445420693');
insert into playlist_music values('PL4662273392645','MUS917486503201');
insert into playlist_music values('PL4662273392645','MUS517656588407');
insert into playlist_music values('PL4662273392645','MUS632071860242');
insert into playlist_music values('PL4662273392645','MUS620191878095');
insert into playlist_music values('PL4662273392645','MUS743001163796');
insert into playlist_music values('PL4662273392645','MUS514042991087');
insert into playlist_music values('PL4662273392645','MUS147627982192');
insert into playlist_music values('PL8986640286510','MUS748362550431');
insert into playlist_music values('PL8986640286510','MUS917486503201');
insert into playlist_music values('PL8986640286510','MUS517656588407');
insert into playlist_music values('PL8986640286510','MUS492164908762');

--ALBUM_MUSIC
insert into album_music values('ALB563372963','MUS332409297808');
insert into album_music values('ALB563372963','MUS266909386861');
insert into album_music values('ALB563372963','MUS755193587759');
insert into album_music values('ALB563372963','MUS370623362564');
insert into album_music values('ALB563372963','MUS454041258580');
insert into album_music values('ALB427886832','MUS554952917205');
insert into album_music values('ALB427886832','MUS935191998048');
insert into album_music values('ALB427886832','MUS737006219502');
insert into album_music values('ALB427886832','MUS630101192521');
insert into album_music values('ALB427886832','MUS405389935381');
insert into album_music values('ALB552476320','MUS404209528501');
insert into album_music values('ALB552476320','MUS752990714170');
insert into album_music values('ALB552476320','MUS419094411426');
insert into album_music values('ALB552476320','MUS904261820951');
insert into album_music values('ALB216808800','MUS495587782738');
insert into album_music values('ALB216808800','MUS311209835116');
insert into album_music values('ALB216808800','MUS441351335036');
insert into album_music values('ALB216808800','MUS321125420820');
insert into album_music values('ALB502330527','MUS803627890242');
insert into album_music values('ALB502330527','MUS499678189033');
insert into album_music values('ALB502330527','MUS510080132241');
insert into album_music values('ALB911494226','MUS228473132080');
insert into album_music values('ALB911494226','MUS346863688404');
insert into album_music values('ALB911494226','MUS791445420693');
insert into album_music values('ALB320972960','MUS401692849216');
insert into album_music values('ALB320972960','MUS465730078441');
insert into album_music values('ALB320972960','MUS163639085346');
insert into album_music values('ALB320972960','MUS215217021095');
insert into album_music values('ALB321679927','MUS748362550431');
insert into album_music values('ALB321679927','MUS917486503201');
insert into album_music values('ALB321679927','MUS517656588407');
insert into album_music values('ALB321679927','MUS492164908762');
insert into album_music values('ALB503744461','MUS769656264453');
insert into album_music values('ALB503744461','MUS452082827221');
insert into album_music values('ALB503744461','MUS122683391529');
insert into album_music values('ALB503744461','MUS223996176968');
insert into album_music values('ALB916339644','MUS632071860242');
insert into album_music values('ALB916339644','MUS620191878095');
insert into album_music values('ALB916339644','MUS886791081825');
insert into album_music values('ALB675586793','MUS743001163796');
insert into album_music values('ALB675586793','MUS446643415008');
insert into album_music values('ALB675586793','MUS623910304593');
insert into album_music values('ALB675586793','MUS514042991087');
insert into album_music values('ALB771132860','MUS151464375612');
insert into album_music values('ALB771132860','MUS612402017387');
insert into album_music values('ALB771132860','MUS147627982192');
insert into album_music values('ALB771132860','MUS726627602241');

--ARTIST_ALBUM
insert into artist_album values('ALB019274659','ART8374019');
insert into artist_album values('ALB563372963','ART5137204');
insert into artist_album values('ALB427886832','ART4267856');
insert into artist_album values('ALB552476320','ART9847755');
insert into artist_album values('ALB216808800','ART2444431');
insert into artist_album values('ALB502330527','ART2444431');
insert into artist_album values('ALB911494226','ART2444431');
insert into artist_album values('ALB320972960','ART8374019');
insert into artist_album values('ALB321679927','ART3041760');
insert into artist_album values('ALB503744461','ART8709527');
insert into artist_album values('ALB916339644','ART9288025');
insert into artist_album values('ALB675586793','ART8468449');
insert into artist_album values('ALB771132860','ART4669209');


--ARTIST_MUSIC
insert into artist_music values ('ART5137204','MUS332409297808');
insert into artist_music values ('ART5137204','MUS266909386861');
insert into artist_music values ('ART5137204','MUS755193587759');
insert into artist_music values ('ART5137204','MUS370623362564');
insert into artist_music values ('ART5137204','MUS454041258580');
insert into artist_music values ('ART4267856','MUS554952917205');
insert into artist_music values ('ART4267856','MUS935191998048');
insert into artist_music values ('ART4267856','MUS737006219502');
insert into artist_music values ('ART4267856','MUS630101192521');
insert into artist_music values ('ART4267856','MUS405389935381');
insert into artist_music values ('ART9847755','MUS404209528501');
insert into artist_music values ('ART9847755','MUS752990714170');
insert into artist_music values ('ART9847755','MUS419094411426');
insert into artist_music values ('ART9847755','MUS904261820951');
insert into artist_music values ('ART2444431','MUS495587782738');
insert into artist_music values ('ART2444431','MUS311209835116');
insert into artist_music values ('ART2444431','MUS441351335036');
insert into artist_music values ('ART2444431','MUS321125420820');
insert into artist_music values ('ART2444431','MUS803627890242');
insert into artist_music values ('ART2444431','MUS499678189033');
insert into artist_music values ('ART2444431','MUS510080132241');
insert into artist_music values ('ART2444431','MUS228473132080');
insert into artist_music values ('ART2444431','MUS346863688404');
insert into artist_music values ('ART2444431','MUS791445420693');
insert into artist_music values ('ART8374019','MUS401692849216');
insert into artist_music values ('ART8374019','MUS465730078441');
insert into artist_music values ('ART8374019','MUS163639085346');
insert into artist_music values ('ART8374019','MUS215217021095');
insert into artist_music values ('ART3041760','MUS748362550431');
insert into artist_music values ('ART3041760','MUS917486503201');
insert into artist_music values ('ART3041760','MUS517656588407');
insert into artist_music values ('ART3041760','MUS492164908762');
insert into artist_music values ('ART8709527','MUS769656264453');
insert into artist_music values ('ART8709527','MUS452082827221');
insert into artist_music values ('ART8709527','MUS122683391529');
insert into artist_music values ('ART8709527','MUS223996176968');
insert into artist_music values ('ART9288025','MUS632071860242');
insert into artist_music values ('ART9288025','MUS620191878095');
insert into artist_music values ('ART9288025','MUS886791081825');
insert into artist_music values ('ART8468449','MUS743001163796');
insert into artist_music values ('ART8468449','MUS446643415008');
insert into artist_music values ('ART8468449','MUS623910304593');
insert into artist_music values ('ART8468449','MUS514042991087');
insert into artist_music values ('ART4669209','MUS151464375612');
insert into artist_music values ('ART4669209','MUS612402017387');
insert into artist_music values ('ART4669209','MUS147627982192');
insert into artist_music values ('ART4669209','MUS726627602241');


--ADV_CONTACT
insert into adv_contact values('ADV759289','Rua indeterminada, nr 012');
insert into adv_contact values('ADV759259','contact@youtube.com');
insert into adv_contact values('ADV759249','Rua da crina, sem nr');
insert into adv_contact values('ADV544016','contact@fangco.com');
insert into adv_contact values('ADV123598','https://www.wikipedia.org/');
insert into adv_contact values('ADV282653','contact@google.com');
insert into adv_contact values('ADV735016','Av. Nações Unidas,12.901 - 31andar CEP 04578-000');


--SIGNED
insert into signed values('CT420346BR','ADV759289');
insert into signed values('CT603360BR','ADV759259');
insert into signed values('CT603360BR','ADV735016');
insert into signed values('CT000001BR','ADV189046');
insert into signed values('CT661533BR','ADV544016');


--CLICKERS
insert into clickers values ('AD82402847', 'SR38A9C5BR');
insert into clickers values ('AD54388617', 'SR38A9C5BR');
insert into clickers values ('AD70985105', 'SR38A9C5BR');
insert into clickers values ('AD48747680', 'SR38A9C5BR');
insert into clickers values ('AD52184055', 'SR38A9C5BR');
insert into clickers values ('AD39222699', 'SR38A9C5BR');
insert into clickers values ('AD39233587', 'SR38A9C5BR');
insert into clickers values ('AD59957494', 'SR38A9C5BR');
insert into clickers values ('AD82402847', 'SR65879ABR');
insert into clickers values ('AD54388617', 'SR65879ABR');
insert into clickers values ('AD52184055', 'SR65879ABR');
insert into clickers values ('AD39222699', 'SR65879ABR');
insert into clickers values ('AD59957494', 'SR65879ABR');
insert into clickers values ('AD82402847', 'SR3B56D5BR');
insert into clickers values ('AD54388617', 'SR3B56D5BR');
insert into clickers values ('AD39222699', 'SR3B56D5BR');
insert into clickers values ('AD39233587', 'SR3B56D5BR');
insert into clickers values ('AD54388617', 'SR4BA135BR');
insert into clickers values ('AD70985105', 'SR4BA135BR');
insert into clickers values ('AD39222699', 'SR4BA135BR');
insert into clickers values ('AD39233587', 'SR4BA135BR');
insert into clickers values ('AD59957494', 'SR4BA135BR');
insert into clickers values ('AD82402847', 'SR468950BR');
insert into clickers values ('AD70985105', 'SR468950BR');
insert into clickers values ('AD48747680', 'SR468950BR');
insert into clickers values ('AD39233587', 'SR468950BR');
insert into clickers values ('AD54388617', 'SR128102BR');
insert into clickers values ('AD54388617', 'SR684526BR');
insert into clickers values ('AD52184055', 'SR684526BR');
insert into clickers values ('AD39222699', 'SR684526BR');
insert into clickers values ('AD39233587', 'SR684526BR');
insert into clickers values ('AD59957494', 'SR684526BR');
insert into clickers values ('AD54388617', 'SR967408BR');
insert into clickers values ('AD70985105', 'SR967408BR');
insert into clickers values ('AD48747680', 'SR967408BR');
insert into clickers values ('AD52184055', 'SR967408BR');
insert into clickers values ('AD39222699', 'SR967408BR');
insert into clickers values ('AD39233587', 'SR967408BR');
insert into clickers values ('AD48747680', 'SR655356BR');
insert into clickers values ('AD52184055', 'SR655356BR');
insert into clickers values ('AD39222699', 'SR655356BR');
insert into clickers values ('AD39233587', 'SR655356BR');


--CONTRACT_COVER
 insert into contract_cover values(8375018395, 'CT420346BR','BRA','AD82402847');
 insert into contract_cover values(5396678399, 'CT603360BR','ITA','AD39233587');
 insert into contract_cover values(2441841202, 'CT000001BR','BRA','AD70985105');






