const {DataTypes} = require('sequelize');

module.exports = (sequelize, Sequelize) => {
    const Type_document = sequelize.define("type_document", {
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
    return Type_document;
}