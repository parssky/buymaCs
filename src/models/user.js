const sql_db = require('./db')

const Users = function(users){
    this.email = users.email
    this.name = users.name
    this.password = users.password;
    this.user_type_id = users.user_type_id
}


Users.save = (newUser,result)=> {
    sql_db.query("INSERT INTO users SET ?",newUser,(err,res)=>{

        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
          }
          console.log("created user: ", { id: res.insertId, ...newUser });
          result(null, { id: res.insertId, ...newUser });
    })

}
Users.getAll = result =>{
    sql_db.query("SELECT * FROM users",(err,res)=>{
        if(err){
            console.log("error: ", err);
            result(null, err);
            return;
        }
        console.log("users: ", res);
    result(null, res);
    })
}

module.exports = Users