const {DataTypes} = require('sequelize');

module.exports = (sequelize, Sequelize) => {
    const Type_room = sequelize.define("type_room", {
        idtypedocument: {
            primaryKey: true,
            type: Sequelize.INTEGER,
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4
        },
        name: {
            type: Sequelize.STRING
        },
        price: {
            type: Sequelize.NUMERIC
        }
    }, {
        timestamps: false
    }
    )
    return Type_room;
}