const express = require('express')
const SaveRouter = express.Router()

const adminController = require('../../../controllers/admin/adminController')

SaveRouter.post('/',adminController.SavePost)

module.exports = SaveRouter
