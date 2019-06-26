---
title: 什么是 Viewport
date: 2019-06-24 18:11:59
tags: viewport, meta, css, px
---

- [MDN](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/meta)解释：它提供有关视口初始大小的提示，仅供移动设备使用。
- 我的解释：<u>Viewport将CSS中px单位从描述 **设备像素** 转成 **视觉尺寸**。</u>

---
### 🤔 理论求证
把下面一段代码运行在两个设备上显示做对比。

```html
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<style>
div {
  width: 4px;
  height: 4px;
  background-color: blue;
  display: block;
}
</style>
<div></div>
```

| 设备 | 屏幕尺寸 | 像素比 | 设备像素 |
| --- | --- | --- | --- |
| 左侧设备 | 2 x 2 cm | 2 DPR | 8 x 8 |
| 右侧设备 | 2 x 2 cm | 1 DPR | 4 x 4 |

{% asset_img viewport-on.png viewport-on %}

> <u>css中4px已经不是描述设备像素Point，而是描述类似物理尺寸的**视觉尺寸**4px ≈ 1cm</u>

---
### 🤓 实际求证
##### 用手机访问并点击下面两个链接，或在PC Chrome开发者工具中开启模拟设备选项查看效果。
- <a href="{% asset_path viewport-on.demo.html %}" target="_blank">Viewport On</a>
- <a href="{% asset_path viewport-off.demo.html %}" target="_blank">Viewport Off</a>

##### 对比效果
{% asset_img chrome-diff.png chrome-diff %}

> 绝大部分Phone在关闭Viewport时视觉尺寸会变成 980px。

---
### 👥 Viewport存在的意义

###### 问题：
- iPhoneX分辨率是2436×1125(px) 而普通PC是1920×1024甚至是1024×768(px)，而PC屏幕比iPhoneX大了好几倍，一个14px的文字在PC上显示正常、在iPhoneX上是不是缩小了好几倍基本看不到文字？
- 人的本能是在同一视距下看到的同一种物体尺寸应该是一样的。比如PC上的文字、UI尺寸与Phone上的应该是一样的。而能接受照片、视频等尺寸不同是一种对便携与本能之间的妥协。

伟大的工程师们就开始思考**如何能让屏幕中的内容，在任何设备中看起来差不多？**

> Viewport就是他们想出来的解决方案。

---
### 💎 它改变了我们

| 领域 | 之前 | 现在 |
| --- | --- | --- |
| 位图 | 对应容器宽高为100px的背景图用宽高100px的图片即可 | 需要 4种尺寸对应4个DPR |
| 图标 | 用雪碧图 | 用自适应大小的iconfont/svg |
| 设计师 | 设计师用位图设计 | 设计师用矢量图设计单位是视觉尺寸单位<br>输出时工具会生成 1x 2x 3x 4x尺寸的位图 |
| 兼容性 | 之前只想着浏览器兼容就好 | 还要思考兼容哪些尺寸&分辨率 |
| 单位 | px, em, % | px, rem, %, em, vw/vh/vmin/vmax, calc() |
| 布局 | float, flexbox | element/bootstrap/... layout |

> 未来是5G时代，任何东西都有可能携带屏幕变成设备。所以我们前端人应面向未来。
