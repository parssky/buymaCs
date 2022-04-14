const express = require('express')
const SearchRouter = express.Router()

const adminController = require('../../../controllers/admin/adminController')

SearchRouter.post('/',adminController.Search)
//SearchRouter.post('/:newsKey',adminController.Search)

module.exports = SearchRouter