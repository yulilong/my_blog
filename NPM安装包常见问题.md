### 1. 使用淘宝源安装包出错

1. 使用npm安装`webpack`包的时候，发生了错误，

   ```
   npm install webpack --save-dev
   // 发生如下错误
   events.js:160░░░░░░⸩ ⠸ extract:repeat-string: sill extract remove-trailing-sepa
         throw er; // Unhandled 'error' event
         ^
   Error: write after end
       at writeAfterEnd (_stream_writable.js:193:12)
       at PassThrough.Writable.write (_stream_writable.js:240:5)
       at PassThrough.Writable.end (_stream_writable.js:477:10)
   ```

   后来查看安装源是淘宝的，后设置自己的源，但是此时由于被墙无法安装，架上梯子后顺利安装，没有报错

   ```
   // 查看安装源
   npm config get registry 	
   https://registry.npm.taobao.org/

   // 设置npm自己的源
   npm config set registry https://registry.npmjs.org/
   ```

   这个问题有的时候会发生，有时没问题，看人品了。

