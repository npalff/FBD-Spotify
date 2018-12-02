#ifndef _MESSYHEADER_H
#define _MESSYHEADER_H

#include <libpq-fe.h>
#include <stdlib.h>
#include <string.h>

void initConnection(PGconn** conn){
  *conn = PQconnectdb("host=localhost dbname=postgres user=postgres");

  if( PQstatus(*conn) == CONNECTION_OK )
    printf("Conexão efetuada\n");
  else {
    printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(*conn));
    PQfinish(*conn);
    exit(-1);
  }
}

void getUserByCountry(PGconn* conn){
  PGresult* res = PQexec(conn, "select COUNTRYNAME as CountryName, count(USERID) as NumberUsers from _user natural join country group by COUNTRYNAME");

  if(PQstatus(conn) != CONNECTION_OK)
    printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

  printf("\n\nNúmero de usuários por país\n");

  if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
    printf("Showing field names\n");
    for(int i = 0; i < PQnfields(res); i++)
      printf("%s, ", PQfname(res,i));

    printf("\n");

    for(int i = 0; i < PQntuples(res); i++){
      for(int j = 0; j < PQnfields(res); j++)
        printf("");
      printf("\n");
    }
  } else {
    printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
  }

  printf("\n\n");
}

void getPreSubscribers(PGconn* conn){
  PGresult* res = PQexec(conn, "select USERID as UserID\
                                from _user\
                                where PREMIUMSTATE=1 and USERID in\
                                    (select USERID\
                                      from waitingConfirmation\
                                      where CONTRACTID in\
                                        (select CONTRACTID\
                                        from contract\
                                        where CONTRACTID in\
                                            (select CONTRACTID\
                                              from payment\
                                              where RECEIVED=False\
                                            )\
                                        )\
                                    )");

  if(PQstatus(conn) != CONNECTION_OK)
    printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

  printf("\n\nUsuários em estado de pré-assinatura que não efetuaram o pagamento\n");

  if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
    printf("Showing field names\n");
    for(int i = 0; i < PQnfields(res); i++)
      printf("%s, ", PQfname(res,i));

    printf("\n");

    for(int i = 0; i < PQntuples(res); i++){
      for(int j = 0; j < PQnfields(res); j++)
        printf("");
      printf("\n");
    }
  } else {
    printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
  }

  printf("\n\n");
}

void getExpiringUsers(PGconn* conn){
  char date[14];

  char command[255] = "select HOLDERID as USERID\
                    from subscription\
                    where CONTRACTID in\
                      (select CONTRACTID\
                      from payment\
                      where RECEIVED=False and EXPDATE<=\'";
  printf("\n\nUsuários em estado de pré-assinatura que não efetuaram o pagamento ate dada data de expiracao\nEntre com uma data (DD-MM-AAAA)\n");

  scanf("%s", date);
  char endOfCommand[5] = "\')";

  strcat(command, date);
  strcat(command, endOfCommand);
  printf("\n");

  PGresult* res = PQexec(conn, command);

  if(PQstatus(conn) != CONNECTION_OK)
    printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

  if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
    printf("Showing field names\n");
    for(int i = 0; i < PQnfields(res); i++)
      printf("%s, ", PQfname(res,i));

    printf("\n");

    for(int i = 0; i < PQntuples(res); i++){
      for(int j = 0; j < PQnfields(res); j++)
        printf("");
      printf("\n");
    }
  } else {
    printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
  }

  printf("\n\n");
}

