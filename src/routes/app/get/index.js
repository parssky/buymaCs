const express = require('express')
const getRouter = express.Router()

const AdminController = require('../../../controllers/admin/adminController')
 getRouter.get('/',AdminController.findAll)

 module.exports = getRouter