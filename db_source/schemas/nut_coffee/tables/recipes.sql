-- drop table nut_coffee.recipes;
CREATE TABLE nut_coffee.recipes
(
    id             serial      NOT NULL PRIMARY KEY COMMENT 'id продаваемого рецепта',
    name           varchar(45) NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Наименование продаваемого рецепта',
    description    varchar(500) COLLATE utf8mb4_unicode_ci COMMENT 'Описание продаваемого рецепта',
    author         varchar(45) not null COMMENT 'Автор рецепта',
    created_at     datetime    not null default now() COMMENT 'Дата/время создания рецепта',
    renew_user     varchar(45) COMMENT 'Пользователь редактирования рецепта',
    renew_datetime datetime COMMENT 'Дата/время изменения рецепта'

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Рецепты';
