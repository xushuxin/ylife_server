const express=require("express");/* 引入express模块 */
const pool=require("../pool.js");/* 引入自定义的pool文件 */
var router=express.Router();/* 创建路由 */
//查询用户购物车是否已存在该商品
router.get("/isAdd",(req,res)=>{
  var uid=req.query.uid;
  var pid=req.query.pid;
  var sql=" select * from ylife_shoppingcart_item where user_id=? and pid=?";
  pool.query(sql,[uid,pid],(err,result)=>{
    if (err) throw err;
    if(result.length>0){
      res.send({code:1,id:result[0].id,count:result[0].count,msg:"购物车中已存在"})
    }else{
      res.send({code:0,msg:"购物车中不存在"})
    }
  })
})
//添加购物车路由
router.post("/addCart",(req,res)=>{
  //1:获取3个参数
  //需要第三方模块支持 bodyParser
  var uid = req.body.uid;
  var pid = req.body.pid;
  var count= parseInt(req.body.count);
  //2:创建sql语句
  var sql  =" INSERT INTO ylife_shoppingcart_item(id,user_id,pid,count,is_checked) VALUES (null,?,?,?,0)";
  pool.query(sql,[uid,pid,count],(err,result)=>{
    if(err)throw err;
    //3:返回添加结果
    if(result.affectedRows>0)
     res.send({code:1,msg:"购物车添加成功"});
  });
})

//获得购物车商品列表
router.get("/getCartItem",(req,res)=>{
  var uid=req.query.uid;
  var sql="SELECT id,pid,user_id,count,(SELECT sm FROM ylife_product_pic WHERE product_id=pid LIMIT 1) AS sm,(SELECT title FROM ylife_products WHERE id=pid) AS title,(SELECT price FROM ylife_products WHERE id=pid) AS price FROM ylife_shoppingcart_item WHERE user_id=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,list:result})
  })
})
//更新购物车信息
router.post("/update",(req,res)=>{
  var id=req.body.id;
  var count=req.body.count;
  var sql="UPDATE ylife_shoppingcart_item SET count=? WHERE id=?";
  pool.query(sql,[count,id],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"购物车更新成功！"})
    }
  })
})
// 删除购物车项目
router.post("/delete",(req,res)=>{
  var id=req.body.id;
  var sql="DELETE FROM ylife_shoppingcart_item WHERE id=?";
  pool.query(sql,[id],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"购物车更新成功！"})
    }
  })
})
module.exports=router;