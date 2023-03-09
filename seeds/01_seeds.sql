INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26', 2, 3),
('2019-01-04', '2019-02-01', 2, 2),
('2021-10-01', '2021-10-14', 1, 3);

    INSERT INTO reservations (
    id, guest_id, property_id, start_date, end_date) 
    VALUES (
    1009999, 743, 114, '2022-09-30', '2022-10-15');

INSERT INTO users (name, email, password) 
VALUES ('Mike', 'Mike@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Robert', 'Robert@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Charlie', 'Charlie@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title,description,thumbnail_photo_url, cover_photo_url,cost_per_night, parking_spaces,number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES ('1', '2 bed house', 'description', 'www.picture.com/coverMike','www.picture.com/mike', 50, 1 , 1, 1, 'canada', '11 street', 'vancouver', 'bc', 'v4k1h1', true),
('2','super big house', 'description', 'www.picture.com/coverRobert','www.picture.com/Robert', 950, 3 , 3, 0, 'canada', '22 street', 'vancouver', 'bc', 'v4k2l3', false),
('3','alleyway', 'description', 'www.picture.com/coverCharlie','www.picture.com/Charlie', 240, 0 , 0, 2, 'canada', '398 ave', 'toronoto', 'ON', 'l1k2j2', true);

INSERT INTO properties (
    title, description, owner_id, cover_photo_url, thumbnail_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, active, province, city, country, street, post_code) 
    VALUES (
    'Daily every', 'Sick foot brain express truth sure written exclaimed entire ability next treated store coast tail kept coast sheet symbol zulu gradually season southern oxygen than appropriate title see work making draw plates canal contrast whom page five rocky evidence operation active steam yesterday hurt earlier movement branch dig some light peace parent fighting driving memory variety final replace catch monkey born shape brush brown fewer wore duty show direct mood quarter spread opportunity salmon paint cool school blew mail toy about thrown pond bottom burst gasoline taught driver great tropical is brother human hurried truck top tin nodded skin breathe world fat than dust origin slow dust tired harder summer point underline sides equal birthday dig brass around me lungs to tent word definition fair equator grow seems duck feathers examine song ten direction stage tax happily eye using pitch forward memory mad captured into low advice officer judge he onto breakfast verb attached gave discovery managed ran faster ago enemy train guard park welcome everybody excited skill date recall hot nervous examine first pilot house select clothes alone policeman play join steel weak like first pony danger aware of prevent steel further throat has leaving ordinary operation got gain week ill ill diameter composition milk select seed there sheep year spin some memory mysterious sides trap walk composed possible lungs good peace measure gradually rise service frozen inch dog love apart became oldest song customs number bottom outline office married plural reason structure stock someone worse must creature ready gently fireplace us court mill vessels very grade gradually simplest escape harbor excellent community control tired him create suggest pine sun principal start worker organized began food choice until subject putting tube fair spider typical eat known total difficulty forget expression shore develop important condition adjective universe production shade train', 103, 'https://images.pexels.com/photos/2088258/table-dining-room-chair-dining-area-2088258.jpeg', 'https://images.pexels.com/photos/2088258/table-dining-room-chair-dining-area-2088258.jpeg?auto=compress&cs=tinysrgb&h=350', 2438, 8, 2, 1, true, 'Prince Edward Island', 'Charlottetown', 'Canada', '1716 Misih Highway', '48752');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES ('3','2','1','3','message'),
('2','2','2','4','message'),
('3','1','3','4','message');

    INSERT INTO property_reviews (
    guest_id, property_id, reservation_id, rating, message) 
    VALUES (
    340, 769, 1013720, 5, 'Filin alforec pad sevopa ej jesebfuh tap ma ajafihjoc pujawoso kuez zitu sebfal zialuti jool rudpi gogofiri da.');

