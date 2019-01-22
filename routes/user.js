const express=require("express");
const pool=require("../pool");
var router=express.Router();
//一、用户注册
//1.用户名（手机号）异步验证接口
router.get("/checkUname",(req,res)=>{
	var $uname=req.query.uname;
	if(!$uname){
		res.send("手机号不能为空");
		return;
	}
	var sql="select * from ylife_user where uname=?";
	pool.query(sql,[$uname],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({code:0});
		}else{
			res.send({code:1});
		}
	});
});
//
//2.用户邮箱异步验证接口
router.get("/checkEmail",(req,res)=>{
	var $email=req.query.email;
	if(!$email){
		res.send("邮箱不能为空");
		return;
	}
	var sql="select * from ylife_user where email=?";
	pool.query(sql,[$email],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({code:0});
		}else{
			res.send({code:1});
		}
	});
});
//3.点击注册按钮时异步验证每个信息
router.post("/register",(req,res)=>{
	var $uname=req.body.uname;
	var $phone=req.body.uname;
	var $upwd=req.body.upwd;
	var $email=req.body.email;
	if(!$uname){
		res.send("手机号为空");
		return;
	}
	if(!$upwd){
		res.send("密码为空");
		return;
	}
	if(!$email){
		res.send("邮箱为空");
		return;
	}
	var sql="insert into ylife_user values(null,?,?,?,?,null,null,null,null,null,null,null,null,null,null,null,null,null)";
	pool.query(sql,[$uname,$upwd,$email,$phone],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send({code:1});
		}
	});
});

//二、用户登录
//点击登录按钮,验证用户名和密码
router.post("/login",(req,res)=>{
	var $uname=req.body.uname;
	var $upwd=req.body.upwd;
	var sql="select * from ylife_user where uname=? and upwd=?";
	pool.query(sql,[$uname,$upwd],(err,result)=>{
		if(err) throw err;
		// console.log(result);//数组里面一个对象
		// var user_name=result[0].user_name;
		if(result.length==1){
			req.session.uid=result[0].uid;
			res.send({code:"200",msg:"登录成功",uid:result[0].uid,user_name:result[0].user_name});
		}else{
			res.send({code:"401",msg:"用户名和密码不一致"});
		}
	});
});

//注销登录
router.get("/logout",(req,res)=>{
	req.session.uid=undefined;//清除session
	res.send({code:1,msg:"注销成功"});
})
//验证是否登录
router.get("/islogin",(req,res)=>{
	if(req.session.uid===undefined){
		res.send({code:0})
	}else{
		res.send({code:1});
	}
})
//导出路由器
module.exports=router;