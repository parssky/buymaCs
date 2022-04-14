const express = require('express')
const Router = express.Router()
var path = require('path');

//config admin router
const AdminRouter = require('./admin')
Router.use('/admin',AdminRouter)

//config app router
const AppRouter = require('./app')
Router.use('/app',AppRouter)

//config login router 
const LoginRouter = require('./login')
Router.use('/login',LoginRouter)



//const homeController = require('../controllers/home/homeController')
//Router.use('/',homeController.get)

module.exports = Router
