
-- coroutine.create
print("coroutine.create")
co = coroutine.create(
    function (items)
        local length = #items
        for idx=1,length-1,1 do
            coroutine.yield(items[idx]) 
        end
        return items[length]
    end
)

print(coroutine.resume(co,{1,2,3}))
print(coroutine.resume(co,{1,2,3}))
print(coroutine.resume(co,{1,2,3}))

-- coroutine.wrap
print("coroutine.wrap")
co = coroutine.wrap(
    function (a, b) 
        print ("Args: ", a, b)
        local t1,t2 = coroutine.yield(a+1,b+1)
        print ("Args: ", t1, t2)
        return t1+1,t2+1
    end
)
print(co(1,2))
print(co(4,5))

-- Pipes and Filters

msgBroker = {}
msgQuote = 10

producer = coroutine.create(function () 
	while #msgBroker < msgQuote do 
		local item = "Message "..#msgBroker
		table.insert(msgBroker, item)
		print(item .. " Produced")
	end

	coroutine.yield(coroutine.resume(consumer))
end)

consumer = coroutine.create(function () 
	while #msgBroker > 0 do 
		local item = table.remove(msgBroker)
		print(item.." Consumed")
	end
	
	coroutine.yield(coroutine.resume(producer))
end)

coroutine.resume(producer);