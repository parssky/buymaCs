const express = require('express')
const AppRouter = express.Router()

const get = require('./get')
AppRouter.use('/get',get)

module.exports = AppRouter