void getNumberAccessesByCountry(PGconn* conn){
  char advname[50];

  char command[1024] = "select clickers.ADID, _user.COUNTRYID, COUNT(USERID)\
                        from (clickers natural join _user)\
                        join contract_cover on (clickers.ADID=contract_cover.ADID and\
                         _user.COUNTRYID=contract_cover.COUNTRYID)\
                         where CONTRACTID in\
                           (select CONTRACTID\
                             from signed\
                             where ADVID in\
                                (select ADVID\
                                from advertiser\
                                where ADVNAME=\'";
  printf("\n\nDado um anunciante, para cada anúncio e país de seus contratos, o número de acessos efetuados\nEntre com o nome do anunciante \n");

  scanf("%s", advname);
  char endOfCommand[50] = "\') ) group by clickers.ADID, _user.COUNTRYID";

  strcat(command, advname);
  strcat(command, endOfCommand);

  printf("\n");

  PGresult* res = PQexec(conn, command);

  if(PQstatus(conn) != CONNECTION_OK)
    printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

  if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
    printf("Showing field names\n");
    for(int i = 0; i < PQnfields(res); i++)
      printf("%s, ", PQfname(res,i));

    printf("\n");

    for(int i = 0; i < PQntuples(res); i++){
      for(int j = 0; j < PQnfields(res); j++)
        printf("");
      printf("\n");
    }
  } else {
    printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
  }

  printf("\n\n");
}

void getAllAdvertisersByRef(PGconn* conn){
  char advname[50];

  char command[1024] = "select ADVID\
                        from advertiser a\
                        where ADVID <>\'";
  printf("\n\nOs anunciantes que anunciam em todos os países que o referencia anuncia\nEntre com o id do anunciante referencia \n");

  scanf("%s", advname);
  char midOfCommand[200] = "\'and not exists\
                              (select *\
                              from signed natural join contract_cover\
                              where ADVID=\'";
  char endOfCommand[250] = "\' and COUNTRYID not in\
                              (select distinct COUNTRYID\
                              from signed natural join contract_cover\
                              where ADVID=a.ADVID\
                            ) )";

  strcat(command, advname);
  strcat(command, midOfCommand);
  strcat(command, advname);
  strcat(command, endOfCommand);

  printf("\n");

  PGresult* res = PQexec(conn, command);

  if(PQstatus(conn) != CONNECTION_OK)
    printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

  if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
    printf("Showing field names\n");
    for(int i = 0; i < PQnfields(res); i++)
      printf("%s, ", PQfname(res,i));

    printf("\n");

    for(int i = 0; i < PQntuples(res); i++){
      for(int j = 0; j < PQnfields(res); j++)
        printf("");
      printf("\n");
    }
  } else {
    printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
  }

  printf("\n\n");
}

void getMostFrequentCountryAccessers(PGconn* conn){
  char advname[50];

  char command[1024] = "select COUNTRYID, count(_user)\
                        from clickers natural join _user\
                        where ADID=\'";
  printf("\n\nDado um anúncio, o nome dos países que mais frequentemente o acessam e respectivo número de cliques\nEntre com o id do anuncio \n");

  scanf("%s", advname);
  char endOfCommand[500] = "\' group by COUNTRYID\
                              having count(_user) >\
                                  (select avg(count_bycountry)\
                                  from (select count(USERID) as count_bycountry\
                                        from clickers natural join _user\
                                        group by COUNTRYID\
                                      ) c_country\
                                    )";

  strcat(command, advname);
  strcat(command, endOfCommand);

  printf("\n");

  PGresult* res = PQexec(conn, command);

  if(PQstatus(conn) != CONNECTION_OK)
    printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

  if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
    printf("Showing field names\n");
    for(int i = 0; i < PQnfields(res); i++)
      printf("%s, ", PQfname(res,i));

    printf("\n");

    for(int i = 0; i < PQntuples(res); i++){
      for(int j = 0; j < PQnfields(res); j++)
        printf("");
      printf("\n");
    }
  } else {
    printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
  }

  printf("\n\n");
}

