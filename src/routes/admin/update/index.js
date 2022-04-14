const express = require('express')
const UpdateRouter = express.Router()

const adminController = require('../../../controllers/admin/adminController')

UpdateRouter.put('/:newsId',adminController.Update)

module.exports = UpdateRouter
