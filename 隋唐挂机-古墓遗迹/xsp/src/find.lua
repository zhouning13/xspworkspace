width, height = getScreenSize()
sysLog("屏幕尺寸："..width..","..height)

function getPoint(x1, y1, fw, fh)
	local fw = fw or 750;
	local fh = fh or 1334;
	local x1d, x1f = math.modf(x1*width/fw);
	local y1d, y1f = math.modf(y1*height/fh);
	return x1d, y1d;
end 

function getPosition(x1, y1, x2, y2, fw, fh)
	local x1d,y1d = getPoint(x1, y1, fw, fh)
	local x2d,y2d = getPoint(x2, y2, fw, fh)
	return x1d, y1d, x2d, y2d;
end 

function find(x1, y1, x2, y2, color, hdir, vdir, priority, fw, fh)
	local x, y = findColor({getPosition(x1, y1, x2, y2, fw, fh)}, color, 90, hdir or 0, vdir or 0, priority or 0);
	return (x ~= -1 and y ~= -1);
end

function findAndClick(x1, y1, x2, y2, color, logs, hdir, vdir, priority, fw, fh)
	local x, y = findColor({getPosition(x1, y1, x2, y2, fw, fh)}, color, 90, hdir or 0, vdir or 0, priority or 0);
	if x ~= -1 and y ~= -1 then
		sysLog(logs)
		touchDown(1, x, y); 
		mSleep(50)	;
		touchUp(1, x, y);	
	end
end

function click(x1, y1, fw, fh)
	local x, y = getPoint(x1, y1, fw, fh);
	touchDown(1, x, y); 
	mSleep(50)	;
	touchUp(1, x, y);	
end