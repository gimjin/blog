---
title: webpack编译原理
date: 2019-04-04 10:15:00
tags:
- webpack
- vue
- react
- javascript
- scss
- css
- postcss
- css-loader
- style-loader
- url-loader
- file-loader
---

# 能说明Webpack的一张图

{% asset_img webpack.png webpack %}

本质上，webpack 是一个现代 JavaScript 应用程序的静态模块打包器(module bundler)。当 webpack 处理应用程序时，它会递归地构建一个依赖关系图(dependency graph)，其中包含应用程序需要的每个模块，然后将所有这些模块打包成一个或多个 bundle。

首先 {% asset_link webpack-tutorial-20190409.zip 点击下载课件 %}

# 最简单的Webpack配置

```bash
$ git checkout 0-master
$ npm i -D webpack webpack-cli webpack-dev-server
$ npx webpack-dev-server --open
```

从 webpack v4.0.0 开始，可以不用引入一个配置文件。然而，webpack 仍然还是高度可配置的。

# 打包 .js

```bash
$ git checkout 1-simple-import
$ npx webpack # dist/main.js 会发现两个文件组合在一起
$ npx webpack-dev-server --open # npm run serve 相当于此命令的快捷方式
```

**作业：**
类似ES7这样的js高级语法在不同浏览器的兼容性是不同的，如何配置webpack来很好的控制浏览器兼容性。

# 打包 .png

```bash
$ git checkout 2-url-loader
$ npm i -D url-loader file-loader
$ npm run build # dist/main.js 中图片已经变成了base64字符串，被js写入html的<img src="base64...">
$ npm run serve
```

**作业：**
main.js中icon.png改成icon.jpg，运行正常。

> webpack载入文件都需要对应的loader！

# 打包 .css

```bash
$ git checkout 3-css-loader
$ npm i -D css-loader style-loader
$ npm run build
$ npm run serve
```

1. css-loader加载，export css文件的字符串
2. style-loader加载css字符串用style标签写入html
3. url-loader加载css内的png图片

**体验style-loader**
```diff
@ main.js
- document.write(`<style type="text/css">${style}</style>`)

@ webpack.config.js
+ 'style-loader'
```

**作业**
上面都是把css字符串写入html中，请使用mini-css-extract-plugin生成.css文件引入到html。

# 打包 .vue

```bash
$ git checkout 4-vue-loader
$ npm i -D vue-loader vue-template-compiler
$ npm run serve
```

1. vue-loader 加载.vue
  * template和script标签被转译成 [createElement渲染函数](https://cn.vuejs.org/v2/guide/render-function.html#createElement-参数)
  * style标签生成.css
2. css-loader 处理 .css 文件
3. url-loader 处理 .png 文件

**体验createElement渲染函数**
```diff
- import App from './App.vue'
- new Vue({
-   el: '#app',
-   render: function (h) {
-     return h(App)
-   }
- })

+ import './style.css'
+ new Vue({
+   el: '#app',
+   render: function (createElement) {
+     return createElement('div', '你好世界。')
+   }
+ })
```

**作业：**
现在已经知道.vue在webpack中被转译成createElement渲染函数被浏览器执行。
请使用 [jsx](https://cn.vuejs.org/v2/guide/render-function.html#JSX) 编写vue单文件组件，jsx比vue文件更接近javascript真实的语法对技术领悟会更深，并且技术栈会增加React可以随意使用React或Vue来做项目。

# 领悟Webpack

```bash
$ git checkout 5-vue-react
$ npm i react react-dom
$ npm i -D @babel/core @babel/preset-react babel-loader
$ npm run serve
```
**知识点**
* vue和react两个webpack入口
* babel-loader加载.js文件并解析jsx语法
* [点击下载](https://github.com/kimseongrim/hivue) 完整的Webpack配置工程提供给大家冲浪

**作业**
把react app嵌入vue app中，当子组件使用。

# 最后

**诚邀加入《前端兴趣小组》 课题是《Web产品模块化》**

做研发就如打游戏，会玩Dota的人玩王者荣耀很容易就能上手。
只要掌握研发中的规则学习之路会四通发达！

{% asset_img user-fe-be.png user-fe-be %}
