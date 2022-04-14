const express = require('express')
var path = require('path');

exports.get = (req,res)=>{
    res.sendFile(__dirname+"/buyma/")   
}

//express.static(path.join(__dirname, 'buyma'))