-- 比武大赛脚本
init("0", 0);

require "find"
while(true)
do
	local x, y = 300, 100;
	touchDown(1, x, y); 
	mSleep(200)	;
	touchUp(1, x, y);
	mSleep(500);

	local x, y = 420, 100;
	touchDown(1, x, y); 
	mSleep(200)	;
	touchUp(1, x, y);
	
	mSleep(500);

	local x, y = 630, 590;
	touchDown(1, x, y); 
	mSleep(200)	;
	touchUp(1, x, y);
	mSleep(1500);
	
	
end