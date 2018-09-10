--日常集成脚本
init("0", 0);
setScreenScale(750,1334)
ret,config = showUI("ui.json")
require "base" 
require "b_base"
handling = nil;

-- 开场公告
isBeginning=true
hookBegin = function()
	if isBeginning==false then
		return
	end
	local b = findMultiColors({
			-- 确定按键
			{x=394,y=1019,color=0x17cda0},
			{x=447,y=1019,color=0x17cda0},
			{x=297,y=1019,color=0x17cda0},
			{x=407,y=1063,color=0x139e83},
			-- 关闭
			{x=715,y=196,color=0xffffff}, --白
			{x=715,y=177,color=0xfa8081}  --红
		})
	if b then
		sysLog("发现开场公告")
		
		click(370,1050)
		isBeginning = false
		handling = toFirstPage
	end
	mSleep(50)
end

-- 去往首页：
isBegged = false
isBattleFiledClick = false
isBoxOpened = false
toFirstPage = function()
	-- 点击页面左下角
	click(66,1280)
	-- 判断是不是首页
	mSleep(200)
	local a = findMultiColors({
			{x=375,y=285,color=0x6597b8},
			{x=283,y=318,color=0x303954},
			{x=273,y=306,color=0xcdbd7c},
			{x=223,y=313,color=0x632731},
			{x=93, y=229,color=0xbf4d56},
			{x=78 ,y=452,color=0xeca932},
			{x=97 ,y=453,color=0xefae34}
		})
	if a then
		-- 是首页，开始选择目标
		if isBegged == false then
			handling = begging --开始首页膜拜
		elseif isBattleFiledClick == false then
			handling = toBattleFild
		elseif isBoxOpened == false then
			handling = toItem
		else
			handling = toHang
		end
	end
	
end
handling = toFirstPage

-- 去道具栏
toItem = function()
	click(470,1150)
	mSleep(200)
	local a, y = findColor({0, 0, 639, 1135}, 
		"0|0|0x7c4823,289|4|0x804a24,592|4|0x804a24,-33|71|0xe68f3b,301|71|0xe68f3b,639|71|0xe68f3b,-26|87|0x814d26,615|89|0x7f4d26",
		95, 0, 1, 0)
	if a > -1 then
		handling = toItemBox
	end
end

-- 只看宝箱道具
toItemBox = function()
	click(230,100)
	mSleep(200)
	local x, y = findColor({0, 0, 749, 1333}, 
		"0|0|0x93b17e,102|3|0x90ae7a,-7|23|0x8fad7a,103|22|0x718a5e",
		95, 0, 1, 0)
	if x > -1 then
		handling = openBoxItem
	end
end

-- 开箱子
openBoxItem = function()
	sysLog("开箱子")
	local x, y = findColor({550, 170, 720, 1220}, 
		"0|0|0x734e71,-46|-19|0xab7ca8,46|-19|0xab7ca8,-45|19|0x90618d,41|18|0x7d4e7a",
		95, 0, 1, 0)
	if x > -1 then
		sysLog("点击箱子")
		click(x, y)
		mSleep(400)
	end	
	
	local x2, y2 = findColor({0, 0, 749, 1333}, 
		"0|0|0x17cb9f,157|13|0x13ab8c,3|44|0x139f84",
		95, 0, 1, 0)
	if x2 > -1 then
		sysLog("发现箱子")
		local x1, y1 = findColor({0, 0, 749, 1333}, 
			"527|924|0xfcf43d,533|926|0x773b04,519|925|0xa25903,514|925|0x773b04,516|933|0xf9e41f,524|939|0x9f5a03",
			95, 0, 1, 0)
		if x1 > -1 then
			sysLog("需要元宝开箱子")
			click(710, 300)
			mSleep(400)
			-- TODO
			isBoxOpened = true
			handling = toFirstPage
		else
			sysLog("直接开箱子")
			click(560, 960)
			mSleep(400)
		end
	else
		sysLog("未发现箱子")
		mSleep(200)
	end
	
	local x3, y3 = findColor({37, 178, 706, 289}, 
		"0|0|0x815129,384|56|0x81542b,555|10|0x805029,634|13|0x81512a",
		95, 0, 0, 0)
	if x3 > -1 then
		sysLog("箱子已开尽")
		isBoxOpened = true
		handling = toFirstPage
	end
end

-- 检查箱子内容
checkBoxItem = function()
	
end

