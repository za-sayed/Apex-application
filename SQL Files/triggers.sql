
CREATE OR REPLACE TRIGGER trg_event_id
BEFORE INSERT ON Events
FOR EACH ROW
BEGIN
    IF :NEW.event_id IS NULL THEN
        :NEW.event_id := seq_event_id.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_organizer_id
BEFORE INSERT ON Organizers
FOR EACH ROW
BEGIN
    IF :NEW.organizer_id IS NULL THEN
        :NEW.organizer_id := seq_organizer_id.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_venue_id
BEFORE INSERT ON Venues
FOR EACH ROW
BEGIN
    IF :NEW.venue_id IS NULL THEN
        :NEW.venue_id := seq_venue_id.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_participant_id
BEFORE INSERT ON Participants
FOR EACH ROW
BEGIN
    IF :NEW.participant_id IS NULL THEN
        :NEW.participant_id := seq_participant_id.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_vendor_id
BEFORE INSERT ON Vendors
FOR EACH ROW
BEGIN
    IF :NEW.vendor_id IS NULL THEN
        :NEW.vendor_id := seq_vendor_id.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_payment_id
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    IF :NEW.payment_id IS NULL THEN
        :NEW.payment_id := seq_payment_id.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_staff_id
BEFORE INSERT ON Staff
FOR EACH ROW
BEGIN
    IF :NEW.staff_id IS NULL THEN
        :NEW.staff_id := seq_staff_id.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_activity_id
BEFORE INSERT ON EVENTACTIVITIES
FOR EACH ROW
BEGIN
    IF :NEW.activity_id IS NULL THEN
        :NEW.activity_id := seq_activity_id.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_task_id
BEFORE INSERT ON TASKS
FOR EACH ROW
BEGIN
    IF :NEW.task_id IS NULL THEN
        :NEW.task_id := seq_task_id.NEXTVAL;
    END IF;
END;
/