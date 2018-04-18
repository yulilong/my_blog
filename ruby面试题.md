## ruby 基础

### 1、each、map、collect的区别

each: 仅遍历数组，并做相应操作，数组本身不发生改变。

map:遍历数组，并做相应操作后，返回新数组(处理)，原数组不变。

collect: 跟map作用一样。

`collect!` `map!`: 多了一个作用，改变原数组。

```ruby
// 终端打开 irb
// each
a = [ "a", "b", "c", "d" ]
b = a.each { |x| x + "!" } 	// a == b == [ "a", "b", "c", "d" ]

// map map!
a = [ "a", "b", "c", "d" ]
b = a.map { |x| x + "!" }	
a	// ["a", "b", "c", "d"]
b	// ["a!", "b!", "c!", "d!"]
c = a.map! { |x| x + "!" }
a	// ["a!", "b!", "c!", "d!"]
c	// ["a!", "b!", "c!", "d!"]

// collect collect!
a = [ "a", "b", "c", "d" ]
b = a.collect { |x| x + "!" }	
a	// ["a", "b", "c", "d"]
b	// ["a!", "b!", "c!", "d!"]
c = a.collect! { |x| x + "!" }
a	// ["a!", "b!", "c!", "d!"]
c	// ["a!", "b!", "c!", "d!"]
```

