const express = require('express')
const DeleteRouter = express.Router()

const adminController = require('../../../controllers/admin/adminController')

DeleteRouter.post('/:newsId',adminController.DeletePost)

module.exports = DeleteRouter
