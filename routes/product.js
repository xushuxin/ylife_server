const express=require("express");/* 引入express模块 */
const pool=require("../pool.js");/* 引入自定义的pool文件 */
var router=express.Router();/* 创建路由 */

//商品分页查询
router.get("/getProductlist",(req,res)=>{
  var kwords=decodeURIComponent(
    req.query.kwords
  );
  var output={
    pno:0,
    pageSize:16,
    count:0,
    pageCount:0, //=ceil(count/pageSize)
    products:[]  //所有商品中starti,endi结束
  }
  if(req.query.pno!==undefined)
    output.pno=parseInt(req.query.pno)
  //"macbook i5 128g"
  kwords=kwords.split(" ");
  //[macbook,i5,128g]
  kwords.forEach((val,i,arr)=>{
    arr[i]=`%${val}%`
  })
  //[%macbook%,%i5%,%128g%]
  var arr=[];
  for(var kw of kwords){
    arr.push(` title like ? `);
  }
  /*[
    title like ?,
    title like ?,
    title like ?
  ]*/
  var where=" where stock>0 and"+arr.join(" and ");
  var group=" group by family_id ";
  var sql="select *,(select md from ylife_product_pic where product_id=p.id limit 1) as md from ylife_products p"+where+group;
  pool.query(sql,kwords,(err,result)=>{
    if(err) console.log(err);
    var count=result.length;
    var pageCount=Math.ceil(count/output.pageSize);
    output.count=count;
    output.pageCount=pageCount;
    var starti=output.pno*output.pageSize;
    output.products=result.slice(
      starti,starti+output.pageSize
    );
    res.send(output)
  })
})
module.exports=router;

