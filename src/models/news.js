const sql_db = require('./db')


const News = function(news){
    this.a_id = news.a_id;
    this.title = news.title;
    this.coinName = news.coinName;
    this.marketcap = news.marketcap;
    this.importance = news.importance;
    this.proof_add = news.proof_add;
    this.pic_proof = news.pic_proof;
    this.coin_pic = news.coin_pic;
    this.tex1 = news.tex1;
    this.text2 = news.text2;
 // this.date = news.date;
    this.date_event = news.date_event;
    this.id_pic_proof = news.id_pic_proof;
    this.id_coin_pic - news.id_coin_pic;
}

News.create = (newNews,result)=>{
    sql_db.query("INSERT INTO coinnews SET ?", newNews,(err,res)=>{
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
          }
          console.log("created news: ", { id: res.insertId, ...newNews });
          result(null, { id: res.insertId, ...newNews });
    })
}

News.getAll = result =>{
    sql_db.query("SELECT * FROM coinnews",(err,res)=>{
        if(err){
            console.log("error: ", err);
            result(null, err);
            return;
        }
        console.log("news: ", res);
    result(null, res);
    })
}


News.UpdateById = (id,news,result)=>{
    sql_db.query(
        "UPDATE coinnews SET a_id = ?, title = ?, coinName = ?, marketcap = ?, importance = ?, proof_add = ?, pic_proof = ?, coin_pic = ?, tex1 = ?, text2 = ?, date_event = ?, id_pic_proof = ?, id_coin_pic = ? WHERE id=?",
        [news.a_id, news.title, news.coinName, news.marketcap,news.importance,news.proof_add,news.pic_proof,news.coin_pic,news.tex1,news.text2,news.date_event,news.id_pic_proof,news.id_coin_pic,id],
        (err, res) => {
            if (err) {
              console.log("error: ", err);
              result(null, err);
              return;
            }
            if (res.affectedRows == 0) {
                // not found Customer with the id
                result({ kind: "not_found" }, null);
                return;
            }
            console.log("updated news: ", { id: id, ...news });
            result(null, { id: id, ...news })
        }
    )
}

News.Search = (input,result)=>{
    sql_db.query(
        "SELECT * FROM coinnews WHERE MATCH(title,coinName) AGAINST ( ? IN NATURAL LANGUAGE MODE)",input.body.search,
        (err,res)=>{
            if(err){
                console.log("error: ", err);
                result(null,err)
                return
            }
            console.log("news: ", res);
        result(null, res);    
        }
    )
}
News.remove = (id,result)=>{
    sql_db.query(
        "DELETE FROM coinnews WHERE id = ?",id,(err,res)=>{
            if (err) {
                console.log("error: ", err);
                result(null, err);
                return;
              }
              if (res.affectedRows == 0) {
                // not found News with the id
                result({ kind: "not_found" }, null);
                return;
              }
              console.log("deleted customer with id: ", id);
            result(null, res);
          
        }
    )
}

module.exports = News