-- 去战场
toBattleFild = function()
	-- 点击页面右上角的战场
	click(660,250)
	mSleep(200)
	local b = findMultiColors({
			-- 绿色按钮
			{x=277,y=77,color=0x18cfa0},
			{x=383,y=102,color=0x129d82},
			{x=440,y=77,color=0x18cfa0},
			{x=543,y=100,color=0x12a286},
			{x=604,y=77,color=0x18cfa0},
			{x=705,y=97,color=0x13a78a},
			-- 黄色边框
			{x=253,y=105,color=0xfcc219},
			{x=402,y=105,color=0xfcc119},
			{x=566,y=105,color=0xfac118},
			{x=732,y=104,color=0xfcc419}
		})
	if b then
		handling = toBattleFieldClick
	end
end

-- 去战场膜拜
toBattleFieldClick = function()
	click(690,850)
	mSleep(200)
	local b = findMultiColors({
		-- 云彩
		{x=216,y=113,color=0xa02430},
		{x=532,y=118,color=0x95212d},
		-- 无敌大元帅
		{x=303,y=105,color=0xfff9ed},
		{x=332,y=104,color=0xfffbf1},
		{x=412,y=104,color=0xfffbf1},
		-- 返回
		{x=706,y=118,color=0x60ad32},
		{x=719,y=118,color=0xfff1c8}
	})
	if b then
		handling = battleFieldClick
	end
end

-- 经行战场膜拜
battleFieldClick = function()
	-- 点击膜拜按钮
	click(380,1100)
	mSleep(200)
	-- 判断是否变灰
	local b = findMultiColors({
		{x=303,y=1085,color=0x737373},
		{x=444,y=1101,color=0x5c5c5c},
		{x=459,y=1125,color=0x676767},
		{x=307,y=1124,color=0x595959},
		{x=379,y=1113,color=0xd4d4d4}
	})
	if b then
		isBattleFiledClick = true
		handling = toFirstPage
	end
	
end

-- 首页膜拜
begging = function()
	-- 点 划 
	click(371,861)
	mSleep(50)
	sweep(195,567,548,624)
	mSleep(50)
	
	-- 判断心力是不是0
	local b = findMultiColors({
		{x=350,y=18,color=0xfffae9},
		{x=350,y=35,color=0xfffae9},
		{x=346,y=26,color=0xfffae9},
		{x=354,y=26,color=0xfffae9},
		{x=350,y=26,color=0x3b462a}
	})
	if b then
		--心力为0，膜拜完毕，跳往挂机页面
		sysLog("心力为0，膜拜完毕")
		
		isBegged = true
		handling = toFirstPage
		mSleep(500)
	end
	mSleep(50)
end

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
		if config.attr=="2" then
			handling = toMatch
		else
			handling = wipe
		end
	end
	mSleep(500)
end

