-- drop trigger nut_coffee.recipes_renew;
create trigger nut_coffee.recipes_renew
before insert on nut_coffee.recipes
FOR EACH ROW
BEGIN
    set new.renew_user = current_user;
    set new.renew_datetime = now();
END;
