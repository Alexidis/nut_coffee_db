-- drop table nut_coffee.users;
CREATE TABLE nut_coffee.users
(
    id             serial      NOT NULL PRIMARY KEY COMMENT 'id пользователя',
    login          varchar(45) NOT NULL unique COLLATE utf8mb4_unicode_ci COMMENT 'Логин для входа',
    password       char(65)    NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Пароль для входа',
    first_name varchar(45)  COLLATE utf8mb4_unicode_ci COMMENT 'Имя пользователя',
    last_name  varchar(45)  COLLATE utf8mb4_unicode_ci COMMENT 'Фамилия пользователя',
    phone      bigint       COMMENT 'Телефон пользователя',
    coffee_shop_id bigint unsigned COMMENT 'id кофейни доступ в которую обеспечивает учетка, при отсутствии доступ дан ко всем',


    constraint fk_users_coffee_shop
        FOREIGN KEY (coffee_shop_id) REFERENCES nut_coffee.coffee_shops (id) ON DELETE CASCADE

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Пользователи';
create index users_login_idx on nut_coffee.users (login, password);

insert into nut_coffee.users (login, password, coffee_shop_id, first_name, last_name, phone)
values ('79615554321', '8ccb822da1fea4a5ed5cfad52d7c04bc9e72ad4e', 1, 'Филипп', 'Синицын', 79615554321),
       ('79194253252', '2431bbb4ca51fcc6bba8cad64515dabdfce8ce9d', 2, 'Артем', 'Есинов', 79194253252),
       ('79194524052', '7e6186199c81c011f47dbb00b4ea8a14ccd24700', 3, 'Кирилл', 'Тартян', 79194524052),
       ('79614256894', '7bd284a28273c081ffcb0616680bed9ebe139909', 2, 'Сергей', 'Перов', 79614256894),
       ('79884442233', '0f09f16e5b546b7a51dbe0326b116a46790545c1', 1, 'Владимир', 'Козин', 79884442233),
       ('79155268598', '48163d65e8cb0fcf9eb3150c88f18ea1acee1664', NULL, 'Денис', 'Смагин', 79155268598);

