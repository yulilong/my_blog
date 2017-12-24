* **input属性输入限制长度，背景问题提示** 

```
<input  maxlength="20"> //最多输入20个字符
<input  placeholder="输入长度最大200"> //背景文字提示效果
# 对HTML5的placeholder属性支持的浏览器有谷歌浏览器、火狐浏览器、Safari、Opera，还有IE10+。
# CSS3里有相应的通用的对Placeholder提示信息美化的方法。你可以设置提示信息文字的颜色，透明度，背景色等。
# 为了最大化的兼容所有浏览器，给CSS里的placeholder属性添加浏览器引擎前缀还是有必要的。
# - 谷歌浏览器(Webkit): ::-webkit-input-placeholder pseudo-element;
# - IE10: :-ms-input-placeholder pseudo-class;
# - 火狐浏览器(Gecko18-): :-moz-placeholder pseudo-class;
# - 火狐浏览器(Gecko19+): ::-moz-placeholder pseudo-element;
# - Opera(Presto): 无。

```

| 标题1 | 标题2|
| :------| -------|
| 苹果 | 香蕉  |