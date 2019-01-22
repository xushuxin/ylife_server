SET NAMES UTF8;
DROP DATABASE IF EXISTS ylife;
CREATE DATABASE ylife CHARSET=UTF8;
USE ylife;
#网站的基本信息
CREATE TABLE ylife_site_info(
	site_name VARCHAR(16),
	logo VARCHAR(64),
	copyright VARCHAR(64)
);
INSERT INTO ylife_site_info VALUES("优生活","public/image/logo.png","Copyright © 2005-2025  江苏优生活传媒科技股份有限公司 版权所有");
#用户信息表
CREATE TABLE ylife_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,		#用户编号
	uname VARCHAR(16),										#用户昵称
	upwd VARCHAR(20),											#密码
	email VARCHAR(20),										#邮箱
	phone CHAR(11),												#手机号
	gender INT,														#性别0-女 1-男
	user_name VARCHAR(12),								#真实姓名
	member_level VARCHAR(10),							#会员等级
	idcard CHAR(18),											#身份证号
	province VARCHAR(16),									#省
  city VARCHAR(16),											#市
  county VARCHAR(16),										#县
  address VARCHAR(128),									#详细地址
	birthday CHAR(10),										#生日
	salary VARCHAR(16),										#月收入
	marriage_status	INT,									#婚姻状况
	hobby VARCHAR(128),										#兴趣爱好
	avatar VARCHAR(128)										#头像图片路径
);
INSERT INTO ylife_user VALUES(null,"15665590708","123456","2214342379@qq.com","15665590708",1,"徐树新","VIP12","342425199901085524","安徽省","六安市","舒城县","万佛湖镇","1995-01-08","0","0","打游戏、看小说",null);
#收货地址信息
CREATE TABLE ylife_receiver_address(
	id INT PRIMARY KEY AUTO_INCREMENT,	#地址编号
	uid INT,														#用户编号
	receiver VARCHAR(16),	   						#收货人姓名
	province VARCHAR(16),								#省
	city VARCHAR(16),										#市
	county VARCHAR(16),									#县
	addr VARCHAR(128),								#详细地址
	cellphone VARCHAR(16),							#手机号
	fixedphone VARCHAR(16),							#固定电话
	postcode CHAR(6),										#邮政编码
	is_default INT,									#是否为当前用户的默认地址
	FOREIGN KEY(uid) REFERENCES ylife_user(uid)			#外键约束
);
INSERT INTO ylife_receiver_address VALUES(1,1,"徐树新","安徽省","六安市","舒城县","万佛湖镇","15665590708",null,"231360",1);

#轮播图
CREATE TABLE ylife_carousel(
	id INT PRIMARY KEY AUTO_INCREMENT,
	src VARCHAR(50),
	href VARCHAR(50)
);
INSERT INTO ylife_carousel VALUES(null,"http://127.0.0.1:80/images/carousel1.jpg","details.html?id=1");
INSERT INTO ylife_carousel VALUES(null,"http://127.0.0.1:80/images/carousel2.jpg","details.html?id=1");
INSERT INTO ylife_carousel VALUES(null,"http://127.0.0.1:80/images/carousel3.jpg","details.html?id=1");
INSERT INTO ylife_carousel VALUES(null,"http://127.0.0.1:80/images/carousel4.jpg","details.html?id=1");
INSERT INTO ylife_carousel VALUES(null,"http://127.0.0.1:80/images/carousel5.jpg","details.html?id=1");

#今日推荐
CREATE TABLE ylife_todayrec(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img_url VARCHAR(50),
	href VARCHAR(50)
);
INSERT INTO ylife_todayrec VALUES(null,"http://127.0.0.1:80/images/tody_rec1.jpg","details.html?id=1");
INSERT INTO ylife_todayrec VALUES(null,"http://127.0.0.1:80/images/tody_rec2.jpg","details?.html?id=2");
INSERT INTO ylife_todayrec VALUES(null,"http://127.0.0.1:80/images/tody_rec3.jpg","details.html?id=3");
INSERT INTO ylife_todayrec VALUES(null,"http://127.0.0.1:80/images/tody_rec4.jpg","details.html?id=4");
INSERT INTO ylife_todayrec VALUES(null,"http://127.0.0.1:80/images/tody_rec5.jpg","details.html?id=5");
INSERT INTO ylife_todayrec VALUES(null,"http://127.0.0.1:80/images/tody_rec6.jpg","details.html?id=6");
INSERT INTO ylife_todayrec VALUES(null,"http://127.0.0.1:80/images/tody_rec7.jpg","details.html?id=7");
INSERT INTO ylife_todayrec VALUES(null,"http://127.0.0.1:80/images/tody_rec8.jpg","details.html?id=8");


