const express = require('express')
const AdminRouter = express.Router()
const loginController = require('../../controllers/loginController/loginController')

//config save route
const Save = require('./save')
AdminRouter.use('/save',Save)
//
//config delete route
const Delete = require('./delete')
AdminRouter.use('/delete',loginController.verify,loginController.IsAdmin,Delete) 
//
//config update route
const Update = require('./update')
AdminRouter.use('/update',loginController.verify,loginController.IsAdmin,Update)

//config get route
const GetAll = require('./get')
AdminRouter.use('/getAll',loginController.verify,loginController.IsAdmin,GetAll)

//config search route
const Search = require('./search')
AdminRouter.use('/search',Search)

module.exports = AdminRouter


//loginController.verify,loginController.IsAdmin