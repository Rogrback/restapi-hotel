const db = require('../models');
const Reservation = db.reservation;
const Op = db.Sequelize.Op;

// List revervations
exports.findOne = async ( req, res ) => {
    db.sequelize.query( 'select cs.first_name, td.name as type_document, cs.document_number, cs.last_name, cs.email, cs.pass, cs.last_access, ro.room_name as type_room, tp.name as type_payment, ro.price from reservations re inner join type_payments tp on re.type_payment = tp.idtypepayment inner join customers cs on re.customer = cs.idcustomer inner join type_documents td on cs.document_type = td.idtypedocument inner join rooms ro on re.room = ro.idroom')
       .then( rows  => res.json(rows))
       .catch(err => {
        res.status(500).send({
            message: err.message || "something went wrong"
        })
    })
   return true
}

// Create reservation
exports.create = (req, res) => {
    const{idreservation, customer, room, initial_date, final_date, rstate, type_payment, observations} = req.body;
    const reservation = {
        idreservation: idreservation,
        customer: customer,
        room: room,
        initial_date: initial_date,
        final_date: final_date,
        rstate: rstate,
        type_payment: type_payment,
        observations: observations
    }
    Reservation.create(reservation).then(data => {res.send(data)}).catch(err => {res.status(500).send({message: err.message})});
}

/*
{
    "idreservation": 2,
    "customer": 2,
    "room": 1,
    "initial_date": "09/09/2022",
    "final_date": "08/09/2022",
    "rstate": 1,
    "type_payment": 2,
    "observations": "Reserva importante"
}

{
    "idreservation": 3,
    "customer": 3,
    "room": 3,
    "initial_date": "10/10/2022",
    "final_date": "10/11/2022",
    "rstate": 1,
    "type_payment": 4,
    "observations": "Reserva importante para conferencia"
}
*/