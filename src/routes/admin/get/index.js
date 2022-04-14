const express = require('express')
const getRouter = express.Router()

const adminController = require('../../../controllers/admin/adminController')

getRouter.get('/',adminController.findAll)

module.exports = getRouter
