--挂远征收菜脚本
init("0", 0);
setScreenScale(750,1334)
ret,config = showUI("ui.json")
require "base" 
require "b_base"
-- 去挂机界面
toHang = function()
	sysLog("进入挂机方法")
	click(390,1280)
	local b = findMultiColors({
		{x=314,y=110,color=0xee5802},
		{x=459,y=110,color=0xee5a03},
		{x=376,y=104,color=0xfff1d0},
		{x=664,y=118,color=0xecc379},
		{x=686,y=503,color=0x6e190f},
		{x=691,y=711,color=0xfde5ad},
		{x=690,y=799,color=0xf5d48f}
	})
	if b then
		sysLog("进入挂机界面")
		handling = openBoxs
	end
	mSleep(500)
end

-- 跳到挂机页面后开箱子，跳往冒险玩法
openBoxs = function()
	-- TODO 开箱子
	--[[click(90,520)
	click(220,520)
	click(350,520) --]]
	
	local a = findMultiColors({
			{x=650,y=116,color=0xffdf86},
			{x=675,y=135,color=0x3e1c10},
			{x=657,y=132,color=0xf3f0eb},
			{x=695,y=132,color=0xfffef9}
		})
	if a then
		sysLog("进入冒险玩法")
		click(680,120)
		-- TODO 延时检测
		handling = toExpedition
	end
	mSleep(500)
end

toExpedition = function()
	touchDown(1, 550, 120)
	mSleep(500)

	touchMove(1, 490, 120); 
	mSleep(200);

	touchMove(1, 430, 120) 
	mSleep(200)
	touchUp(1, 430, 120)
	mSleep(1000)
	local x, y = findColor({430, 58, 561, 185}, 
		"0|0|0x974e33,30|-13|0x4f6d7e,38|-48|0xebb312,-18|-13|0xf5e8c2,16|-8|0xfdfbf7,36|9|0xf15f54",
		95, 0, 0, 0)
	if x > -1 then
		mSleep(1000)
		sysLog("开始远征")
		click(490,130);
		mSleep(200)
		handling = expedition
	end
	mSleep(50)
end

count = 0 
expedition = function()
	-- 随机奖励 购买页，关闭
	local x1, y1 = findColor({134, 227, 715, 796}, 
		"0|0|0xffffff,-305|456|0xfbf352,-310|473|0x965803",
		95, 0, 1, 0)
	if x1 > -1 then
		sysLog("随机奖励 购买型 关闭")
		click(x1,y1);
		mSleep(50)
		return
	end
	
	-- 领取奖励 蓝色玉石
	x2, y2 = findColor({61, 492, 690, 609}, 
		"0|0|0xa778a4,-45|-5|0xab7ca8,46|-2|0xaa7ba7,45|35|0x82537f,-47|34|0x90618d,-498|-7|0x00e0e9,-462|3|0x00b2d0,-479|28|0x02fbfe",
		95, 0, 1, 0)
	if x2 > -1 then
		sysLog("领取奖励 蓝色玉石")
		click(x2,y2);
		mSleep(50)
		return
	end
	
	-- 领取奖励 绿色玉石
	x3, y3 = findColor({61, 492, 690, 609}, 
		"0|0|0xa778a4,-45|-5|0xab7ca8,46|-2|0xaa7ba7,45|35|0x82537f,-47|34|0x90618d,-504|4|0x8de670,-460|4|0x3fcc56,-494|17|0x309051",
		95, 0, 1, 0)
	if x3 > -1 then
		sysLog("领取奖励 绿色玉石")
		click(x3,y3);
		mSleep(50)
		return
	end
	
	-- 领取奖励 白色玉石
	x4, y4 = findColor({61, 492, 690, 609}, 
		"0|0|0xa778a4,-45|-5|0xab7ca8,46|-2|0xaa7ba7,45|35|0x82537f,-47|34|0x90618d,-507|5|0xf0fffe,-461|3|0xb3e7e7,-495|19|0x59a4c0",
		95, 0, 1, 0)
	if x4 > -1 then
		sysLog("领取奖励 白色玉石")
		click(x4,y4);
		mSleep(50)
		return
	end

	-- 巡逻
	local x8, y8 = findColor({545, 310, 717, 1201}, 
		"0|0|0x91628e,-44|-15|0xaa7ba7,43|-17|0xac7da9,45|23|0x80517d,-44|22|0x90618d,14|13|0xffcd5c,-8|15|0xffc94f,-22|10|0x4e1948",
		95, 0, 1, 0)
	if x8 > -1 then
		sysLog("巡逻")
		click(x8,y8);
		mSleep(50)
		return
	end

	-- 领取
	local x9, y9 = findColor({545, 310, 717, 1201}, 
		"0|0|0x593c57,-48|-18|0xac7da9,42|-17|0xab7ca8,46|-1|0x92638f,42|20|0x7d4e7a,14|6|0xffda86",
		95, 0, 1, 0)
	if x9 > -1 then
		sysLog("领取")
		click(x9,y9);
		mSleep(50)
		return
	end
	
	-- 结束
	if count > 20 then
		sysLog("结束")
		count = 0
		if config.run_type == "0" then
			lua_exit()
		else
			handling = toHang
		end
		return
	end

	-- 实在没有什么东西，就上移
	mSleep(500)
	local x10, y10 = findColor({14,319,745,836}, 
		"0|0|0x845f33,442|1|0x856034,203|-1|0x825e33",
		95, 0, 1, 0)
	if x10 > -1 then
		sysLog("实在没有什么东西，就上移")
		touchDown(1, 350, 550)
		mSleep(500)

		touchMove(1, 350, 570); 
		mSleep(500);

		touchMove(1, 350, 590) 
		mSleep(500)
		touchUp(1, 350, 590)
		mSleep(500)
		count = count + 1
	else
		sysLog("上移也没有")
	end
end

handling = toHang;
while(true)
do
	hookReport()
	jumpBattle()
	finishBattle()
	gainReward1()
	gainReward2()
	resetIDLETimer()
	if handling == nil then
		sysLog("handling 为空")
		mSleep(500)
	else
		handling()
	end

end