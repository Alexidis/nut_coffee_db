-- drop table nut_coffee.users;
CREATE TABLE nut_coffee.users
(
    id             serial      NOT NULL PRIMARY KEY COMMENT 'id пользователя',
    login          varchar(45) NOT NULL unique COLLATE utf8mb4_unicode_ci COMMENT 'Логин для входа',
    password       char(65)    NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Пароль для входа',
    coffee_shop_id bigint unsigned COMMENT 'id кофейни доступ в которую обеспечивает учетка, при отсутствии доступ дан ко всем',

    constraint fk_users_coffee_shop
        FOREIGN KEY (coffee_shop_id) REFERENCES nut_coffee.coffee_shops (id) ON DELETE CASCADE

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Пользователи';
create index users_login_idx on nut_coffee.users (login, password);
