create or replace FUNCTION Check_venue_id (p_venue_id IN NUMBER)
  RETURN BOOLEAN
AS
  v_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_count
  FROM Venues
  WHERE venue_id = p_venue_id;
  RETURN (v_count > 0);
END;
/