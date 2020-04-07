---
title: Vuejs 应用配置 基路径
date: 2019-07-06 13:03:21
tags: Vuejs, base URL, webpack, publicPath, 基路径
---

微前端有时需要地址上加上下文来区别应用，或者服务器资源有限在一个端口启动多个应用。
> 例如：http://ixiaer.com/news/ ， http://ixiaer.com/game/

---
### 第1步，Vue Router

SPA 应用的 URL 并不是传统的，而是 Vue Router 模拟出来的。所以我们首先要修改 Vue Router 的配置。

```javascript
new VueRouter({
  base: '/news/', // <= 配置
  routes: [{
    path: '/',
    component: News
  }]
})
```

| 对比存在的问题 | '/' | '/news/' | '/game/' |
| --- | --- | --- |
| 访问网址 | http://ixiaer.com/ | http://ixiaer.com/news/ | http://ixiaer.com/game/ |
| 图片资源 | /logo.png | /logo.png | /logo.png |
| 其他资源 | /*.{css,js,XHR} | /*.{css,js,XHR} | /*.{css,js,XHR} |

仅设置 base URL 时，只是在网址上看上去达到了效果，但代码内部的资源地址并不是预期的 /news/logo.png。
这样会导致启动服务后 logo.png 提示 404 错误，因为根目录中根本找不到 logo.png。

---
### 第2步，Webpack

基于上面的问题，我们需要配置 Webpack 解决资源访问的问题。

```javascript
output: {
  path: path.resolve(__dirname, 'dist'),
  publicPath: '/news/' // <= 配置
}
```

---
### 第3步，webpack-dev-server

如果是用 webpack-dev-server 中调试代码，需要修改如下配置才能正常访问。

```javascript
const history = require('connect-history-api-fallback')

devServer: {
  publicPath: '/news/', // <= 配置
  before (app) {
    // Only vue-router history mode setting
    app.use(history({
      index: '/news/' + 'index.html' // <= 配置
    }))
  }
}
```

---
### 完整案例代码 - {% asset_link vuejs-base-URL-20190706.zip 点击下载 %}

```bash
$ npm install
$ npm run serve
$ npm run build
```
