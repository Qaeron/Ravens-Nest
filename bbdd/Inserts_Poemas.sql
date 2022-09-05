--INSERTS usuarios
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('1', 'Charles', 'Queensworth', 'cqueensworth@gmail.no', 'qwerty');
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('2', 'Kiyori', 'Nattoro', 'knattoro@gmail.no', 'qwerty');
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('3', 'Daub', 'Swanna', 'dswanna@gmail.no', 'qwerty');
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('4', 'Juan', 'Garcia Orondo', 'jgorondo@gmail.no', 'qwerty');
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('5', 'Alejandra', 'Rubio Herrero', 'arherrero@gmail.no', 'qwerty');
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('6', 'John', 'Carter', 'jcarter@gmail.no', 'qwerty');
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('7', 'Usher', 'Aussie', 'uassie@gmail.no', 'qwerty');
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('8', 'Liam', 'Washington', 'lwashington@gmail.no', 'qwerty');
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('9', 'Olivia', 'Autumn', 'oautumn@gmail.no', 'qwerty');
INSERT INTO USERS (id_user, user_name, user_surname, email, user_password) VALUES ('10', 'Anna', 'Barikovich', 'abarikovich@gmail.no', 'qwerty');

--INSERTS autores
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('1', 'Maya', 'Angelou', '04/04/1928', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('2', 'Edgar', 'Allan Poe', '07/12/1928', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('3', 'Emily', 'Dickinson', '11/11/1922', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('4', 'Pablo', 'Neruda', '18/11/1939', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('5', 'William', 'Butler Yeats', '21/02/1962', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('6', 'John', 'Keats', '26/03/1941', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('7', 'William', 'Shakespeare', '20/09/1948', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('8', 'Sarojini', 'Naidu', '05/01/1932', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('9', 'Isabel', 'Allende', '02/08/1942', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO AUTHORS (id_author, author_name, author_surname, author_birthdate, author_description) VALUES ('10', 'Almudena', 'Grandes', '07/05/1960', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');

--INSERTS poemas
INSERT INTO POEMS (id_poem, id_author, title, publish_date, poem_description) VALUES (1, 3, 'The Red Wheelbarrow', '31/03/1969', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO POEMS (id_poem, id_author, title, publish_date, poem_description) VALUES (2, 4, 'The Waste Land', '01/05/2003', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO POEMS (id_poem, id_author, title, publish_date, poem_description) VALUES (3, 4, 'The Road Not Taken', '07/09/2009', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO POEMS (id_poem, id_author, title, publish_date, poem_description) VALUES (4, 10, 'We Real Cool', '01/01/2001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO POEMS (id_poem, id_author, title, publish_date, poem_description) VALUES (5, 8, 'Harlem', '01/01/1980', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO POEMS (id_poem, id_author, title, publish_date, poem_description) VALUES (6, 9, 'Howl', '01/01/1987', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO POEMS (id_poem, id_author, title, publish_date, poem_description) VALUES (7, 11, 'Still I Rise', '01/01/1994', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO POEMS (id_poem, id_author, title, publish_date, poem_description) VALUES (8, 7, 'The Raven', '01/01/1998', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO POEMS (id_poem, id_author, title, publish_date, poem_description) VALUES (9, 2, 'Shall I compare thee to a summers day?', '01/01/1988', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');

--INSERTS reseñas
INSERT INTO REVIEWS (id_review, id_poem, id_user, review_rating, review_content) VALUES (1, 2, 4, '3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO REVIEWS (id_review, id_poem, id_user, review_rating, review_content) VALUES (2, 2, 2, '1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO REVIEWS (id_review, id_poem, id_user, review_rating, review_content) VALUES (3, 6, 1, '9', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO REVIEWS (id_review, id_poem, id_user, review_rating, review_content) VALUES (4, 9, 9, '7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO REVIEWS (id_review, id_poem, id_user, review_rating, review_content) VALUES (5, 4, 2, '5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO REVIEWS (id_review, id_poem, id_user, review_rating, review_content) VALUES (6, 2, 6, '4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO REVIEWS (id_review, id_poem, id_user, review_rating, review_content) VALUES (7, 1, 6, '5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO REVIEWS (id_review, id_poem, id_user, review_rating, review_content) VALUES (8, 10, 8, '8', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
INSERT INTO REVIEWS (id_review, id_poem, id_user, review_rating, review_content) VALUES (9, 10, 2, '9', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');