CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    booking_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    rate INT
);

CREATE TABLE booking_commercials (
    booking_id INT,
    item_id INT,
    quantity INT
);

-- Sample Data
INSERT INTO users VALUES (1,'Ram'),(2,'Sam');

INSERT INTO bookings VALUES
(1,1,'2021-11-10'),
(2,2,'2021-11-15');

INSERT INTO items VALUES
(1,'Food',500),
(2,'Room',1000);

INSERT INTO booking_commercials VALUES
(1,1,2),
(1,2,1),
(2,1,1);
