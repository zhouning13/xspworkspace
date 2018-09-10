--挂boss脚本
init("0", 0);

require "find"

ret,config = showUI("ui.json")


while(true)
do
	--挑战boss
	findAndClick(299,1077,454,1123,0x17cda0,"挑战boss!")

	--跳过
	local existJump = find(300,1253,448,1303,0x17cda0);
	if existJump then
		if config.challengeSpeed == "1" then
			mSleep(8000)
		end
		findAndClick(300,1253,448,1303,0x17cda0,"跳过!")
	end
	
	local needMoney, y = findColor({105, 788, 345, 881}, 
		"0|0|0x118c74,-80|-23|0x17cda0,80|-2|0x13a185,-77|25|0x139e83,80|8|0x176357,-39|6|0x176357",
		95, 0, 0, 0)
	
	if needMoney > -1 then
		if config.countOver == "0" then
			lua_exit()
		else
			findAndClick(456,807,606,859,0x17cda0,"花费元宝!")
		end
	end
	
	
	--关闭
	findAndClick(455,1136,616,1191,0x17cda0,"关闭!")
	
	findAndClick(300,932,448,980,0x17cda0,"奖励提示!")
	
	findAndClick(335,583,366,613,0xa7a7a7,"奖励箱子!",0,0,0,640,1136)
	--等待
	mSleep(500)
end

