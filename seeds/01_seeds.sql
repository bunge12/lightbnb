INSERT INTO users
  (name, email, password)
VALUES
  ('John Snow', 'jsnow@rogers.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('John Smith', 'jsmoith@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Sam Smith', 'ssmith@samsmith.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Eva Stanley', 'sebastianguerra@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Louisa Meyer', 'jacksonrose@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Dominic Parks', 'victoriablackwell@outlook.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Sue Luna', 'jasonvincent@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Rosalie Garza', 'jacksondavid@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Etta West', 'charlielevy@yahoo.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Margaret Wong', 'makaylaweiss@icloud.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Leroy Hart', 'jaycereynolds@inbox.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties
  (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES
  (1, 'City Mansion', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 90210, 2, 2, 4, 'Canada', '1 Younge St', 'Toronto', 'ON', 'X0X 0X0', true),
  (2, 'Gorg Mansion', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 7800, 2, 2, 4, 'Canada', '1 Desmond St', 'Vanc', 'BC', 'X0X 0X0', true),
  (3, 'City Flat', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 4566, 2, 2, 4, 'Canada', '1 Nelson St', 'Toronto', 'ON', 'X0X 0X0', true),
  (4, 'City Place', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 2345, 2, 2, 4, 'Canada', '1 Bloor St', 'Kelowna', 'ON', 'X0X 0X0', true),
  (5, 'City House', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 65467, 2, 2, 4, 'Canada', '1 King St', 'Toronto', 'ON', 'X0X 0X0', true),
  (2, 'Town House', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 7654, 2, 2, 4, 'Canada', '1 Younge St', 'Scarbs', 'ON', 'X0X 0X0', true),
  (3, 'City Cottage', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 9876, 2, 2, 4, 'Canada', '1 Queen St', 'Toronto', 'ON', 'X0X 0X0', true),
  (6, 'City Hut', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 43234, 2, 2, 4, 'Canada', '1 Younge St', 'Sauga', 'ON', 'X0X 0X0', true),
  (7, 'City Shed', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 23456, 2, 2, 4, 'Canada', '1 Dundas St', 'Toronto', 'ON', 'X0X 0X0', true),
  (8, 'City Basement', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 45678, 2, 2, 4, 'Canada', '1 Younge St', 'Oshawa', 'ON', 'X0X 0X0', true);

INSERT INTO reservations
  (start_date, end_date, property_id, guest_id)
VALUES
  ('2018-01-01', '2019-01-01', 3, 3),
  ('2019-03-01', '2019-06-01', 4, 2),
  ('2019-01-01', '2019-05-01', 5, 1),
  ('2019-06-01', '2019-09-01', 6, 6),
  ('2019-01-01', '2019-04-01', 3, 5),
  ('2019-08-01', '2019-09-01', 4, 4),
  ('2019-01-01', '2019-03-01', 5, 3);

INSERT INTO property_reviews
  (guest_id, property_id, reservation_id, rating, message)
VALUES
  (3, 3, 1, 5, 'Message'),
  (2, 4, 2, 4, 'Message'),
  (1, 5, 3, 5, 'Message'),
  (6, 6, 4, 3, 'Message'),
  (5, 3, 5, 2, 'Message'),
  (4, 4, 6, 1, 'Message');