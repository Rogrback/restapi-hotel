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

// Delete customer
exports.delete = async(req, res) => {
    try{
        const {dni} = req.params;
        const findCustomerById = await Customer.findByPk(dni);
        if(!findCustomerById){
            res.status(404).send({
                status: 'error',
                message: `Customer with dni ${dni} not found`
            })
        }
        const deleteCustomer = findCustomerById.destroy();
        if(!deleteCustomer){
            res.status(503).send({
                status: 'error',
                message: `Customer with dni ${dni} failed delete`
            })
        }
        res.status(200).send({
            status: 'success',
            message: `Customer with dni ${dni} deleted`
        })
    } catch (error){
        console.log(error);
    }
}

// Update customer
exports.update = async(req, res) => {
    try{
        const {dnis} = req.params;
        const {dni, first_name, last_name, email, phone_number, postal_code, city} = req.body;
        const findCustomerById = await Customer.findOne({
            where: {
                dni
            }
        })
        if(!findCustomerById){
            res.status(404).send({
                status: 'error',
                message: `Customer with dni ${dnis} not found`
            })
        }
        const update = {};
        if(first_name) findCustomerById.first_name = first_name;
        if(last_name) findCustomerById.last_name = last_name;
        if(email) findCustomerById.email = email;
        if(phone_number) findCustomerById.phone_number = phone_number;
        if(postal_code) findCustomerById.postal_code = postal_code;
        if(city) findCustomerById.city = city;
        const updateCustomer = await findCustomerById.save()
        if(!updateCustomer){
            res.status(400).send({
                status: 'error',
                message: `Data customer with dni ${dnis} failed update`
            })
        }
        res.status(200).send({
            status: 'success',
            data: updateCustomer
        })
    } catch (error){
        console.log(error);
    }
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