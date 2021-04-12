-- drop trigger nut_coffee.providers_renew;
create trigger nut_coffee.providers_renew
before insert on nut_coffee.providers
FOR EACH ROW
BEGIN
    set new.renew_user = current_user;
    set new.renew_datetime = now();
END;
