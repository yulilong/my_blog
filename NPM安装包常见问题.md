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

   后来查看安装源是淘宝的，换源可以解决这个问题：

   设置npmjs的源(可能需要VPN)，如果https不行就换成http的。

   ```
   // 查看安装源
   npm config get registry 	
   
   // 设置npm自己的源
   npm config set registry https://registry.npmjs.org/
   npm config set registry http://registry.npmjs.org/
   
   // 设置为淘宝源
   npm config set registry https://registry.npm.taobao.org/
   npm config set registry http://registry.npm.taobao.org/
   
   ```

   这个问题有的时候会发生，有时没问题，看人品了。

   还有一种情况，使用淘宝源： 使用公司网络安装失败，但是使用自己网络则安装成功。

