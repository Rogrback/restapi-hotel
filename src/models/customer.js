const {DataTypes} = require('sequelize');

module.exports = (sequelize, Sequelize) => {
    const Customer = sequelize.define("customer", {
        idcustomer: {
            primaryKey: true,
            type: Sequelize.INTEGER,
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4
        },
        first_name: {
            type: Sequelize.STRING
        },
        last_name: {
            type: Sequelize.STRING
        },
        phone_number: {
            type: Sequelize.CHAR
        },
        document_type: {
            type: Sequelize.INTEGER
        },
        document_number: {
            type: Sequelize.CHAR
        },        
        email: {
            type: Sequelize.STRING
        },
        pass: {
            type: Sequelize.STRING
        },
        last_access: {
            type: Sequelize.DATE
        },
        observations: {
            type: Sequelize.STRING
        }
    }, {
        timestamps: false
    }
    )
    return Customer;
}