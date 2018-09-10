-- 几个基本操作

-- 多点判断颜色是否正确，全部正确则 返回true，即使一个不正确，也是返回false
findMultiColors = function(posAndColors)
	for k,v in pairs(posAndColors) do 
		 x,y = findColor({v.x, v.y, v.x+1, v.y+1 },v.color,95,0,0,0)
		 if x == -1 and y == -1 then
			return false
		 end
	end
	return true
end


-- 点击
click = function(x, y)
	touchDown(1, x, y); 
	mSleep(50)	;
	touchUp(1, x, y);	
end

-- 滑动
sweep = function(x1,y1,x2,y2)
	touchDown(1, x1, y1)
	mSleep(50)
	touchMove(1, x2, y2)
	mSleep(50)
	touchUp(1, x2, y2)  
end

-- 显示一个点
showPoint = function(x,y)
	hudId = createHUD()
	
	showHUD(hudId," ",12,"0xffff0000","0xffffffff",0,x,y,12,12)      --显示HUD内容
	mSleep(10000)
	hideHUD(hudId)     --隐藏HUD
end