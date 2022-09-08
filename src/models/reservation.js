const {DataTypes} = require('sequelize');

module.exports = (sequelize, Sequelize) => {
    const Reservation = sequelize.define("reservation", {
        idreservation: {
            primaryKey: true,
            type: Sequelize.INTEGER,
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4
        },
        customer: {
            type: Sequelize.INTEGER
        },
        room: {
            type: Sequelize.INTEGER
        },
        initial_date: {
            type: Sequelize.DATE
        },
        final_date: {
            type: Sequelize.DATE
        },
        rstate: {
            type: Sequelize.INTEGER
        },
        type_payment: {
            type: Sequelize.INTEGER
        },
        observations: {
            type: Sequelize.STRING
        }
    }, {
        timestamps: false
    }
    )
    return Reservation;
}