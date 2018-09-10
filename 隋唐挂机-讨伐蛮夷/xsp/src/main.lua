-- 讨伐蛮夷脚本
init("0", 0);

require "find"

while(true)
do
	--完毕点确定
	findAndClick(299,866,451,921,0x17cda0,"完毕点确定!")

	--判断是不是讨伐页
--	local exists = find(230,106,249,121,0x080808)
	
--	if exists then
		-- 在讨伐页
--		sysLog("在活动页")
--		mSleep(200);
		
		local existBoss = find(574,424,666,468,0xa577a2);
		if existBoss then
			--挑战boss
			findAndClick(574,424,666,468,0xa577a2,"开始战斗");
			
			findAndClick(456,810,610,857,0x17cda0,"获取奖励");
		
--		else
--			local needMoney = find(455,808,608,860,0x17cda0);
				
--			if needMoney then
--				findAndClick(455,808,608,860,0x17cda0,"冷却战斗");
--			else
				--等待boss，5秒切一次页面
--				touchDown(1, 120, 120); 
--				mSleep(50);
--				touchUp(1, 120, 120);
				
--				mSleep(200);
			
--				touchDown(1, 240, 120); 
--				mSleep(50);
--				touchUp(1, 240, 120);
				
--				mSleep(200);
--			end
		end
		
--	else
		--不在讨伐页
		
		--跳过
		findAndClick(300,1253,448,1303,0x17cda0,"跳过!");
		--关闭
		findAndClick(455,1136,616,1191,0x17cda0,"关闭!");
--	end
	mSleep(500)
end

