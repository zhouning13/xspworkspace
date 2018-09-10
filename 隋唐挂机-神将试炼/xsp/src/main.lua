-- 神将试炼脚本
init("0", 0);

require "find"

-- 点击任务取膜拜任务 的位置
x1,y1 = 340,700;
x1d, x1f = math.modf(x1*width/750);
y1d, y1f = math.modf(y1*height/1334);

while(true)
do
	
	
	-- 点击任务取膜拜任务
	touchDown(1, x1d, y1d); 
	mSleep(50);
	touchUp(1, x1d, y1d);
	mSleep(50);
	--关闭
	if find(294,934,451,989,0x17cda0) then
		click(370,960)
		lua_exit();
	end
end