--遗迹脚本
init("0", 0);

require "find"

function checkExit()
	for y = 0,2 do
		for x = 0,2 do
			x1 = 120 + 70 + x * 166
			x2 = x1 + 20
			y1 = 495 + 70 + y * 166
			y2 = y1 + 20
			findAndClick(x1,y1,x2,y2,0xffffff,"点门"..x..","..y)
		end
	end
	findAndClick(341,639,409,671,0xffffff,"过层!")
end

while(true)
do
	checkExit()
	for y = 0,2 do
		isBreak = false
		for x = 0,2 do
			x1 = 120 + 70 + x * 166
			x2 = x1 + 60
			y1 = 495 + 50 + y * 166
			y2 = y1 + 50
			opened1 = find(x1,y1,x2,y2,0xc1212a);
			sysLog(x..","..y.."opened1:"..tostring(opened1))
			x1 = 120 + 40 + x * 166
			x2 = x1 + 4
			y1 = 495 + 20 + y * 166
			y2 = y1 + 30
			opened2 = find(x1,y1,x2,y2,0x611738);
			sysLog(x..","..y.."opened2:"..tostring(opened2))
			if opened1 or opened2 then
			else
				x1 = 120 + 80 + x * 166
				y1 = 495 + 80 + y * 166
				click(x1,y1)
					
				findAndClick(298,867,449,1030,0x176357,"奖励提示!")
				findAndClick(296,1247,453,1304,0x1a6964,"跳过战斗!")
				findAndClick(481,1135,590,1189,0x1a6964,"关闭战斗!")
				mSleep(100)	;
				isBreak = true
				break
			end
		end
		if isBreak then break end
	end
	
	--奖励提示
--	findAndClick(298,867,449,1030,0x1a6964,"奖励提示!")
--	findAndClick(296,1247,453,1304,0x1a6964,"跳过战斗!")
--	findAndClick(481,1135,590,1189,0x1a6964,"关闭战斗!")
	checkExit()
	no_01=find(369,1024,369,1024,0xf9e770);
	no_02=find(369,1042,369,1042,0xf9e770);
	no_03=find(365,1033,365,1033,0xf9e770);
	no_04=find(375,1033,375,1033,0xf9e770);
	no_05=find(366,1038,366,1038,0xf9e770);
--	no_11=find(423,369,423,369,0xf4c623);
--	no_12=find(423,374,423,374,0xf4c623);
--	no_13=find(423,381,423,381,0xf4c623);
--	no_14=find(423,386,423,386,0xf4c623);
--	no_15=find(423,391,423,391,0xf4c623);
--	no_21=find(420,374,420,374,0xf4c623);
--	no_22=find(415,378,415,378,0xf4c623);
--	no_23=find(411,382,411,382,0xf4c623);
--and no_11 and no_12 and no_13 and no_14 and no_15 and no_21 and no_22 and no_23
	if no_01 and no_02 and no_03 and no_04 and no_05  then
		lua_exit(); --退出脚本
	end
	
	
	mSleep(500)
end