void testTrigger(PGconn* conn){
  char payid[50];

  char command[1024] = "update payment set received=1 where payid=\'";
  printf("\n\nGatilho de promocao de usuarios\nEntre com um id de pagamento (payid) \n");

  scanf("%s", payid);
  char endOfCommand[500] = "\'";

  char selectWaitingCommand[1024] = "select * from waitingConfirmation natural join payment where payid=\'";
  char selectSubscription[1024] = "select * from subscription natural join payment where payid=\'";
  strcat(command, payid);
  strcat(command, endOfCommand);

  strcat(selectWaitingCommand, payid);
  strcat(selectWaitingCommand, endOfCommand);
  strcat(selectSubscription, payid);
  strcat(selectSubscription, endOfCommand);

  printf("\nid: %s", payid);

  PGresult* res = PQexec(conn, selectWaitingCommand);

  if(PQstatus(conn) != CONNECTION_OK)
    printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

  if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
    printf("Showing field names of waitingConfirmation\n");
    for(int i = 0; i < PQnfields(res); i++)
      printf("%s, ", PQfname(res,i));

    printf("\n");

    for(int i = 0; i < PQntuples(res); i++){
      for(int j = 0; j < PQnfields(res); j++)
        printf("");
      printf("\n");
    }
  } else {
    printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
  }

  printf("\n\n");

  res = PQexec(conn, selectSubscription);

  if(PQstatus(conn) != CONNECTION_OK)
    printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

  if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
    printf("Showing field names of subscription\n");
    for(int i = 0; i < PQnfields(res); i++)
      printf("%s, ", PQfname(res,i));

    printf("\n");

    for(int i = 0; i < PQntuples(res); i++){
      for(int j = 0; j < PQnfields(res); j++)
        printf("");
      printf("\n");
    }
  } else {
    printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
  }

  printf("\n\n");

  res = PQexec(conn, command);
  if(PQresultStatus(res) != PGRES_COMMAND_OK && PQresultStatus(res) != PGRES_TUPLES_OK)
    printf("\nUpdate failed\n");
  else{
    printf("\nUpdate ok\n");

    PGresult* res = PQexec(conn, selectWaitingCommand);

    if(PQstatus(conn) != CONNECTION_OK)
      printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

    if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
      printf("Showing field names of waitingConfirmation\n");
      for(int i = 0; i < PQnfields(res); i++)
        printf("%s, ", PQfname(res,i));

      printf("\n");

      for(int i = 0; i < PQntuples(res); i++){
        for(int j = 0; j < PQnfields(res); j++)
          printf("");
        printf("\n");
      }
    } else {
      printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
    }

    printf("\n\n");

    res = PQexec(conn, selectSubscription);

    if(PQstatus(conn) != CONNECTION_OK)
      printf("Falha na conexão:\n\tErro: %s", PQerrorMessage(conn));

    if(PQresultStatus(res) == PGRES_COMMAND_OK || PQresultStatus(res) == PGRES_TUPLES_OK){
      printf("Showing field names of subscription\n");
      for(int i = 0; i < PQnfields(res); i++)
        printf("%s, ", PQfname(res,i));

      printf("\n");

      for(int i = 0; i < PQntuples(res); i++){
        for(int j = 0; j < PQnfields(res); j++)
          printf("");
        printf("\n");
      }
    } else {
      printf("Houve um problema\nMensagem de erro: %s\n", PQerrorMessage(conn));
    }
  }
  printf("\n\n");
}

void menu(PGconn* conn){
  char command = 'o';
  printf("\n");
  printf("Consultar numero de usuarios por pais (a)\n");
  printf("Verificar usuarios em pre-assinatura (b)\n");
  printf("Selecionar usuarios com contas a vencer ate determinada data (c)\n");
  printf("Apresentar numero de acessos por pais e anuncio de um contrato (d)\n");
  printf("Apresentar anunciantes que anunciam em todos os paises de um outro (e)\n");
  printf("Apresentar relacao dos paises que mais frequentemente acessam um dado anuncio (f)\n");
  printf("Testar gatilho. Atualiza um payment.received para true(g)\n");
  printf("Sair (q)\n");

  do {
    switch(command){
      case 'a':
        getUserByCountry(conn);
      break;
      case 'b':
        getPreSubscribers(conn);
      break;
      case 'c':
        getExpiringUsers(conn);
      break;
      case 'd':
        getNumberAccessesByCountry(conn);
      break;
      case 'e':
        getAllAdvertisersByRef(conn);
      break;
      case 'f':
        getMostFrequentCountryAccessers(conn);
      break;
      case 'g':
        testTrigger(conn);
      case 'q':
      break;
      default:
        if(command != 'o')
          printf("Invalid command\n");
    }

    printf("\nDe volta ao menu. Se comando falhar apesar de existir, repita-o ate que funcione\n");

    command = getchar();
    while(getchar() != '\n');
  } while(command != 'q');
}

#endif