#热门推荐
CREATE TABLE ylife_hotrec(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(50),
	price DECIMAL(8,2),
	img_url VARCHAR(50),
	href VARCHAR(50)
);
INSERT INTO ylife_hotrec VALUES(null,"乐扣乐扣收纳箱",79.00,"http://127.0.0.1:80/images/hot1.jpg","details.html?id=9");
INSERT INTO ylife_hotrec VALUES(null,"优生活 专属奶牛萌萌杯 送勺",20.00,"http://127.0.0.1:80/images/hot2.jpg","details.html?id=2");
INSERT INTO ylife_hotrec VALUES(null,"HAPPYCALL 多用途双面气压锅",870.00,"http://127.0.0.1:80/images/hot3.jpg","details.html?id=10");
INSERT INTO ylife_hotrec VALUES(null,"龙的微电脑电饭煲 LD-FS420",698.00,"http://127.0.0.1:80/images/hot4.jpg","details.html?id=11");
INSERT INTO ylife_hotrec VALUES(null,"光明5800吹风机",110.00,"http://127.0.0.1:80/images/hot5.jpg","details.html?id=12");
INSERT INTO ylife_hotrec VALUES(null,"新榜样韩式炒锅 A9-23",135.00,"http://127.0.0.1:80/images/hot6.jpg","details.html?id=13");
INSERT INTO ylife_hotrec VALUES(null,"乐扣乐扣迷你马克单杯200ml(红色)",89.00,"http://127.0.0.1:80/images/hot7.jpg","details.html?id=14");
INSERT INTO ylife_hotrec VALUES(null,"龙的巧趣系列电烤箱红外加热大容量 LD-KX12A",228.00,"http://127.0.0.1:80/images/hot8.jpg","details.html?id=15");
INSERT INTO ylife_hotrec VALUES(null,"OLYMPIA 拉杆箱 HE5000 29寸",1698.00,"http://127.0.0.1:80/images/hot9.jpg","details.html?id=3");
INSERT INTO ylife_hotrec VALUES(null,"公牛 新国标系列插座GN-S1220(以实物为准)",58.00,"http://127.0.0.1:80/images/hot10.jpg","details.html?id=17");
INSERT INTO ylife_hotrec VALUES(null,"百安思不锈钢双层保温杯BMH-12-4835(金色)",175.00,"http://127.0.0.1:80/images/hot11.jpg","details.html?id=18");
INSERT INTO ylife_hotrec VALUES(null,"龙的派乐系列电子饭盒LD-FH15C",138.00,"http://127.0.0.1:80/images/hot12.jpg","details.html?id=19");

