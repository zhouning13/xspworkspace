-- 讨伐英雄远征脚本
init("0", 0);

require "find"

while(true)
do

	--挑战boss
	findAndClick(596,307,688,802,0xa577a2,"开始攻打!", 0, 1)

	--跳过
	findAndClick(300,1253,448,1303,0x17cda0,"跳过!")

	--关闭
	findAndClick(455,1136,616,1191,0x17cda0,"关闭!")
	
	--等待
	mSleep(500)
end

