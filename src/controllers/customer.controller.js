const db = require('../models');
const Customer = db.customer;
const Op = db.Sequelize.Op;

// List customers
exports.findAll = (req, res) => {
    Customer.findAll()
        .then(data => res.send(data))
        .catch(err => {
            res.status(500).send({
                message: err.message || "something went wrong"
            })
        })        
}

// Create customer
exports.create = (req, res) => {
    const{idcustomer, first_name, last_name, phone_number, document_type, document_number, email, pass, last_access, observations} = req.body;
    const customer = {
        idcustomer: idcustomer,
        first_name: first_name,
        last_name: last_name,
        phone_number: phone_number,
        document_type: document_type,
        document_number: document_number,
        email: email,
        pass: pass,
        last_access: last_access,
        observations: observations
    }
    Customer.create(customer).then(data => {res.send(data)}).catch(err => {res.status(500).send({message: err.message})});
}

/*
{   
    "idcustomer": 2,
    "first_name": "Maria",
    "last_name": "Rosales",
    "phone_number": "965236874",
    "document_type": 1,
    "document_number": "78965235",
    "email": "mrosales@gmail.com",
    "pass": "5V*aR8fv5",
    "last_access": "08/09/2022",
    "observations": "Cliente concurrido"
}

{   
    "idcustomer": 3,
    "first_name": "Thalia",
    "last_name": "Fernandez",
    "phone_number": "975663248",
    "document_type": 1,
    "document_number": "85674235",
    "email": "tfernandez@gmail.com",
    "pass": "6V*aR8fv5",
    "last_access": "08/09/2022",
    "observations": "Cliente concurrido"
}
*/