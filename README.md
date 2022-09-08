# RESTAPI-HOTEL
RESTAPI para una prueba técnica.
Tecnologías que eh utilizado en este proyecto:
- Express
- Sequelize
- Postgres
- Docker
## FLUJO DE OPERACIÓN DE RESERVA
Empieza con la creación del cliente a través de la web, donde se adjunta los siguientes datos:
* Nombre y apellido
* Número de teléfono
* Tipo de documento de identificació y su número
* Correo y contraseña (en este caso para las reservas en la página web del hotel)

Adicionalmente, se tiene la información del cliente sobre:
* Último acceso del cliente
* Observaciones sobre el cliente

Una vez obtenido la información del cliente, se puede obtener una reserva, éstas detallan los siguientes datos:
* Cliente
* Habitación
* Fecha inicial y final de la reserva
* Estado (Pendiente, pagado o eliminado)
* Tipo de pago
* Observaciones sobre la reserva
## APIS
### API CUSTOMER
Listar cliente
```
localhost:4000/api/list-customers
```
Crear cliente
```
localhost:4000/api/create-customer
```
### API RESERVATION

Listar reservación
```
localhost:4000/api/list-reservations
```
Crear reservación
```
localhost:4000/api/create-reservation
```
