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
### 获取屏幕分辨率 ###    

```
# 可直接在JS代码中用
screen.height ：屏幕高度。
screen.width ：屏幕宽度。
screen.availHeight ：屏幕可用高度。即屏幕高度减去上下任务栏后的高度，可表示为软件最大化时的高度。
screen.availWidth ：屏幕可用宽度。即屏幕宽度减去左右任务栏后的宽度，可表示为软件最大化时的宽度。
# 任务栏高/宽度 ：可通过屏幕高/宽度 减去 屏幕可用高/宽度得出。如：任务栏高度 = screen.height - screen.availHeight 。
window.outerHeight ：浏览器高度。
window.outerWidth ：浏览器宽度。
window.innerHeight ：浏览器内页面可用高度；此高度包含了水平滚动条的高度(若存在)。可表示为浏览器当前高度去除浏览器边框、工具条后的高度。
window.innerWidth ：浏览器内页面可用宽度；此宽度包含了垂直滚动条的宽度(若存在)。可表示为浏览器当前宽度去除浏览器边框后的宽度。
# 工具栏高/宽度 ：包含了地址栏、书签栏、浏览器边框等范围。如：高度，可通过浏览器高度 - 页面可用高度得出，即：window.outerHeight - window.innerHeight。

# 详细介绍： http://www.cnblogs.com/polk6/p/5051935.html
```