const {DataTypes} = require('sequelize');

module.exports = (sequelize, Sequelize) => {
    const Type_payment = sequelize.define("type_payment", {
        idtypedocument: {
            primaryKey: true,
            type: Sequelize.INTEGER,
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4
        },
        name: {
            type: Sequelize.STRING
        }
    }, {
        timestamps: false
    }
    )
    return Type_payment;
}