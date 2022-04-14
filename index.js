//import modules
const express = require('express')
const http = require('http')
const mysql = require('mysql')
const dotenv = require('dotenv')
const { urlencoded } = require('express')
const cors = require('cors')
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

//config express server 
const app = express()
const server = http.createServer(app)

//config .env file
dotenv.config()

//config body of request
app.use(logger('dev'));
app.use(express.json())
app.use(express.urlencoded({extended:false}))
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
//config application/json
app.use(function(req, res, next) {
    res.header("Content-Type", 'application/json');
    res.header("Access-Control-Allow-Origin", "*");
    next();
});


//config cors
app.use(cors())


// config routes

const Routes = require('./src/routes/')
app.use(Routes)

//flutter front 

app.use(logger('dev'));
app.use(express.json());

//



//start server
server.listen(8000,()=>{
    console.log("server is running on port "+ 8000);
})