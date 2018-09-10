require "base"
-- 几个基本业务

-- 网络延迟或者重新上线，发现挂机战斗报告
hookReport = function()
	local b = findMultiColors({
			-- 确定按键
			{x=320,y=981,color=0x17cda0},
			{x=447,y=983,color=0x17cda0},
			{x=302,y=1021,color=0x139e83},
			-- 关闭
			{x=703,y=278,color=0xffffff}, --白
			{x=703,y=260,color=0xfa8081}  --红
		})
	
	if b then
		sysLog("发现挂机战斗报告")
		click(375,1000)
	end
	mSleep(50)
end

-- 跳过战斗!
jumpBattle = function()
	-- 确定按键
	local b = findMultiColors({
			--浅绿
			{x=295,y=1253,color=0x17cda0},
			{x=333,y=1272,color=0x139e83},
			--深绿
			{x=332,y=1281,color=0x176357},
			{x=455,y=1287,color=0x196861},
			--字
			{x=343,y=1267,color=0xfef9ed},
			{x=400,y=1283,color=0xffd77d}
		})
	
	if b then
		sysLog("跳过战斗!")
		click(375,1280)
	end
end

-- 关闭战斗!
finishBattle = function()
	-- 确定按键
	local b = findMultiColors({
			--浅绿
			{x=457,y=1138,color=0x17cda0},
			{x=615,y=1146,color=0x16bf98},
			--深绿
			{x=622,y=1168,color=0x176357},
			{x=581,y=1170,color=0x176357},
			--字
			{x=509,y=1154,color=0xfcf5e3},
			{x=566,y=1157,color=0xfff1d1}
		})
	
	if b then
		sysLog("关闭战斗!")
		click(540,1160)
	end
end

-- 奖励提示1!
gainReward1 = function()
	-- 确定按键
	local b = findMultiColors({
			--浅绿
			{x=294,y=870,color=0x17cda0},
			{x=456,y=890,color=0x139e83},
			--深绿
			{x=335,y=897,color=0x176357},
			{x=455,y=901,color=0x176358},
			--字
			{x=348,y=883,color=0xfff8ea},
			{x=405,y=883,color=0xfff8ea}
		})
	
	if b then
		sysLog("奖励提示1!")
		click(375,890)
	end
end

-- 奖励提示2!
gainReward2 = function()
	-- 确定按键
	local b = findMultiColors({
			--浅绿
			{x=295,y=935,color=0x17cda0},
			{x=453,y=956,color=0x13a084},
			--深绿
			{x=337,y=963,color=0x176357},
			{x=456,y=966,color=0x176357},
			--字
			{x=348,y=948,color=0xfff7e9},
			{x=403,y=953,color=0xfeeec9}
		})
	
	if b then
		sysLog("奖励提示2!")
		click(375,960)
	end
end

-- 页头向右移动一格，并点击
headerRight = function()
	touchDown(1, 550, 120)
	mSleep(500)
	for i = 0, 120,20 do   --使用for循环连续滑动
		touchMove(1, 550 - i, 120); 
		mSleep(100);        --延迟
	end
	touchMove(1, 430, 120) 
	mSleep(200)
	touchUp(1, 430, 120)
	
	mSleep(200)
	
	click(640, 120)
end