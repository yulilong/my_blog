[TOC]

# Markdown常用语法与编辑器支持情况

## 1. 脚注语法

需要脚注的地方：    
```
这是一个注脚[^footnote]的样例。

这是第二个注脚[^footnote2]的样例。
```

md文档最下面写明脚注：    
```
[^footnote]: 这是一个 *注脚* 的 **文本**。

[^footnote2]: 这是另一个 *注脚* 的 **文本**。

```
支持的编辑器： bitbucket、www.zybuluo.com

不支持的网站：   
https://github.com ， 码云网站wiki不行。        

## 2. 表格

语法：    

> - `-------:`为右对齐。
> - `:------`为左对齐。
> - `:------:`为居中对齐。
> - `-------`为使用默认居中对齐。    

```
| 项目        | 价格   |  数量  |
| --------   | -----:  | :----:  |
| 计算机     | \$1600 |   5     |
| 手机        |   \$12   |   12   |
| 管线        |    \$1    |  234  |
```

效果：    

| 项目        | 价格   |  数量  |
| --------   | -----:  | :----:  |
| 计算机     | \$1600 |   5     |
| 手机        |   \$12   |   12   |
| 管线        |    \$1    |  234  |

支持的情况：bitbucket、github、https://www.zybuluo.com、VSCODE、

## 3. html语法的支持

### 3.1 HTML的表格

```
<table>
    <tr>
        <th rowspan="2">值班人员</th>
        <th>星期一</th>
        <th>星期二</th>
        <th>星期三</th>
    </tr>
    <tr>
        <td>李强</td>
        <td>张明</td>
        <td>王平</td>
    </tr>
</table>
```

支持的编辑器： github、码云、www.zybuluo.com

## 4. 数学公式

参考资料：https://www.jianshu.com/p/4460692eece4

$ J_\alpha(x) = \sum_{m=0}^\infty \frac{(-1)^m}{m! \Gamma (m + \alpha + 1)} {\left({ \frac{x}{2} }\right)}^{2m + \alpha} \text {，行内公式示例} $

```
$ J_\alpha(x) = \sum_{m=0}^\infty \frac{(-1)^m}{m! \Gamma (m + \alpha + 1)} {\left({ \frac{x}{2} }\right)}^{2m + \alpha} \text {，行内公式示例} $
```

$$ J_\alpha(x) = \sum_{m=0}^\infty \frac{(-1)^m}{m! \Gamma (m + \alpha + 1)} {\left({ \frac{x}{2} }\right)}^{2m + \alpha} \text {，独立公式示例} $$

```
$$ J_\alpha(x) = \sum_{m=0}^\infty \frac{(-1)^m}{m! \Gamma (m + \alpha + 1)} {\left({ \frac{x}{2} }\right)}^{2m + \alpha} \text {，独立公式示例} $$
```

$$ x^{y^z}=(1+{\rm e}^x)^{-2xy^w} $$

```
$$ x^{y^z}=(1+{\rm e}^x)^{-2xy^w} $$
```

$$ \sideset{^1_2}{^3_4}\bigotimes $$

```
$$ \sideset{^1_2}{^3_4}\bigotimes $$
```

输入分数:

通常使用 `\frac {分子} {分母}` 命令产生一个分数，分数可嵌套。
 便捷情况可直接输入 `\frac ab` 来快速生成一个分数。
 如果分式很复杂，亦可使用 `分子 \over 分母` 命令，此时分数仅有一层。

$$\frac{a-1}{b-1} \quad and \quad {a+1\over b+1}$$

```
$$\frac{a-1}{b-1} \quad and \quad {a+1\over b+1}$$
```
输入开方

$$\sqrt{2} \quad and \quad \sqrt[n]{3}$$

```
$$\sqrt{2} \quad and \quad \sqrt[n]{3}$$
```

输入省略号：

$$f(x_1,x_2,\underbrace{\ldots}_{\rm ldots} ,x_n) = x_1^2 + x_2^2 + \underbrace{\cdots}_{\rm cdots} + x_n^2$$

$$f(x_1,x_2,\underbrace{\ldots}_{\rm ldots} ,x_n) = x_1^2 + x_2^2 + \underbrace{\cdots}_{\rm cdots} + x_n^2$$

输入矢量：

$$\vec{a} \cdot \vec{b}=0$$

```
$$\vec{a} \cdot \vec{b}=0$$
```

$$\overleftarrow{xy} \quad and \quad \overleftrightarrow{xy} \quad and \quad \overrightarrow{xy}$$

```
$$\overleftarrow{xy} \quad and \quad \overleftrightarrow{xy} \quad and \quad \overrightarrow{xy}$$
```

输入积分：

$$\int_0^1 {x^2} \,{\rm d}x$$

```
$$\int_0^1 {x^2} \,{\rm d}x$$
```

