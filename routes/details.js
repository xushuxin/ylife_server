const express=require("express");
const router=express.Router();
const pool=require("../pool");

//测试: http://localhost:80/details?id=1
router.get("/",(req,res)=>{
  var id=req.query.id;
  var output={
    product:{/*详细信息*/},
    specs:[],
	difference:[],
    pics:[/*{图片},{图片},{图片}*/]
  };
  //查询商品对象
  var sql="select * from ylife_products where id=?";
  pool.query(sql,[id],(err,result)=>{//异步！
    if(err) console.log(err);
    output.product=result[0];
	var arr=result[0].spec_title.split(",");
	for(var item of arr){
		output.specs.push({title:item,vals:[]})
	}
    var family_id=result[0].family_id;
    //查询规格列表
    var sql="select id,stock,specs from ylife_products where family_id=?";
    pool.query(sql,[family_id],(err,result)=>{
      if(err) console.log(err);
	  for(var i=0;i<arr.length;i++){
		for(var j=0;j<result.length;j++){
		  if(output.specs[i].vals.indexOf(result[j].specs.split(",")[i])==-1){//去除重复的参数
			output.specs[i].vals.push(result[j].specs.split(",")[i]);
		  }
		}
	  }
	  output.difference=result;
      //查询图片列表
      var sql="select * from ylife_product_pic where product_id=?";
      pool.query(sql,[id],(err,result)=>{
        if(err) console.log(err);
        output.pics=result;
        res.send(output);
      })
    })
  });
})

module.exports=router;