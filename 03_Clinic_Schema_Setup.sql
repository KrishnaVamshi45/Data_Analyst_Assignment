CREATE TABLE clinic_sales (
    id INT,
    date DATE,
    sales_channel VARCHAR(50),
    amount INT
);

CREATE TABLE expenses (
    id INT,
    date DATE,
    amount INT
);

INSERT INTO clinic_sales VALUES
(1,'2021-11-01','Online',5000),
(2,'2021-11-02','Offline',3000);

INSERT INTO expenses VALUES
(1,'2021-11-01',2000),
(2,'2021-11-02',1000);
