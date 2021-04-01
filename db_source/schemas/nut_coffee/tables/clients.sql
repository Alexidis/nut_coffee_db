-- drop table nut_coffee.clients;
CREATE TABLE nut_coffee.clients
(
    id             serial      NOT NULL PRIMARY KEY COMMENT 'id клиента',
    first_name     varchar(45) NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Имя клиента',
    phone          bigint      NOT NULL unique COMMENT 'Телефон клиента',
    bonus          numeric(15, 4) COMMENT 'количество бонусов',
    note           varchar(45) COLLATE utf8mb4_unicode_ci COMMENT 'Примечание',
    created_at     datetime    not null default now() COMMENT 'Дата создания клиента',
    renew_datetime datetime COMMENT 'Дата/время изменения состояния клиента',

    constraint ch_bonus check (bonus >= 0.0)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Клиенты';
create index clients_phone_idx on nut_coffee.clients (phone);
