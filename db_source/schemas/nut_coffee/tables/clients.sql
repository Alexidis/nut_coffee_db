-- drop table nut_coffee.clients;
CREATE TABLE nut_coffee.clients
(
    id             serial      NOT NULL PRIMARY KEY COMMENT 'id клиента',
    first_name     varchar(45) NOT NULL COLLATE utf8mb4_unicode_ci COMMENT 'Имя клиента',
    phone          bigint      NOT NULL unique COMMENT 'Телефон клиента',
    note           varchar(45) COLLATE utf8mb4_unicode_ci COMMENT 'Примечание',
    created_at     datetime    not null default now() COMMENT 'Дата создания клиента',
    renew_datetime datetime COMMENT 'Дата/время изменения состояния клиента'

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT ='Клиенты';
create index clients_phone_idx on nut_coffee.clients (phone);

INSERT INTO nut_coffee.clients (id, first_name, phone)
VALUES
    ('1', 'Bernadine', '79609356692'),
    ('2', 'Deonte', '79379349239'),
    ('3', 'Rosemary', '79360968353'),
    ('4', 'Leo', '79472993494'),
    ('5', 'Hassie', '79570380726'),
    ('6', 'Maximus', '79016483839'),
    ('7', 'Roxanne', '79771163626'),
    ('8', 'Gabe', '79047097613'),
    ('9', 'Charity', '79222614450'),
    ('10', 'Dorris', '79736861461'),
    ('11', 'Hilbert', '79614567136'),
    ('12', 'Rose', '79518923590'),
    ('13', 'Imani', '79513062659'),
    ('14', 'Janie', '79567917017'),
    ('15', 'Zelma', '79026247078'),
    ('16', 'Mackenzie', '79835718383'),
    ('17', 'Amir', '79373241012'),
    ('18', 'Ronaldo', '79645541782'),
    ('19', 'Dannie', '79583812843'),
    ('20', 'Ethyl', '79863176451'),
    ('21', 'Tressie', '79383180815'),
    ('22', 'Mackenzie', '79534757219'),
    ('23', 'Gustave', '79121240545'),
    ('24', 'Desiree', '79112377856'),
    ('25', 'Guido', '79137673761'),
    ('26', 'Oliver', '79298367661'),
    ('27', 'Tyshawn', '79351347045'),
    ('28', 'Kiel', '79712701341'),
    ('29', 'Ralph', '79914117597'),
    ('30', 'Vernie', '79746674015'),
    ('31', 'Lafayette', '79568513411'),
    ('32', 'Colby', '79240328389'),
    ('33', 'Dylan', '79135391091'),
    ('34', 'Lester', '79200174192'),
    ('35', 'Raheem', '79128786137'),
    ('36', 'Dario', '79385542601'),
    ('37', 'Cristobal', '79246796111'),
    ('38', 'Jeanie', '79436006330'),
    ('39', 'Anthony', '79452082266'),
    ('40', 'Maynard', '79377844576'),
    ('41', 'Nola', '79258693148'),
    ('42', 'Bart', '79175481935'),
    ('43', 'Rosie', '79315120331');
