-- QUESTION 1 : BANK ACCOUNTS
CREATE TABLE bank_accounts (
    account_no   VARCHAR2(10),
    holder_name  VARCHAR2(50),
    balance      NUMBER
);

INSERT INTO bank_accounts VALUES ('A01', 'Ali', 20000);
INSERT INTO bank_accounts VALUES ('B01', 'Sara', 15000);
INSERT INTO bank_accounts VALUES ('C01', 'Usman', 10000);

UPDATE bank_accounts SET balance = balance - 5000 WHERE account_no = 'A01';
UPDATE bank_accounts SET balance = balance + 5000 WHERE account_no = 'B01';

UPDATE bank_accounts SET balance = balance - 2000 WHERE account_no = 'C01';

ROLLBACK;

SELECT * FROM bank_accounts;

-- QUESTION 2 : INVENTORY
CREATE TABLE inventory (
    item_id    NUMBER,
    item_name  VARCHAR2(50),
    quantity   NUMBER
);

INSERT INTO inventory VALUES (1, 'Pen', 100);
INSERT INTO inventory VALUES (2, 'Notebook', 200);
INSERT INTO inventory VALUES (3, 'Marker', 150);
INSERT INTO inventory VALUES (4, 'Eraser', 80);

UPDATE inventory SET quantity = quantity - 10 WHERE item_id = 1;

SAVEPOINT sp1;

UPDATE inventory SET quantity = quantity - 20 WHERE item_id = 2;

SAVEPOINT sp2;

UPDATE inventory SET quantity = quantity - 5 WHERE item_id = 3;

ROLLBACK TO sp1;

COMMIT;

SELECT * FROM inventory;

-- QUESTION 3 : FEES
CREATE TABLE fees (
    student_id   NUMBER,
    name         VARCHAR2(50),
    amount_paid  NUMBER,
    total_fee    NUMBER
);

INSERT INTO fees VALUES (1, 'Ali', 5000, 10000);
INSERT INTO fees VALUES (2, 'Sara', 6000, 10000);
INSERT INTO fees VALUES (3, 'Usman', 4000, 10000);

UPDATE fees SET amount_paid = amount_paid + 2000 WHERE student_id = 1;

SAVEPOINT halfway;

UPDATE fees SET amount_paid = amount_paid + 3000 WHERE student_id = 2;

ROLLBACK TO halfway;

COMMIT;

SELECT * FROM fees;

-- QUESTION 4 : PRODUCTS & ORDERS
CREATE TABLE products (
    product_id    NUMBER,
    product_name  VARCHAR2(50),
    stock         NUMBER
);

CREATE TABLE orders (
    order_id    NUMBER,
    product_id  NUMBER,
    quantity    NUMBER
);

INSERT INTO products VALUES (1, 'Laptop', 50);
INSERT INTO products VALUES (2, 'Mouse', 100);
INSERT INTO products VALUES (3, 'Keyboard', 80);

UPDATE products SET stock = stock - 5 WHERE product_id = 1;
INSERT INTO orders VALUES (101, 1, 5);

DELETE FROM products WHERE product_id = 2;

ROLLBACK;

UPDATE products SET stock = stock - 5 WHERE product_id = 1;
INSERT INTO orders VALUES (102, 1, 5);

COMMIT;

SELECT * FROM products;
SELECT * FROM orders;

-- QUESTION 5 : EMPLOYEES
CREATE TABLE employees (
    emp_id    NUMBER,
    emp_name  VARCHAR2(50),
    salary    NUMBER
);

INSERT INTO employees VALUES (1, 'Ali', 30000);
INSERT INTO employees VALUES (2, 'Sara', 35000);
INSERT INTO employees VALUES (3, 'Usman', 28000);
INSERT INTO employees VALUES (4, 'Hina', 40000);
INSERT INTO employees VALUES (5, 'Ahmed', 32000);

UPDATE employees SET salary = salary + 5000 WHERE emp_id = 1;

SAVEPOINT A;

UPDATE employees SET salary = salary + 4000 WHERE emp_id = 2;

SAVEPOINT B;

UPDATE employees SET salary = salary + 3000 WHERE emp_id = 3;

ROLLBACK TO A;

COMMIT;

SELECT * FROM employees;
