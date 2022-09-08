const express = require('express')

const app = express();

//Middlewares
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

// Routes
require('./routes/customer.routes')(app)
require('./routes/reservation.routes')(app)

app.listen(4000, () => {
    console.log('Server listening on port 4000')
})