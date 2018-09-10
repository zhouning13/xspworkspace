-- 首页- 膜拜脚本
init("0", 0);

require "find"

width, height = getScreenSize()
-- 点击任务取膜拜任务 的位置
x1,y1 = 317,735;
x1d, x1f = math.modf(x1*width/640);
y1d, y1f = math.modf(y1*height/1136);

-- 横扫 位置
x2,y2,x3,y3 = 167,484,468,533;
	
x2d, x2f = math.modf(x2*width/640);
y2d, y2f = math.modf(y2*height/1136);
x3d, x3f = math.modf(x3*width/640);
y3d, y3f = math.modf(y3*height/1136);

while(true)
do
	
	
	-- 点击任务取膜拜任务
	touchDown(1, x1d, y1d); 
	mSleep(50)	;
	touchUp(1, x1d, y1d);
	mSleep(50)	
	
	-- 横扫
	touchDown(1, x2, y2)
	mSleep(50)
	touchMove(1, x3, y3)
	mSleep(50)
	touchUp(1, x3, y3)  
	mSleep(50)

	no_01=find(350,18,350,18,0xfffae9);
	no_02=find(350,35,350,35,0xfffae9);
	no_03=find(346,26,346,26,0xfffae9);
	no_04=find(354,26,354,26,0xfffae9);
	no_05=find(350,26,350,26,0x3b462a);
	if no_01 and no_02 and no_03 and no_04 and no_05  then
		lua_exit(); --退出脚本
	end
	
end