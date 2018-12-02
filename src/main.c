#include <stdlib.h>
#include <libpq-fe.h>
#include "messyHeader.h"

int main(){


  PGconn* conn = NULL;
  initConnection(&conn);

  menu(conn);

  if(conn != NULL)
    PQfinish(conn);

  return 0;
}
