module.exports = app => {
    const reservation = require('../controllers/reservation.controller');
    var router = require("express").Router();
    router.get('/list-reservations', reservation.findOne);
    router.get('/create-reservation', reservation.create);  
    app.use('/api', router)
}