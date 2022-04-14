const News = require('../../models/news');



exports.SavePost=(req,res)=>{
    if (!req.body) {
        res.status(400).send({
          message: "Content can not be empty!"
        });
      }

    const news = new News({
        a_id:req.body.a_id,
        title:req.body.title,
        coinName:req.body.coinName,
        marketcap:req.body.marketcap,
        importance:req.body.importance,
        proof_add:req.body.proof_add,
        pic_proof:req.body.pic_proof,
        coin_pic:req.body.coin_pic,
        tex1:req.body.tex1,
        text2:req.body.text2,
        date_event:req.body.date_event,
        id_pic_proof:req.body.id_pic_proof,
        id_coin_pic:req.body.id_coin_pic

    })

    News.create(news,(err,data)=>{
        
            if(err){
                  res.setHeader('Content-Type', 'application/json')
                return res.status(500).json({message : err.message || "Some error occurred while creating the Post."})
            }
            else{
                res.setHeader('Content-Type', 'application/json')
                return res.json(data)
            } 
            //res.setHeader('Content-Type', 'application/json')
            //res.json({message : "pls enter username and password "})
        
    })
}

exports.findAll=(req,res)=>{
    News.getAll((err,data)=>{
    
            if(err){
                res.setHeader('Content-Type', 'application/json')
                return res.status(500).json({
                    message:
                      err.message || "Some error occurred while retrieving News."
                  });
            }else{
                res.setHeader('Content-Type', 'application/json')
                res.json(data)
            }

            //res.setHeader('Content-Type', 'application/json')
            //res.json({message : "pls enter username and password"})
        
    })
}

exports.DeletePost=(req,res)=>{
    News.remove(req.params.newsId,(err,data)=>{
        if (err) {
            if (err.kind === "not_found") {
              return res.status(404).json({
                message: `Not found News with id ${req.params.customerId}.`
              });
            }else{
                return res.status(500).json({
                    message: "Could not delete News with id " + req.params.customerId
                  });
            }
    }else  return res.json({ message: `News was deleted successfully!` });
})
}
exports.Update=(req,res)=>{
        if (!req.body) {
            res.setHeader('Content-Type', 'application/json')
            return res.status(400).json({
              message: "Content can not be empty!"
            });
          }
        News.UpdateById(
            req.params.newsId,
            new News(req.body),
            (err,data)=>{
                if(err){
                    if(err.kind === "not found"){
                        //res.setHeader('Content-Type', 'application/json')
                        return res.status(404).json({
                            message: `Not found News with id ${req.params.newsId}.`
                        })
                    }else{
                        //res.setHeader('Content-Type', 'application/json')
                        return res.status(500).json({
                            message: "Error updating News with id " + req.params.newsId
                          });
                    }
                }else{
                    //res.setHeader('Content-Type', 'application/json')
                    return res.json(data);
                }
            }
        )
        
        //res.setHeader('Content-Type', 'application/json')
        //res.json({message : "pls enter username adn password "})
    
}

exports.Search = (req,res)=>{
    News.Search(req,(err,data)=>{
        if(err){
            res.status(500).json({message:
                err.message || "Some error occurred while retrieving News."})
                return
        }else{
            res.setHeader('Content-Type', 'application/json')
            return res.status(200).json(data)

        }
    })
}