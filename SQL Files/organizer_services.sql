create or replace PROCEDURE organizer_services (v_organizer_name IN VARCHAR2) IS
   v_organizer_row ORGANIZERS%ROWTYPE;
BEGIN
     -- organizer info printing
     select * into v_organizer_row from ORGANIZERS Where NAME = v_organizer_name;  
     DBMS_OUTPUT.PUT_LINE('oranizer info: ');
     DBMS_OUTPUT.PUT_LINE('id           ' || v_organizer_row.ORGANIZER_ID);
     DBMS_OUTPUT.PUT_LINE('name         ' || v_organizer_row.Name);
     DBMS_OUTPUT.PUT_LINE('email        ' || v_organizer_row.Email);
     DBMS_OUTPUT.PUT_LINE('phone number ' || v_organizer_row.Phone_Number);
     -- events organizer participating in printing
     for event in (select * from EVENTS Where ORGANIZER_ID = v_organizer_row.ORGANIZER_ID) LOOP
        DBMS_OUTPUT.PUT_LINE('details of events organizer is enrolled in :');
        DBMS_OUTPUT.PUT_LINE('  *********** event with id ' || event.EVENT_ID || ' ***********');
        DBMS_OUTPUT.PUT_LINE('  name         ' || event.EVENT_NAME);
        DBMS_OUTPUT.PUT_LINE('  type         ' || event.EVENT_TYPE);
        DBMS_OUTPUT.PUT_LINE('  decription   ' || event.DESCRIPTION);
        DBMS_OUTPUT.PUT_LINE('  start date   ' || event.START_DATE);
        DBMS_OUTPUT.PUT_LINE('  end date     ' || event.END_DATE);
        DBMS_OUTPUT.PUT_LINE('  venue id     ' || event.VENUE_ID);
     END LOOP;
END;
/