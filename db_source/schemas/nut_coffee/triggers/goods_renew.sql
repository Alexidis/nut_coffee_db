-- drop trigger nut_coffee.goods_renew;
create trigger nut_coffee.goods_renew
before insert on nut_coffee.goods
FOR EACH ROW
BEGIN
    set new.renew_user = current_user;
    set new.renew_datetime = now();
END;
