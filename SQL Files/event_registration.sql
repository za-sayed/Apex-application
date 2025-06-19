create or replace PROCEDURE event_registration (
  p_event_name IN VARCHAR2, p_event_type IN VARCHAR2, p_description IN VARCHAR2, p_start_date IN DATE, p_end_date IN DATE,
  p_organizer_id IN NUMBER, p_venue_id IN NUMBER, p_budget IN NUMBER, p_venue_cost IN NUMBER,p_venue_payment_status IN VARCHAR2
)
AS
BEGIN
  IF NOT Check_organizer_id(p_organizer_id) THEN
    DBMS_OUTPUT.PUT_LINE('Invalid organizer_id.');
  ELSIF NOT Check_venue_id(p_venue_id) THEN
    DBMS_OUTPUT.PUT_LINE('Invalid venue_id.');
  ELSIF p_start_date > p_end_date THEN
    DBMS_OUTPUT.PUT_LINE('Start_date must be earlier than or equal to end date.');
  ELSE
    INSERT INTO Events (event_name, event_type, description, start_date, end_date, organizer_id, venue_id, budget, venue_cost, venue_payment_status) 
    VALUES (p_event_name, p_event_type, p_description, p_start_date, p_end_date, p_organizer_id, p_venue_id, p_budget, p_venue_cost, p_venue_payment_status);
    DBMS_OUTPUT.PUT_LINE('Event registered successfully.');
  END IF;
END;
/