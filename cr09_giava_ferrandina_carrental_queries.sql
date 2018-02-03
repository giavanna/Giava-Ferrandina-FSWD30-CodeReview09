-- Get all data about an invoice by the given invoice number
SELECT i.invoice_number, i.invoice_vat, i.invoice_total, i.additional_charges, p.pick_date, p.pick_fuel, p.pick_km, r.return_date, r.return_fuel,
	r.return_km, d.driver_first_name, d.driver_last_name, d.driver_email, c.car_model, c.car_licence_plate
FROM invoice i
INNER JOIN pick p ON i.fk_pick_id = p.pick_id
INNER JOIN `return` r ON i.fk_return_id = r.return_id
INNER JOIN reservation re ON p.fk_reservation_id = re.reservation_id
INNER JOIN driver d ON re.fk_driver_id = d.driver_id
INNER JOIN car c ON re.fk_car_id = c.car_id
INNER JOIN branches b ON re.fk_branches_id = b.branches_id
WHERE i.invoice_number = 1000;

