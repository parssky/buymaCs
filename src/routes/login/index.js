const express = require('express')
const LoginRouter = express.Router()
const loginController = require('../../controllers/loginController/loginController')


LoginRouter.post('/register',loginController.register)
LoginRouter.post('/loginuser',loginController.loginUser)
LoginRouter.get('/home',loginController.verify,loginController.IsAdmin,loginController.loginHome)

module.exports = LoginRouter
