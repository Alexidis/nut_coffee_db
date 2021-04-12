-- drop trigger nut_coffee.clients_renew;
create trigger nut_coffee.clients
before insert on nut_coffee.clients
FOR EACH ROW
BEGIN
    set new.renew_datetime = now();
END;
