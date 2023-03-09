INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26', 2, 3),
('2019-01-04', '2019-02-01', 2, 2),
('2021-10-01', '2021-10-14', 1, 3);

INSERT INTO users (name, email, password) 
VALUES ('Mike', 'Mike@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Robert', 'Robert@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Charlie', 'Charlie@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title,description,thumbnail_photo_url, cover_photo_url,cost_per_night, parking_spaces,number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES ('1', '2 bed house', 'description', 'www.picture.com/coverMike','www.picture.com/mike', 50, 1 , 1, 1, 'canada', '11 street', 'vancouver', 'bc', 'v4k1h1', true),
('2','super big house', 'description', 'www.picture.com/coverRobert','www.picture.com/Robert', 950, 3 , 3, 0, 'canada', '22 street', 'vancouver', 'bc', 'v4k2l3', false),
('3','alleyway', 'description', 'www.picture.com/coverCharlie','www.picture.com/Charlie', 240, 0 , 0, 2, 'canada', '398 ave', 'toronoto', 'ON', 'l1k2j2', true);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES ('3','2','1','3','message'),
('2','2','2','4','message'),
('3','1','3','4','message');

