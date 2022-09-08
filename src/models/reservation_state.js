const {DataTypes} = require('sequelize');

module.exports = (sequelize, Sequelize) => {
    const Reservation_state = sequelize.define("reservation_state", {
        idreservationstate: {
            primaryKey: true,
            type: Sequelize.INTEGER,
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4
        },
        rstate: {
            type: Sequelize.STRING
        }
    }, {
        timestamps: false
    }
    )
    return Reservation_state;
}