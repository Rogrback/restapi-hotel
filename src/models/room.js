const {DataTypes} = require('sequelize');

module.exports = (sequelize, Sequelize) => {
    const Room = sequelize.define("room", {
        idroom: {
            primaryKey: true,
            type: Sequelize.INTEGER,
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4
        },
        room_name: {
            type: Sequelize.STRING
        },
        price: {
            type: Sequelize.NUMERIC
        }
    }, {
        timestamps: false
    }
    )
    return Room;
}