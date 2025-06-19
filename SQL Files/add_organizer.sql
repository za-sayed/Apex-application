create or replace PROCEDURE add_organizer (
    p_name IN VARCHAR2,
    p_email IN VARCHAR2,
    p_phone_number IN VARCHAR2
)
AS 
    v_count NUMBER := 0;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Organizers
    WHERE email = p_email;

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Unsuccessful, another Oraginzer exist with exact same email!!!!');
    ELSE
        INSERT INTO Organizers (name, email, phone_number)
        VALUES (p_name, p_email, p_phone_number);

        DBMS_OUTPUT.PUT_LINE('Organizer added successfully.');
    END IF;
END;
/
