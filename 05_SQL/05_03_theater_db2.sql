-- ONE-TO-MANY
ALTER TABLE events
ADD CONSTRAINT fk_events_auditoria FOREIGN KEY (auditorium_id) REFERENCES auditoria;

ALTER TABLE events
ADD CONSTRAINT fk_events_films FOREIGN KEY (film_id) REFERENCES films;
-- ALT REFERENCES films(id)

-- ONE-TO-ONE
ALTER TABLE accounts
ADD CONSTRAINT fk_accounts_customers FOREIGN KEY (customer_id) REFERENCES customers;

-- MANY-TO-MANY
ALTER TABLE event_purchases
ADD CONSTRAINT fk_event_purchases_events FOREIGN KEY (event_id) REFERENCES events;

ALTER TABLE event_purchases
ADD CONSTRAINT fk_event_purchases_customers FOREIGN KEY (customer_id) REFERENCES customers;