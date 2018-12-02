-- Número de usuários por país. Útil para o conhecimento dos anunciantes e futuros planos de expansão da aplicação
    
    select COUNTRYNAME, count(USERID)
    from _user natural join country
    group by COUNTRYNAME

-- Verificar usuários em estado de pré-assinatura que não efetuaram o pagamento. Deve retornar todos os usuários de waitingForConfirmation
    
    select USERID
    from _user
    where PREMIUMSTATE=1 and USERID in
        (select USERID
            from waitingConfirmation
            where CONTRACTID in
                (select CONTRACTID
                    from contract
                    where CONTRACTID in
                        (select CONTRACTID
                            from payment
                            where RECEIVED=False
                        )
                )
        )
        
-- selecionar usuarios com contas a vencer até a data ?. Útil para emissão de notificações
    
    select HOLDERID as USERID
    from subscription
    where CONTRACTID in
        (select CONTRACTID
            from payment
            where RECEIVED=False and EXPDATE<=?
        )
            
    
-- Dado um anunciante, para cada anúncio e país de seus contratos, o número de acessos efetuados. Útil para relatórios
    
    select ADID, COUNTRYID, COUNT(USERID)
    from (clickers natural join _user) join contract_cover on (clickers.ADID=contract_cover.ADID and _user.COUNTRYID=contract_cover.COUNTRYID)
    where CONTRACTID in
        (select CONTRACTID
            from signed
            where ADVID in
                (select ADVID
                    from advertiser
                    where ADVNAME=?
                )
        )
    group by ADID, COUNTRYID
    
-- Os anunciantes que anunciam em todos os países que ? anuncia. Avaliação da competição pelo espaço de propaganda por local
    
    select ADVID
    from advertiser a
    where ADVID <> ? and not exists
        (select *
            from signed natural join contract_cover
            where ADVID=? and COUNTRYID not in
                (select distinct COUNTRYID
                    from signed natural join contract_cover
                    where ADVID=a.ADVID
                )
        )
            
-- Dado um anúncio, o nome dos países que mais frequentemente o acessam e respectivo número de cliques. Útil para direcionamento de publicidade

    select COUNTRYID, count(_user)
    from clickers natural join _user
    where ADID=?
    group by COUNTRYID
    having count(_user) >
        (select avg(count_bycountry)
        from (select count(USERID) as count_bycountry
                from clickers natural join _user
                group by COUNTRYID
            ) c_country
        )
    

