---
title: Vuejs 应用配置 基路径
date: 2019-07-06 13:03:21
tags: Vuejs, base URL, webpack, publicPath, 基路径
---

> 有时因需要把多个应用整合在一起，或者服务器资源有限只能在一个端口启动多个应用。例如：http://ixiaer.com/app-one/，http://ixiaer.com/app-more/

---
### 第一步，Vue Router

SPA 应用的 URL 并不是传统的，而是 Vue Router 模拟出来的。所以我们首先要修改 Vue Router 的配置。

```javascript
new VueRouter({
  base: '/app-one/', // <= 配置
  routes: [{
    path: '/',
    component: Parent,
    children: [{
      path: 'child',
      component: Child)
    }]
  }]
})
```

###### 设置对比 & 存在的问题

|  | '/' | '/app-one/' |
| --- | --- | --- |
| 访问网址 | http://ixiaer.com/ | http://ixiaer.com/app-one/ |
| 图片资源 | /logo.png | /logo.png |
| 其他资源 | /*.{css,js,XHR} | /*.{css,js,XHR} |

仅设置 base URL 时，只是在网址上看上去达到了效果，但代码内部的资源地址并不是预期的 /app-one/logo.png。
这样会导致启动服务后 logo.png 提示 404 错误，因为根目录中根本没有 logo.png。

目录结构：
content-base
|- index.html
|- app-one
|- |- logo.png
|- app-more
|- |- logo.png

---
### 第二步，Webpack

基于上面的问题，我们需要配置 Webpack 解决资源访问的问题。

```javascript
output: {
  path: path.resolve(__dirname, 'dist'),
  publicPath: '/app-one/' // <= 配置
}
```

---
### 第三步，webpack-dev-server

如果是用 webpack-dev-server 中调试代码，需要修改如下配置才能正常访问。

```javascript
const history = require('connect-history-api-fallback')

devServer: {
  publicPath: '/app-one/', // <= 配置
  before (app) {
    // Only vue-router history mode setting
    app.use(history({
      index: '/app-one/' + 'index.html' // <= 配置
    }))
  }
}
```

---
### 完整案例代码

{% asset_link vuejs-base-URL-20190706.zip 点击下载 %}

```bash
$ npm install
$ npm run serve
$ npm run build
```



