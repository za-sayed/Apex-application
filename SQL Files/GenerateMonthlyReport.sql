create or replace PROCEDURE GenerateMonthlyReport(
    p_year        IN NUMBER,
    p_month       IN NUMBER,
    p_venue_id    IN NUMBER
)
IS
    -- Declare a variable to check if the venue exists
    v_venue_exists NUMBER;
    v_event_count  NUMBER;

    -- Cursor to fetch event details
    CURSOR event_cursor IS
        SELECT e.event_id, e.event_name, e.event_type, e.start_date, e.end_date, e.description, 
               o.name AS organizer_name, v.venue_name, e.budget, e.venue_cost, e.venue_payment_status
        FROM events e
        JOIN organizers o ON e.organizer_id = o.organizer_id
        JOIN venues v ON e.venue_id = v.venue_id
        WHERE EXTRACT(YEAR FROM e.start_date) = p_year
          AND EXTRACT(MONTH FROM e.start_date) = p_month
          AND e.venue_id = p_venue_id;

    -- Record to hold event details
    event_record event_cursor%ROWTYPE;
BEGIN
    -- Check if the venue exists
    SELECT COUNT(*)
    INTO v_venue_exists
    FROM venues
    WHERE venue_id = p_venue_id;

    IF v_venue_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Invalid venue ID. Venue does not exist.');
        RETURN;
    END IF;

    -- Check if there are any events for the given venue and month
    SELECT COUNT(*)
    INTO v_event_count
    FROM events
    WHERE EXTRACT(YEAR FROM start_date) = p_year
      AND EXTRACT(MONTH FROM start_date) = p_month
      AND venue_id = p_venue_id;

    IF v_event_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No events found for Venue ID: ' || p_venue_id || ' (' || p_year || '-' || LPAD(p_month, 2, '0') || ').');
        RETURN;
    END IF;

    -- Fetch and display events for the given venue and month
    DBMS_OUTPUT.PUT_LINE('Monthly Report for Venue ID: ' || p_venue_id || ' (' || p_year || '-' || LPAD(p_month, 2, '0') || ')');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');

    OPEN event_cursor;
    LOOP
        FETCH event_cursor INTO event_record;
        EXIT WHEN event_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Event ID: ' || event_record.event_id);
        DBMS_OUTPUT.PUT_LINE('Event Name: ' || event_record.event_name);
        DBMS_OUTPUT.PUT_LINE('Event Type: ' || event_record.event_type);
        DBMS_OUTPUT.PUT_LINE('Start Date: ' || event_record.start_date);
        DBMS_OUTPUT.PUT_LINE('End Date: ' || event_record.end_date);
        DBMS_OUTPUT.PUT_LINE('Description: ' || event_record.description);
        DBMS_OUTPUT.PUT_LINE('Event Budget: ' || event_record.budget);
        DBMS_OUTPUT.PUT_LINE('Organizer: ' || event_record.organizer_name);
        DBMS_OUTPUT.PUT_LINE('Venue Name: ' || event_record.venue_name);
        DBMS_OUTPUT.PUT_LINE('Venue Cost: ' || event_record.venue_cost);
        DBMS_OUTPUT.PUT_LINE('Venue Payment Status: ' || event_record.venue_payment_status);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
    END LOOP;
    CLOSE event_cursor;

END GenerateMonthlyReport;
/