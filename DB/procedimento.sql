-- Controle de promoção de usuários

create or replace function promote_users(contractid)
returns void as $$
begin
  update _user
  set PREMIUMSTATE=2
  where PREMIUMSTATE=1 and USERID in
  	(select USERID
  		from waitingConfirmation
  		where CONTRACTID=contractid
  	)
  	
  insert into subscription(contractid, userid, holderid, planid)
  	select CONTRACTID as contractid, USERID as userid, HOLDERID as holderid, PLANID as planid
  	from waitingConfirmation
  	where CONTRACTID=contractid
  	
  delete from waitingConfirmation
  where CONTRACTID = contractid
end


-- Controle de promoção de usuários após recebimento de pagamento

create trigger check_promotion
  after update of RECEIVED on payments
  referencing new row as n
  when n.RECEIVED=True and n.CONTRACTID is not null
  execute procedure promote_users(n.CONTRACTID);  
  
  

