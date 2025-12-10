-- Question 01:
CREATE OR REPLACE TRIGGER trg_uppercase_student_name
BEFORE INSERT ON STUDENTS
FOR EACH ROW
BEGIN
    :NEW.student_name := UPPER(:NEW.student_name);
END;
/

-- Question 02:
CREATE OR REPLACE TRIGGER trg_no_delete_weekends
BEFORE DELETE ON EMPLOYEES
FOR EACH ROW
DECLARE
    v_day VARCHAR2(20);
BEGIN
    v_day := TO_CHAR(SYSDATE, 'DAY');

    IF TRIM(v_day) IN ('SATURDAY', 'SUNDAY') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Deletion not allowed on weekends');
    END IF;
END;
/

-- Question 03:
CREATE TABLE LOG_SALARY_AUDIT (
    emp_id     NUMBER,
    old_salary NUMBER,
    new_salary NUMBER,
    changed_by VARCHAR2(50),
    change_date DATE
);

CREATE OR REPLACE TRIGGER trg_log_salary_update
AFTER UPDATE OF salary ON EMPLOYEES
FOR EACH ROW
BEGIN
    INSERT INTO LOG_SALARY_AUDIT
    VALUES (
        :OLD.emp_id,
        :OLD.salary,
        :NEW.salary,
        USER,
        SYSDATE
    );
END;
/


-- Question 04:
CREATE OR REPLACE TRIGGER trg_no_negative_price
BEFORE UPDATE OF price ON PRODUCTS
FOR EACH ROW
BEGIN
    IF :NEW.price < 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Price cannot be negative');
    END IF;
END;
/

-- Question 05:
ALTER TABLE COURSES
ADD (created_by VARCHAR2(50), created_on DATE);

CREATE OR REPLACE TRIGGER trg_courses_audit
BEFORE INSERT ON COURSES
FOR EACH ROW
BEGIN
    :NEW.created_by := USER;
    :NEW.created_on := SYSDATE;
END;
/

-- Question 06:
CREATE OR REPLACE TRIGGER trg_default_department
BEFORE INSERT ON EMP
FOR EACH ROW
BEGIN
    IF :NEW.department_id IS NULL THEN
        :NEW.department_id := 10;  -- default department
    END IF;
END;
/

-- Question 07:
CREATE OR REPLACE TRIGGER trg_sales_compound
FOR INSERT ON SALES
COMPOUND TRIGGER

    v_total_before NUMBER := 0;
    v_total_after  NUMBER := 0;

    BEFORE STATEMENT IS
    BEGIN
        SELECT NVL(SUM(amount), 0) INTO v_total_before FROM SALES;
    END BEFORE STATEMENT;

    AFTER EACH ROW IS
    BEGIN
        v_total_after := v_total_after + :NEW.amount;
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Total before insert: ' || v_total_before);
        DBMS_OUTPUT.PUT_LINE('Inserted total: ' || v_total_after);
        DBMS_OUTPUT.PUT_LINE('Final total: ' || (v_total_before + v_total_after));
    END AFTER STATEMENT;

END;
/

-- Question 08:
CREATE TABLE SCHEMA_DDL_LOG (
    username      VARCHAR2(50),
    object_name   VARCHAR2(50),
    object_type   VARCHAR2(30),
    operation     VARCHAR2(30),
    log_date      DATE
);

CREATE OR REPLACE TRIGGER trg_audit_ddl
AFTER CREATE OR DROP ON SCHEMA
BEGIN
    INSERT INTO SCHEMA_DDL_LOG
    VALUES (
        SYS.LOGIN_USER,
        SYS.DICTIONARY_OBJ_NAME,
        SYS.DICTIONARY_OBJ_TYPE,
        SYS.SYSEVENT,
        SYSDATE
    );
END;
/

-- Question 09:
CREATE OR REPLACE TRIGGER trg_no_update_shipped
BEFORE UPDATE ON ORDERS
FOR EACH ROW
BEGIN
    IF :OLD.order_status = 'SHIPPED' THEN
        RAISE_APPLICATION_ERROR(-20003, 'Cannot update a shipped order');
    END IF;
END;
/

-- Question 10:
CREATE TABLE LOGIN_AUDIT (
    username   VARCHAR2(50),
    login_time DATE
);

CREATE OR REPLACE TRIGGER trg_log_user_login
AFTER LOGON ON SCHEMA
BEGIN
    INSERT INTO LOGIN_AUDIT
    VALUES (USER, SYSDATE);
END;
/
