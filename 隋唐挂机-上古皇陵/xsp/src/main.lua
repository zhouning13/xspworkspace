--上古皇陵脚本
init("0", 0);

require "find"
ret,config = showUI("ui.json")

while(true)
do
	resetIDLETimer()
	-- 初始页选攻击
	local isFrontPage = find(303,235,458,266,0xdc1d36,0,0,0,750,1334);
	if isFrontPage and config.attr=="0" then
		findAndClick(303,690,461,726,0xf1f1f1,"初始页!",0,0,0,750,1334);
	end

	-- 是否存在属性星（加强属性页）
	local existAttrStar = find(586,400,631,446,0xfffb2b,0,0,0,750,1334);
	if existAttrStar and config.attr=="0" then
		local exist30Attr = find(561,869,653,912,0xf36808,0,0,0,750,1334);
		if exist30Attr then
			findAndClick(561,869,653,912,0xf36808,"30星属性",0,0,0,750,1334);
		else
			local exist15Attr = find(561,720,653,764,0xf36808,0,0,0,750,1334);
			if exist15Attr then
				findAndClick(561,720,653,764,0xf36808,"15星属性",0,0,0,750,1334);
			else
				local exist3Attr = find(561,568,653,614,0xf36808,0,0,0,750,1334);
				if exist3Attr then
					findAndClick(561,568,653,614,0xf36808,"3星属性",0,0,0,750,1334);
				end
			end
		end
	end


	-- 标题星存在（挑战页），进行挑战判断
	local existTitleStar = find(291,381,348,428,0xfffb2b,0,0,0,750,1334);
	if existTitleStar then
		-- 是否存在一星战结果
		local existFirstStar = find(542,480,713,530,0xfffb2b,0,0,0,750,1334);
		if existFirstStar then
			-- 一星已获得，则判断是否存在二星战结果
			local existSecondStar = find(540,646,719,698,0xfffb2b,0,0,0,750,1334);
			if existSecondStar then
				-- 二星已获得，则判断是否存在三星战结果
				local existThirdStar = find(546,806,713,859,0xfffb2b,0,0,0,750,1334);
				if existThirdStar then
					-- 三星已获得，则试点下一关
					findAndClick(293,1095,441,1146,0x17cda0,"下一关!",0,0,0,750,1334);
				else
					-- 三星未获得，则试点三星挑战
					findAndClick(546,806,713,859,0xf36808,"3星战!",0,0,0,750,1334);
				end
			else
				-- 二星未获得，则试点二星挑战
				findAndClick(540,646,719,698,0xf36808,"2星战!",0,0,0,750,1334);
			end
		else
			-- 一星未获得，则试点一星挑战
			findAndClick(542,480,713,530,0xf36808,"1星战!",0,0,0,750,1334);
		end
	end
	-- 跳过
	findAndClick(297,1251,454,1306,0x17cda0,"跳过!",0,0,0,750,1334);
	-- 关闭
	findAndClick(530,1140,611,1187,0x17cda0,"关闭!",0,0,0,750,1334);
	-- 层内奖励
	findAndClick(298,866,410,921,0x17cda0,"层内奖励!",0,0,0,750,1334);
	-- 5关奖励
	findAndClick(300,758,459,808,0x17cda0,"5关奖励!",0,0,0,750,1334);
	
	if find(629,844,654,886,0x17cda0,0,0,0,750,1334) then
		findAndClick(229,851,258,876,0x17cda0,"挑战次数耗完",0,0,0,750,1334);
		lua_exit()
	end
	
	mSleep(500)
end