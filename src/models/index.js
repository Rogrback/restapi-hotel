const dbconfig = require("../db.config");
const Sequelize = require("sequelize");

const sequelize = new Sequelize(dbconfig.database, dbconfig.user, dbconfig.password, {
    host: dbconfig.host,
    dialect: dbconfig.dialect,
    operatorAliases: false
    
});

const db = {};
db.Sequelize = Sequelize;  // dependency
db.sequelize = sequelize; // connection db
// tables
db.customer = require("./customer")(sequelize, Sequelize); // table customer
db.reservation = require("./reservation")(sequelize, Sequelize); // table reservation
db.reseevation_state = require("./reservation_state")(sequelize, Sequelize); // table reservation_state
db.room = require("./room")(sequelize, Sequelize); // table room
db.type_document = require("./type_document")(sequelize, Sequelize); // table type_document
db.type_payment = require("./type_payment")(sequelize, Sequelize); // table type_payment
db.type_room = require("./type_room")(sequelize, Sequelize); // table type_room

module.exports = db;