-- 皇陵扫荡
wipe = function()
	-- 初始页
	--[[
	--]]
	local isFrontPage = findMultiColors({
			{x=107,y=238,color=0x30263e},
			{x=227,y=251,color=0x5f4e68},
			{x=309,y=242,color=0xd51d36},
			{x=314,y=246,color=0xf8e7e9},
			{x=331,y=254,color=0x41030d},
			{x=340,y=258,color=0x9a1f2d},
			{x=237,y=603,color=0x15111d}
		})
	if isFrontPage and config.attr=="0" then
		sysLog("皇陵首页，选攻击")
		click(610,740)
	end
	-- 是否存在属性星（加强属性页）
	local x_existAttrStar, y_existAttrStar = findColor({586,400,631,446},0xfffb2b, 95,0,0,0)
	if x_existAttrStar ~= -1 and y_existAttrStar ~= -1 and config.attr=="0" then
		sysLog("属性加成")
		local x_exist30Attr,y_exist30Attr = findColor({554,872,666,914},0xf16105, 95,0,0,0);
		if x_exist30Attr ~= -1 and y_exist30Attr ~= -1 then
			sysLog("属性加成：选30星")
			--showPoint(610,890);
			click(610,890);
		else
			local x_exist15Attr, y_exist15Attr = findColor({562,722,657,763},0xf16105, 95,0,0,0);
			if x_exist15Attr ~= -1 and y_exist15Attr ~= -1  then
				sysLog("属性加成：选15星")
				--showPoint(610,740);
				click(610, 740);
			else
				local x_exist3Attr, y_exist3Attr = findColor({558,569,656,605},0xf16105, 95,0,0,0);
				if x_exist3Attr ~= -1 and y_exist3Attr then
					sysLog("属性加成：选3星")
					--showPoint(610,590);
					click(610, 590);
				else
					sysLog("属性加成：未选择")
				end
			end
		end
	end
	
	-- 标题星存在（挑战页），进行挑战判断
	local x_existTitleStar, y_existTitleStar  = findColor({291,381,348,428},0xfffb2b, 95,0,0,0);
	if x_existTitleStar ~= -1 and y_existTitleStar ~= -1 then
		-- 是否存在一星战结果
		sysLog("标题星存在")
		local x_existFirstStar, y_existFirstStar = findColor({542,480,713,530},0xfffb2b, 95,0,0,0);
		if x_existFirstStar ~= -1 and  y_existFirstStar ~= -1 then
			-- 一星已获得，则判断是否存在二星战结果
			local x_existSecondStar, y_existSecondStar = findColor({540,646,719,698},0xfffb2b, 95,0,0,0);
			if x_existSecondStar ~= -1 and  y_existSecondStar ~= -1  then
				-- 二星已获得，则判断是否存在三星战结果
				local x_existThirdStar, y_existThirdStar = findColor({546,806,713,859},0xfffb2b, 95,0,0,0);
				if x_existThirdStar ~= -1 and  y_existThirdStar ~= -1  then
					-- 三星已获得，则试点下一关
					sysLog("三星已获得，试点下一关")
					click(360,1120);
				else
					-- 三星未获得，则试点三星挑战
					sysLog("三星未获得，则试点三星挑战")
					click(640,830);
				end
			else
				-- 二星未获得，则试点二星挑战
				sysLog("二星未获得，则试点二星挑战")
				click(640,670);
			end
		else
			-- 一星未获得，则试点一星挑战
			sysLog("一星未获得，则试点一星挑战")
			click(640,510);
		end
	else
		sysLog("标题星不存在")
	end
	
	-- 结算奖励
	local isRewarding = findMultiColors({
			-- 浅绿
			{x=297,y=760,color=0x17cda0},
			{x=466,y=783,color=0x139e83},
			-- 深绿
			{x=340,y=790,color=0x176357},
			{x=461,y=794,color=0x18665d},
			-- 字
			{x=353,y=774,color=0xfff8ea},
			{x=411,y=777,color=0xfef3da}
		})
	if isRewarding then
		sysLog("结算奖励")
		click(380,790)
	end
	
	-- 挑战次数耗完
	local isFinished = findMultiColors({
			{x=351,y=587,color=0xe34617},
			{x=351,y=608,color=0xe34617},
			{x=345,y=597,color=0xe34617},
			{x=356,y=597,color=0xe34718},
			{x=350,y=598,color=0xeec370},
			{x=363,y=599,color=0xeec370}
		})
	if isFinished then
		sysLog("挑战次数耗完")
		click(180,860)
		handling = toMatch
	end
	
	mSleep(500)
end

-- 去比武
toMatch = function()
	click(370,120)
	
	local hour = tonumber(os.date("%H"));
	if hour >= 20 then
		sysLog("比武时段，去往古墓遗迹")
		handling = toTomb
		return
	end
	
	local a = findMultiColors({
			--背景
			{x=30,y=229,color=0x6f6375},
			{x=730,y=244,color=0xf2dda4},
			{x=706,y=385,color=0x8f786b},
			{x=646,y=439,color=0xf1e5b1},
			{x=701,y=838,color=0x111230},
			--{x=,y=,color=},
			--天下第一比武大会
			{x=213,y=254,color=0x8a212a},
			{x=270,y=246,color=0xffd345},
			{x=529,y=253,color=0x8e222b},
			{x=482,y=249,color=0xfec948}
		})		
	if a then
		sysLog("非比武时段，开始膜拜")
		handling = matching
		return 
	end
	
	sysLog("去比武，未识别位置")
	mSleep(500)
end

matching = function()
	click(380,1120)
	
	local a = findMultiColors({
			{x=318,y=1091,color=0x6f6f6f},
			{x=457,y=1093,color=0x6c6c6c},
			{x=460,y=1134,color=0x505050},
			{x=308,y=1133,color=0x5a5a5a},
			{x=387,y=1114,color=0x767676}
		})		
	if a then 
		sysLog("膜拜完毕，去往古墓遗迹")
		handling = toTomb
	end
	mSleep(200)
end

-- 去往古墓遗迹
toTomb = function()
	click(500,120)
	
	local a = findMultiColors({
			{x=690,y=442,color=0xfe1711},
			{x=700,y=442,color=0xfe1711},
			{x=718,y=441,color=0xfe1711},
			{x=704,y=453,color=0xfdf5e1},
			{x=705,y=480,color=0x970100}
		})
	if a then
		sysLog("开始挖坟")
		handling = tombing
	end
	mSleep(500)
end

-- 古墓遗迹，检查是否有已开的门了
checkExit = function()
	for y = 0,2 do
		for x = 0,2 do
			local x1 = 120 + 70 + x * 166
			local x2 = x1 + 20
			local y1 = 495 + 70 + y * 166
			local y2 = y1 + 20
			x3, y3 = findColor({x1,y1,x2,y2},0xffffff, 95,0,0,0)
			if x3 ~= -1 and y3 ~= -1 then
				click(x3,y3)
			end
		end
	end
	x4, y4 = findColor({341,639,409,671},0xffffff, 95,0,0,0)
	if x4 ~= -1 and y4 ~= -1 then
		click(x4,y4)
	end
