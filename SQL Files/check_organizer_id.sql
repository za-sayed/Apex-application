create or replace FUNCTION Check_organizer_id (p_organizer_id IN NUMBER)
  RETURN BOOLEAN
AS
  v_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_count
  FROM Organizers
  WHERE organizer_id = p_organizer_id;
  RETURN (v_count > 0);
END;
/