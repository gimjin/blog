---
title: code lint 配置与使用
date: 2019-03-25 10:09:05
tags:
---

F2E代码检查标准
---

[点击查看](https://www.icloud.com/keynote/0oBgKUHk13Cm-5D-5ccvduP5A#F2E%E4%BB%A3%E7%A0%81%E6%A3%80%E6%9F%A5)

部署与配置
---

### 安装

```bash
# eslint
npm i -D eslint eslint-plugin-import eslint-plugin-node eslint-plugin-promise
# eslint 解析器
npm i -D babel-eslint vue-eslint-parser
# eslint 规范
npm i -D eslint-config-canonical-jsdoc eslint-config-standard eslint-plugin-standard eslint-plugin-vue
# stylelint for css & scss, and autoprefixer
npm i -D stylelint stylelint-scss stylelint-config-recommended-scss autoprefixer
# git 相关工具
npm i -D husky lint-staged imagemin-lint-staged
# webpack loader
npm i -D eslint-loader postcss-loader
```

### 目录结构

My Project
|- .huskyrc.js
|- .editorconfig
|- .eslintrc.js
|- .stylelintrc.js
|- lint-staged.config.js
|- postcss.config.js
|- package.json

### 配置文件

```javascript
// .huskyrc.js
module.exports = {
  hooks: {
    'pre-commit': 'lint-staged'
  }
}
```

```javascript
// .editorconfig，Atom/VS Code/Webstrom/Sublime text都有相应的插件读取此文件
root = true
[*]
charset = utf-8
indent_style = space
indent_size = 2
end_of_line = lf
insert_final_newline = true
max_line_length = off
```

```javascript
//.eslintrc.js
module.exports = {
  parser: 'vue-eslint-parser',
  parserOptions: {
      parser: 'babel-eslint'
  },
  extends: [
    'plugin:vue/recommended',
    'standard',
    'canonical-jsdoc'
  ],
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-alert': process.env.NODE_ENV === 'production' ? 'error' : 'off'
  },
  env: {
    browser: true,
    es6: true
  }
}
```

```javascript
// .stylelintrc.js
module.exports = {
  extends: [
    'stylelint-config-recommended-scss'
  ]
}
```

```javascript
// lint-staged.config.js
module.exports = {
  linters: {
    '*.{js,vue}': ['eslint --fix', 'git add'],
    '*.{vue,htm,html,css,sss,less,scss,sass}': ['stylelint --fix', 'git add'],
    '*.{png,jpeg,jpg,gif,svg}': ['imagemin-lint-staged', 'git add']
  },
  ignore: ['*.min.{js,css}']
}
```

```javascript
// postcss.config.js
module.exports = {
  plugins: [
    require('stylelint'),
    require('autoprefixer')
  ]
}
```

```javascript
// package.json
const prod = process.env.NODE_ENV === 'production'
...
rules: [
  {
    enforce: 'pre',
    test: /\.(js|vue)$/,
    loader: 'eslint-loader'
  },
  {
    test: /\.css$/,
    use: [
      'vue-style-loader',
      'css-loader',
      'postcss-loader'
    ]
  },
  {
    test: /\.scss$/,
    use: [
      'vue-style-loader',
      'css-loader',
      'sass-loader',
      'postcss-loader'
    ]
  }
]
```

### 完整示例

https://github.com/kimseongrim/hivue/tree/dev
