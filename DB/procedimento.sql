-- FUNCTION: public.check_subscribers()

-- DROP FUNCTION public.check_subscribers();

CREATE FUNCTION public.check_subscribers()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF 
AS $BODY$-- Controle de promoção de usuários
begin 
	if NEW.RECEIVED=True and NEW.CONTRACTID is not null then
	
	  -- Atualiza status do(s) usuário(s) para UserPremium (2)
	  update _user
	  set PREMIUMSTATE=2
	  where PREMIUMSTATE=1 and USERID in
	  	(select USERID
	  		from waitingConfirmation
	  		where CONTRACTID=new.CONTRACTID
	  	);
	  	
	  -- Insere tupla(s) em subscription
	  insert into subscription(contractid, userid, holderid, planid)
	  	select CONTRACTID as contractid, USERID as userid, HOLDERID as holderid, PLANID as planid
	  	from waitingConfirmation
	  	where CONTRACTID=new.CONTRACTID;
	  	
	  -- Remove tupla(s) de waitingConfirmation
	  delete from waitingConfirmation
	  where CONTRACTID = new.CONTRACTID;
	  
	end if;
end;
$BODY$;

ALTER FUNCTION public.check_subscribers()
    OWNER TO postgres;


-- Trigger: check_promotion

-- DROP TRIGGER check_promotion ON public.payment;

CREATE TRIGGER check_promotion
    AFTER UPDATE OF received
    ON public.payment
    FOR EACH ROW
    EXECUTE PROCEDURE public.check_subscribers();

COMMENT ON TRIGGER check_promotion ON public.payment
    IS '-- Controle de promoção de usuários após recebimento de pagamento
';