#商品信息表
CREATE TABLE ylife_products(
  id INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(50),		#分类
	secondCname VARCHAR(50),	#二级分类
	thirdCname	VARCHAR(50),		#三级分类
	bname VARCHAR(50),					#品牌名
	family_id INT(11),					#同一详情页面的商品id
	specs VARCHAR(20),		
	PromoteMessage VARCHAR(128),	#促销信息
	title   VARCHAR(255),
	price    DECIMAL(10,2),
	stock		INT(11),			#库存,有无货
	spec_title	VARCHAR(20),	#商品规格标题1
	numder BIGINT(11),	#商品编号,
	store		VARCHAR(30),	#店铺名
	shelfTime	DATETIME,		#上架时间
	priceRange VARCHAR(10),		#价格范围
	material	VARCHAR(20),		#材质
	buyPoint	VARCHAR(20)			#选购热点
);
INSERT INTO  ylife_products VALUES(1,"餐具茶具","茶具饮具","茶具套装","大润窑",1,"10个,汝窑","无","大润窑10头汝窑茶具",85.00,100,"个数,茶餐材质",201510201609141,"优生活商城","2018-06-27 21:13:39","0-299","汝窑","热卖款");
INSERT INTO  ylife_products VALUES(2,"餐具茶具","茶具饮具","陶瓷杯","大润窑",2,"2件","无","大润窑奶牛萌萌杯送勺",20.00,100,"个数", 201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(3,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"红色,中国风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,0,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(4,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"黑色,中国风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,1,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(5,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"灰色,中国风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,10,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(6,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"绿色,中国风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,0,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(7,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"蓝色,中国风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,1,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(8,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"红色,欧美风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,99,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(9,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"黑色,欧美风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,1,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(10,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"灰色,欧美风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,10,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(11,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"绿色,欧美风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,1,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(12,"居家生活  ","箱包","拉杆箱","OLYMPIA",3,"蓝色,欧美风,塑料","无","OLYMPIA 拉杆箱 HE5000 29寸",1698.00,1,"颜色,风格,材料",201604020939191,"优生活商城","2017-02-02 21:16:09",null,null,null);
INSERT INTO  ylife_products VALUES(13,"餐具茶具","茶具饮具","茶具套装","大润窑",4,"10个,汝窑","无","大润窑10头汝窑茶具",85,1,"个数,茶餐材质",201510201609141,"优生活商城","2018-06-27 21:13:39","0-299","汝窑","热卖款");
INSERT INTO  ylife_products VALUES(14,"餐具茶具","茶具饮具","茶具套装","大润窑",5,"10个,汝窑","无","大润窑10头汝窑茶具",85,1,"个数,茶餐材质",201510201609141,"优生活商城","2018-06-27 21:13:39","0-299","汝窑","热卖款");
INSERT INTO  ylife_products VALUES(15,"餐具茶具","茶具饮具","茶具套装","大润窑",6,"10个,汝窑","无","大润窑10头汝窑茶具",85,1,"个数,茶餐材质",201510201609141,"优生活商城","2018-06-27 21:13:39","0-299","汝窑","热卖款");
INSERT INTO  ylife_products VALUES(16,"餐具茶具","茶具饮具","陶瓷杯","大润窑",7,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(17,"餐具茶具","茶具饮具","陶瓷杯","大润窑",8,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(18,"餐具茶具","茶具饮具","陶瓷杯","大润窑",9,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(19,"餐具茶具","茶具饮具","陶瓷杯","大润窑",10,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(20,"餐具茶具","茶具饮具","陶瓷杯","大润窑",11,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(21,"餐具茶具","茶具饮具","陶瓷杯","大润窑",12,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(22,"餐具茶具","茶具饮具","陶瓷杯","大润窑",13,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(23,"餐具茶具","茶具饮具","陶瓷杯","大润窑",14,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(24,"餐具茶具","茶具饮具","陶瓷杯","大润窑",15,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(25,"餐具茶具","茶具饮具","陶瓷杯","大润窑",16,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(26,"餐具茶具","茶具饮具","陶瓷杯","大润窑",17,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");
INSERT INTO  ylife_products VALUES(27,"餐具茶具","茶具饮具","陶瓷杯","大润窑",18,"2件","无","大润窑奶牛萌萌杯送勺",20.00,1,"个数",201703071306121,"优生活商城","2018-12-07 19:46:57","0-69",null,"耐高温");




#商品图片(sm/md/lg)
CREATE TABLE ylife_product_pic (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  product_id INT(11),
  sm VARCHAR(128) ,
  md VARCHAR(128) ,
  lg VARCHAR(128)
);

INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(1,1,'http://127.0.0.1:80/images/product/product01sm1.jpg','http://127.0.0.1:80/images/product/product01md1.jpg','http://127.0.0.1:80/images/product/product01lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(2,1,'http://127.0.0.1:80/images/product/product01sm2.jpg','http://127.0.0.1:80/images/product/product01md2.jpg','http://127.0.0.1:80/images/product/product01lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(3,1,'http://127.0.0.1:80/images/product/product01sm3.jpg','http://127.0.0.1:80/images/product/product01md3.jpg','http://127.0.0.1:80/images/product/product01lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(4,1,'http://127.0.0.1:80/images/product/product01sm4.jpg','http://127.0.0.1:80/images/product/product01md4.jpg','http://127.0.0.1:80/images/product/product01lg4.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(5,1,'http://127.0.0.1:80/images/product/product01sm5.jpg','http://127.0.0.1:80/images/product/product01md5.jpg','http://127.0.0.1:80/images/product/product01lg5.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(6,1,'http://127.0.0.1:80/images/product/product01sm6.jpg','http://127.0.0.1:80/images/product/product01md6.jpg','http://127.0.0.1:80/images/product/product01lg6.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(7,2,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(8,2,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(9,2,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(10,3,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(11,4,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(12,5,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(13,6,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(14,7,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(15,8,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(16,9,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(17,10,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(18,11,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(19,12,'http://127.0.0.1:80/images/product/product03sm1.jpg','http://127.0.0.1:80/images/product/product03md1.jpg','http://127.0.0.1:80/images/product/product03lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(20,13,'http://127.0.0.1:80/images/product/product01sm1.jpg','http://127.0.0.1:80/images/product/product01md1.jpg','http://127.0.0.1:80/images/product/product01lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(21,13,'http://127.0.0.1:80/images/product/product01sm2.jpg','http://127.0.0.1:80/images/product/product01md2.jpg','http://127.0.0.1:80/images/product/product01lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(22,13,'http://127.0.0.1:80/images/product/product01sm3.jpg','http://127.0.0.1:80/images/product/product01md3.jpg','http://127.0.0.1:80/images/product/product01lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(23,13,'http://127.0.0.1:80/images/product/product01sm4.jpg','http://127.0.0.1:80/images/product/product01md4.jpg','http://127.0.0.1:80/images/product/product01lg4.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(24,13,'http://127.0.0.1:80/images/product/product01sm5.jpg','http://127.0.0.1:80/images/product/product01md5.jpg','http://127.0.0.1:80/images/product/product01lg5.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(25,13,'http://127.0.0.1:80/images/product/product01sm6.jpg','http://127.0.0.1:80/images/product/product01md6.jpg','http://127.0.0.1:80/images/product/product01lg6.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(26,14,'http://127.0.0.1:80/images/product/product01sm1.jpg','http://127.0.0.1:80/images/product/product01md1.jpg','http://127.0.0.1:80/images/product/product01lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(27,14,'http://127.0.0.1:80/images/product/product01sm2.jpg','http://127.0.0.1:80/images/product/product01md2.jpg','http://127.0.0.1:80/images/product/product01lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(28,14,'http://127.0.0.1:80/images/product/product01sm3.jpg','http://127.0.0.1:80/images/product/product01md3.jpg','http://127.0.0.1:80/images/product/product01lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(29,14,'http://127.0.0.1:80/images/product/product01sm4.jpg','http://127.0.0.1:80/images/product/product01md4.jpg','http://127.0.0.1:80/images/product/product01lg4.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(30,14,'http://127.0.0.1:80/images/product/product01sm5.jpg','http://127.0.0.1:80/images/product/product01md5.jpg','http://127.0.0.1:80/images/product/product01lg5.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(31,14,'http://127.0.0.1:80/images/product/product01sm6.jpg','http://127.0.0.1:80/images/product/product01md6.jpg','http://127.0.0.1:80/images/product/product01lg6.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(32,15,'http://127.0.0.1:80/images/product/product01sm1.jpg','http://127.0.0.1:80/images/product/product01md1.jpg','http://127.0.0.1:80/images/product/product01lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(33,15,'http://127.0.0.1:80/images/product/product01sm2.jpg','http://127.0.0.1:80/images/product/product01md2.jpg','http://127.0.0.1:80/images/product/product01lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(34,15,'http://127.0.0.1:80/images/product/product01sm3.jpg','http://127.0.0.1:80/images/product/product01md3.jpg','http://127.0.0.1:80/images/product/product01lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(35,15,'http://127.0.0.1:80/images/product/product01sm4.jpg','http://127.0.0.1:80/images/product/product01md4.jpg','http://127.0.0.1:80/images/product/product01lg4.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(36,15,'http://127.0.0.1:80/images/product/product01sm5.jpg','http://127.0.0.1:80/images/product/product01md5.jpg','http://127.0.0.1:80/images/product/product01lg5.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(37,15,'http://127.0.0.1:80/images/product/product01sm6.jpg','http://127.0.0.1:80/images/product/product01md6.jpg','http://127.0.0.1:80/images/product/product01lg6.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(38,16,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(39,16,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(40,16,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(41,17,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(42,17,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(43,17,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(44,18,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(45,18,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(46,18,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(47,19,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(48,19,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(49,19,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(50,20,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(51,20,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(52,20,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(53,21,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(54,21,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(55,21,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(56,22,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(57,22,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(58,22,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(59,23,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(60,23,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(61,23,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(62,24,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(63,24,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(64,24,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(65,25,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(66,25,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(67,25,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(68,26,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(69,26,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(70,26,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(71,27,'http://127.0.0.1:80/images/product/product02sm1.jpg','http://127.0.0.1:80/images/product/product02md1.jpg','http://127.0.0.1:80/images/product/product02lg1.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(72,27,'http://127.0.0.1:80/images/product/product02sm2.jpg','http://127.0.0.1:80/images/product/product02md2.jpg','http://127.0.0.1:80/images/product/product02lg2.jpg');
INSERT INTO ylife_product_pic(id,product_id,sm,md,lg) VALUES(73,27,'http://127.0.0.1:80/images/product/product02sm3.jpg','http://127.0.0.1:80/images/product/product02md3.jpg','http://127.0.0.1:80/images/product/product02lg3.jpg');





#商品分类表
CREATE TABLE ylife_class(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	product_id INT(11) DEFAULT NULL,	
  cname VARCHAR(32) DEFAULT NULL
);
INSERT INTO ylife_class(id,product_id,cname) VALUES(1,1,"餐具茶具");
INSERT INTO ylife_class(id,product_id,cname) VALUES(2,2,"厨房用具");
INSERT INTO ylife_class(id,product_id,cname) VALUES(3,3,"生活电器");
INSERT INTO ylife_class(id,product_id,cname) VALUES(4,4,"毛巾洗浴");
INSERT INTO ylife_class(id,product_id,cname) VALUES(5,5,"家纺用品");
INSERT INTO ylife_class(id,product_id,cname) VALUES(6,6,"居家收纳");
INSERT INTO ylife_class(id,product_id,cname) VALUES(7,7,"功能箱包");

#商品品牌分类表
CREATE TABLE ylife_cbrand(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	product_id INT(11) DEFAULT NULL,	
  bname VARCHAR(32) DEFAULT NULL
);
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,2,"膳魔师");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,3,"乐扣");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,4,"公牛");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,5,"百安思");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,6,"加加");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,7,"新榜样");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,8,"HAPPYCALL");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,9,"龙的");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,10,"伯尔尼斯");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,11,"申福");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,12,"宜阁");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,13,"金号");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,13,"天琴");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,13,"好太太");
INSERT INTO ylife_cbrand(id,product_id,bname) VALUES(NULL,13,"OLYMPIA");

#推荐品牌表
CREATE TABLE ylife_brand(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	class_id INT DEFAULT NULL,
  bname VARCHAR(32) DEFAULT NULL
);
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,1,"HAPPYCALL");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,1,"龙的");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,1,"伯尔尼斯");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,2,"膳魔师");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,2,"乐扣乐扣");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,2,"百安思");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,2,"申福");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,2,"大润窑");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,2,"膳魔师");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,3,"宜阁");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,3,"公牛");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,4,"金号");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,5,"天琴");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,6,"好太太");
INSERT INTO ylife_brand(id,class_id,bname) VALUES(NULL,7,"OLYMPIA");

#购物车
CREATE TABLE ylife_shoppingcart_item(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	user_id INT(11) DEFAULT NULL,
  pid INT(11) DEFAULT NULL,
	count INT(11) DEFAULT NULL,
	is_checked SMALLINT(2)
);
#关注列表
CREATE TABLE ylife_attention_item(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	user_id INT(11) DEFAULT NULL,
  pid INT(11) DEFAULT NULL,
	count INT(11) DEFAULT NULL,
	is_attended SMALLINT(2)
);