end

-- 古墓遗迹，主函数
tombing = function()
	checkExit()
	for y = 0,2 do
		for x = 0,2 do
			x1 = 120 + 70 + x * 166
			x2 = x1 + 60
			y1 = 495 + 50 + y * 166
			y2 = y1 + 50
			x3,y3 = findColor({x1,y1,x2,y2},0xc1212a, 95,0,0,0)
			
			x1 = 120 + 40 + x * 166
			x2 = x1 + 10
			y1 = 495 + 20 + y * 166
			y2 = y1 + 30
			x4,y4 = findColor({x1,y1,x2,y2},0x611738, 95,0,0,0)
			
			if x3== -1 and x4 == -1 and y3 == -1 and y4 == -1 then
				
				-- 既没有箱子，有没有怪物，就点开
				x5 = 120 + 80 + x * 166
				y5 = 495 + 80 + y * 166
				sysLog("x:"..x..",y:"..y.."未挖掘，挖掘点 "..x5..","..y5)
				--showPoint(x5,y5)
				click(x5,y5)
				
				mSleep(700)
				
				checkExit()
				local isFinished = findMultiColors({
						{x=369,y=1024,color=0xf8e670},
						{x=369,y=1042,color=0xeada6b},
						{x=365,y=1033,color=0xf9e770},
						{x=375,y=1033,color=0xf9e770},
						{x=365,y=1037,color=0xf9e770},
						{x=375,y=1030,color=0xf9e770}
					})
				if isFinished then
					handling = toExample
				end
				return
			end
		end
	end
	mSleep(500)
end


toExample = function()
	click(650,120)
	local a = findMultiColors({
			{x=655,y=211,color=0xf8ef05},
			{x=655,y=219,color=0x713d01},
			{x=663,y=224,color=0x713d01},
			{x=657,y=234,color=0x713d01},
			{x=656,y=225,color=0xf4da05},
			{x=19, y=200,color=0x142944},
			{x=728,y=215,color=0x141d44}
		})
	if a then
		sysLog("开始试炼")
		handling = example
	end
	mSleep(50)
end

example = function()
	while(true)
	do
		click(340,700)
		gainReward1()
		gainReward2()
		local a = findMultiColors({
				{x=157,y=667,color=0xfefefe},
				{x=210,y=673,color=0xffffff},
				{x=287,y=676,color=0xffffff},
				{x=361,y=677,color=0xffffff},
				{x=436,y=669,color=0xffffff},
				{x=463,y=677,color=0xffffff},
				{x=544,y=678,color=0xffffff},
				{x=581,y=684,color=0xffffff}
			})
		if a then
			sysLog("试炼完毕")
			handling = toBandit
			return
		end
		mSleep(50)
	end
end

--handling = example
toBandit = function()
	
	touchDown(1, 550, 120)
	mSleep(500)
	
	touchMove(1, 490, 120); 
	mSleep(200);  
	
	touchMove(1, 430, 120); 
	mSleep(200);  
	
	touchUp(1, 430, 120)
	mSleep(500); 
	local x, y = findColor({61, 66, 696, 184}, 
		"0|0|0xfdf142,39|-31|0xf35d05,13|-39|0xf25c05,33|-19|0xa20411,-7|39|0xffcc57",
		95, 0, 0, 0)
	if x ~= -1 then
		click(x, y)
		mSleep(400)
	end
	local b =  findColor({0, 0, 749, 1333}, 
		"82|340|0xaf0b03,543|352|0xd7220e,675|348|0xfcefd2,660|356|0xb60a09,687|357|0xb60a09,733|477|0x4a2c68,342|1108|0x237482,56|582|0x132444",
		95, 0, 0, 0)
	if b then
		sysLog("开始皇室宝库")
		handling = banditing
	end
	mSleep(50)
end

banditing = function()
	local a = findMultiColors({
		--元宝
		{x=166,y=1144,color=0xfcf644},
		{x=151,y=1156,color=0xfbe51b},
		{x=151,y=1163,color=0x924e07},
		{x=149,y=1145,color=0x773b04},
		{x=174,y=1145,color=0x773b04},
		{x=176,y=1155,color=0xf7de1b},
		{x=165,y=1159,color=0xf5e243}
	})
	if a then
		sysLog("皇室宝库免费的已经用完")
		handling = finished
	else
		click(200,1090)
		mSleep(500)
	end

end

finished = function()
	sysLog("脚本完毕")
	lua_exit() 
end

while(true)
do
	hookReport()
	hookBegin()
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



--showPoint(320,981)
--showPoint(100,100)

