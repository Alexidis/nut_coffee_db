-- drop function nut_coffee.remeasure;
CREATE function nut_coffee.remeasure(arg_measure_from bigint, arg_measure_to bigint)
 RETURNS decimal(11, 6) DETERMINISTIC
BEGIN
    declare v_factor decimal(11, 6);
    # функция не для использования в запросах, только для других функций
    select factor
    from nut_coffee.measurement_factors mf
    where mf.measurement_from_id = arg_measure_from and
          mf.measurement_to_id = arg_measure_to
    into v_factor;

    return v_factor;

END;




