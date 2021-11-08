INSERT INTO country (name) VALUES
('Belarus'),
('Russian Federation'),
('Ukraine'),
('Poland'),
('Kazakhstan');

INSERT INTO user_role (name) VALUES
('CUSTOMER'),
('ADMIN');

INSERT INTO product_material (name) VALUES
('WOOD'),
('EPOXY'),
('WOOD_EPOXY');

INSERT INTO product_category (name) VALUES
('PENDANT'),
('RING'),
('OTHER');

INSERT INTO user (id, username, password, phone, role_name) VALUES
(DEFAULT, 'admin', '$2a$10$bfhMOcaGids7iiuTZl1E/Op10N/sGekq9wTjQL5iSNuOa7ZKia8g2', '+375290000000', 'ADMIN'),
(DEFAULT, 'customer', '$2a$10$bfhMOcaGids7iiuTZl1E/Op10N/sGekq9wTjQL5iSNuOa7ZKia8g2', '+375330000000', 'CUSTOMER');

INSERT INTO address (id, zip_code, country, region, city, address, user_id) VALUES
(DEFAULT, '220000', 'Belarus', 'Minskiy', 'Minsk', 'Nemiga st. 130', '1');

INSERT INTO product (id, name, care, filling, image_url, price, delivery_days, category_name, material_name) VALUES
(DEFAULT, 'Blackwood', 'Do not wash', '-', 'https://i.imgur.com/Ep79QKy.jpg', 50, 3, 'RING', 'WOOD'),
(DEFAULT, 'Tokyo', 'Not necessary', 'Wood', 'https://i.imgur.com/ZYLOXfq.jpg', 52, 2, 'RING', 'EPOXY'),
(DEFAULT, 'Heart', 'Not necessary', '-', 'https://i.imgur.com/Haj3DYJ.jpg', 85, 1, 'PENDANT', 'WOOD_EPOXY'),
(DEFAULT, 'Botanika', 'Not necessary', 'Moss', 'https://i.imgur.com/qNBnyWY.jpg', 85, 1, 'OTHER', 'WOOD_EPOXY'),
(DEFAULT, 'Oblepiha', 'Do not wash', '-', 'https://i.imgur.com/KWOdl0G.jpg', 65, 1, 'OTHER', 'WOOD');

INSERT INTO basket (id, completed, date, user_id) VALUES
(DEFAULT, true, '2021-09-20', '1');

INSERT INTO basket_item (id, quantity, basket_id, product_id) VALUES
(DEFAULT, '2', '1', '2'),
(DEFAULT, '1', '1', '3');
