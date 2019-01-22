//引入第三方模块
const express=require("express");
const bodyParser=require("body-parser");
const session=require("express-session");
const cors=require("cors")
//引入路由模块
const userRouter=require("./routes/user");
const indexRouter=require("./routes/index");
const productRouter=require("./routes/product")
const detailsRouter=require("./routes/details")
const shopcartRouter=require("./routes/shopcart")
/*创建服务器*/
var app=express();
app.listen(80,function(){
	console.log("server listening on 80");
});
//解析post请求的url
app.use(bodyParser.urlencoded({
	extended:false
}));
//托管静态文件
app.use(express.static(__dirname+"/public"));

//使用cors中间件设置允许跨域访问的url,必须在托管静态之后
app.use(cors({
  origin:["http://localhost:8080","http://127.0.0.1:8080","http://localhost:5500","http://127.0.0.1:5500"],
  credentials:true
}))
//使用express-session中间件
app.use(session({
	secret:"128位随机字符",
	resave:false,
	saveUninitialized:true,
	cookie:{maxAge:1000*60*24}//使用cookie多存一段时间
}))

//app.use(function(req, res, next) {
//	//设置跨域访问
//	res.header('Access-Control-Allow-Origin', "http://127.0.0.1:5500");
//	res.header('Access-Control-Allow-Headers', 'Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild');
//	res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE, OPTIONS');
//	res.header('Access-Control-Allow-Credentials', true);
//	
//	if (req.method == 'OPTIONS') {
//	res.send(200); /*让options请求快速返回*/
//	} else {
//	next();
//	}
//})

//把用户路由器挂载到路由/user
app.use("/user",userRouter);
//把首页路由挂在到/index
app.use("/index",indexRouter);
// 把商品路由挂载到/product
app.use("/product",productRouter);
//商品详情路由挂载到/details
app.use("/details",detailsRouter);
//购物车路由挂载到/shopcart
app.use("/shopcart",shopcartRouter);
