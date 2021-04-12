-- drop procedure nut_coffee.make_coffee;
CREATE procedure nut_coffee.make_coffee(arg_coffee_shop_id bigint, arg_recipe_id bigint)
BEGIN

    declare v_stock_id bigint;
    declare v_new_volume decimal(11, 6) ;
    DECLARE is_end INT DEFAULT 0;

    # для всех ингредиентов продукта получаем значение которое остается на складе
    declare rec_goods cursor for (
        with ingr as (
            select
                ingredient_id,
                measurement_unit_id as mu_id,
                volume
            from nut_coffee.recipe_ingredients
            where recipe_id = arg_recipe_id
        )
        select
            id,
            (s.volume - ingr.volume * nut_coffee.remeasure(mu_id, s.measurement_id))
        from nut_coffee.stocks s
        join ingr on ingr.ingredient_id = s.good_id
        where coffee_shop_id = arg_coffee_shop_id
    );
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;

    open rec_goods;
    # в цикле ходим по курсору
    cycle: loop
        # из курсора получаем ид товарного запаса и новое значение
        fetch rec_goods into v_stock_id, v_new_volume;
        IF is_end THEN LEAVE cycle; END IF;
#         SIGNAL SQLSTATE '42927' SET MESSAGE_TEXT = v_new_volume;
        # если новый объем на складе больше 0, то обновляем складские запасы
        if v_new_volume > 0 then
            update nut_coffee.stocks
            set volume = v_new_volume
            where id = v_stock_id;
        # если объем запаса меньше или равен 0 то удаляем запасы со склада
        else
            delete from nut_coffee.stocks
            where id = v_stock_id;
        end if;

    end loop cycle;

    close rec_goods;

END;

