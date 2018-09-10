init("0", 0);
setScreenScale(750,1334)

local dict = createOcrDict("dict.txt") 
result = ocrText(dict, 0, 0, 1135, 639, {"0x613d3b-0x202020","0x797979-0x202020"}, 100, 0, 0) -- 表示范围内全部搜索，以字符串形式返回识别结果
results = ocrText(dict, 0, 0, 1135, 639, {"0x613d3b-0x202020"}, 100, 1, 1) -- 表示范围内横向搜索，以table形式返回识别到的所有结果及其坐标
for k,v in pairs(results) do
    sysLog(string.format('{x=%d, y=%d, text=%s}', v.x, v.y, v.text))
end
	