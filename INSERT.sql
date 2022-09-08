--INSERT CUSTOMER
INSERT INTO public.customers (first_name, last_name, phone_number, document_type, document_number, email, pass, last_access, observations)
VALUES ('Pablo', 'Rosales', '+51981165782', 1, '568744233', 'prosales@gmail.com', '4V*aR8fv5', '08/09/2022', 'Cliente frecuente')
select * from customers

--INSERT TYPE DOCUMENT
INSERT INTO public.type_documents (name) VALUES ('DNI'), ('PASAPORTE'), ('CARNET DE EXTRANJERIA');
select * from type_documents

--INSERT ROOM
INSERT INTO public.rooms (room_name, price) 
VALUES ('Habitación Simple (1 cama simple)', 85.00),
('Habitación Doble (2 camas simples o 01 cama matrimonial)', 100.00),
('Habitación Doble con Balcón (2 camas simples o 01 cama matrimonial)', 120.00);
select * from rooms

--INSERT TYPE PAYMENT
INSERT INTO public.type_payments (name) 
VALUES ('Efectivo'), ('Tarjeta débito'), ('Tarjeta crédito'), ('Transferencia bancaria'), ('Paypal'), ('Por móvil');
select * from type_payments

--INSERT RESERVATION
INSERT INTO public.reservations (customer, room, initial_date, final_date, rstate, type_payment, observations)
VALUES (1, 1, '09/09/2022', '11/09/2022', 1, 1, 'Sin observaciones');
select * from reservations

--INSERT RESERVATION STATE
INSERT INTO public.reservation_states (rstate) VALUES ('Pendiente'), ('Pagado'), ('Eliminado');
select * from reservation_states

--QUERY LIST RESERVATION
select cs.first_name, td.name as type_document, cs.document_number, cs.last_name, cs.email, cs.pass, cs.last_access, ro.room_name as type_room, tp.name as type_payment, ro.price from reservations re
inner join type_payments tp on re.type_payment = tp.idtypepayment
inner join customers cs on re.customer = cs.idcustomer
inner join type_documents td on cs.document_type = td.idtypedocument 
inner join rooms ro on re.room = ro.idroom

--QUERU UPDATE TABLE NAME
ALTER TABLE prueba
RENAME TO pruebas; 