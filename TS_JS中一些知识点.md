### es6 javascript对象方法Object.assign() ###   

1  基本用法        
Object.assign方法用于对象的合并，将源对象（ source ）的所有可枚举属性，复制到目标对象（ target ）。       
```
var target = { a: 1 };  
var source1 = { b: 2 };  
var source2 = { c: 3 };  
Object.assign(target, source1, source2);  
target // {a:1, b:2, c:3}  
```     
 
2  注意点     
Object.assign方法实行的是浅拷贝，而不是深拷贝。也就是说，如果源对象某个属性的值是对象，那么目标对象拷贝得到的是这个对象的引用。    
```
var obj1 = {a: {b: 1}};  
var obj2 = Object.assign({}, obj1);  
obj1.a.b = 2;  
obj2.a.b // 2  
上面代码中，源对象obj1的a属性的值是一个对象，Object.assign拷贝得到的是这个对象的引用。这个对象的任何变化，都会反映到目标对象上面。对于这种嵌套的对象，一旦遇到同名属性，Object.assign的处理方法是替换，而不是添加。
```   

3  常见用途     
（ 1 ）为对象添加属性     
（ 2 ）为对象添加方法      
（ 3 ）克隆对象        
（ 4 ）合并多个对象       
（ 5 ）为属性指定默认值      

4  详细介绍：   http://blog.csdn.net/qq_30100043/article/details/53422657       

-------------