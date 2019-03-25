---
title: commitlint & standard-version 配置与使用
date: 2019-03-25 09:48:41
tags:
---

F2E版本管理标准
---
[点击查看](https://www.icloud.com/keynote/0x4LpFsy0Kgpd46Nnyh0i-34Q#F2E_%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6)

部署与配置
---

### 安装

```bash
# commitlint
npm i -D @commitlint/config-conventional @commitlint/cli
# git hook 客户端
npm i -D husky
# 版本升级，自动编写changelog，自动打tag工具
npm i -D standard-version
# index.html 生成工具
npm i -D html-webpack-plugin
```

### 目录结构

My Project
|- public
| |- index.html
|- .huskyrc.js
|- commitlint.config.js
|- package.json
|- webpack.config.js

### 配置文件

```javascript
// .huskyrc.js
module.exports = {
  hooks: {
    'commit-msg': 'commitlint -E HUSKY_GIT_PARAMS'
  }
}
```

```javascript
// commitlint.config.js
module.exports = {
  extends: ['@commitlint/config-conventional']
}
```

```json
// package.json
"scripts": {
  "release": "standard-version",
}
```

```html
// index.html
<head>
  <meta name="version" content="<%= htmlWebpackPlugin.options.meta.version %>">
</head>
```

```javascript
// webpack.config.js
plugins: [
  new HtmlWebpackPlugin({
    template: 'public/index.html',
    meta: { version: process.env.npm_package_version }
  })
]
```

### Git message格式

type(scope?): subject

###### type解释
* build：构建相关
* ci：持续集成
* chore：零星工作
* docs：文档
* feat：功能
* fix：缺陷修复
* perf：性能
* refactor：重构
* revert：还原
* style：风格
* test：测试

###### 例如： 
fix(login): support sso login #1100

### CI构建

```bash
# install
npm install

# 1.0.0 > 1.0.1
npm run release
# 1.0.0 > 1.0.1-0
# npm run release -- --prerelease
# 1.0.0 > 1.0.1-alpha.0 ，alpha是自定义的可以写任意文字，比如：beta
# npm run release -- --prerelease alpha
# 1.0.0 > 1.1.0
# npm run release -- --release-as minor
# 1.0.0 > 2.0.0
# npm run release -- --release-as major

# push tag to remote
git push --follow-tags

# build
npm run build
```

### 示例项目

https://github.com/kimseongrim/hivue/tree/dev
