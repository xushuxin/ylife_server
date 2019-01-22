const express=require("express");/* 引入express模块 */
const pool=require("../pool.js");/* 引入自定义的pool文件 */
var router=express.Router();/* 创建路由 */
//轮播图
router.get("/carousel",(req,res)=>{
  var sql="SELECT * FROM ylife_carousel";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  });
});
//今日推荐
router.get("/todayrec",(req,res)=>{
  var sql="SELECT * FROM ylife_todayrec";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  });
});
//热门推荐
router.get("/hotrec",(req,res)=>{
  var sql="SELECT * FROM ylife_hotrec";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  });
});

module.exports=router;