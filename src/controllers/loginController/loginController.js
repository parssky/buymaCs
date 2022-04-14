const { config } = require('dotenv');
const sql_db = require('../../models/db')
const User = require('../../models/user')
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken')



exports.loginHome = (req,res)=>{
    res.status(200).json({message:"Here is home page "})
    
}


exports.register=async(req,res) =>{
    if (!req.body) {
        res.status(400).json({
          message: "Content can not be empty!"
        });
      }

    //hash pass
    
    const hashPassword =await bcrypt.hash(req.body.password,bcrypt.genSaltSync(10));

    //create user object
    const user = new User({
        email:req.body.email,
        name:req.body.name,
        password:hashPassword,
        user_type_id:req.body.user_type_id
    })

    //save user in database

    User.save(user,(err,data)=>{
        if(err){
            res.status(500).json({message : err.message || "Some error occurred while creating the user."})
        }else{
            console.log(data)
            let payload = {id: data.id, user_type_id:req.body.user_type_id || 0}
            const token = jwt.sign(payload, process.env.SECRET)
            res.status(200).json(token)
        }
    })


}

exports.loginUser = async (req,res)=>{

    var email = req.body.email
    var password = req.body.password
    console.log(email,password)

    if(email && password){
        sql_db.query('SELECT id,user_type_id,password FROM users WHERE email = ?',[email],async(err,result,field)=>{
            if(!err){
                if(result.length>0){
                    console.log(result)
                    const validPass = await bcrypt.compareSync(password,result[0].password)
                    if (!validPass) return res.status(401).json("Email or Password is wrong");
                    let payload = { id: result[0].password, user_type_id: result[0].user_type_id };
                    const token = jwt.sign(payload, process.env.SECRET);
                    res.status(200).json({ "token": token });
            
                }else{
                    res.status(401).json({message:"Email or Password is wrong"})
                }

            }else{
                res.status(401).json({message : err})
            }
            
            

        })
    }
}

exports.verify = (req,res,next) => {
    let token = req.headers.authorization;
    if (!token) return res.status(401).json("Access Denied / Unauthorized request");
    console.log(token)

    try {
        //token = token.split(' ')[1] // Remove Bearer from string

        if (token === 'null' || !token) return res.status(401).json('Unauthorized request1');

        let verifiedUser = jwt.verify(token, process.env.SECRET);   // config.TOKEN_SECRET => 'secretKey'
        if (!verifiedUser) return res.status(401).json('Unauthorized request2')
        


        req.user = verifiedUser; // user_id & user_type_id
        next();

    } catch (error) {
        res.status(400).json("Invalid Token");
    }

}

exports.IsUser = async (req, res, next) => {
    if (req.user.user_type_id === 0) {
        next();
    }
    return res.status(401).json("Unauthorized!");   
}


exports.IsAdmin = async (req, res, next) => {
    if (req.user.user_type_id === 1) {
        next();
        return
    }
    return res.status(401).send("Unauthorized!");

}