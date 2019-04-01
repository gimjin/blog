---
title: rem和px单位的区别
date: 2019-03-29 14:41:42
tags: rem, px, css, 响应式, viewport, meta
---

# 用户体验

软硬件技术的高速发展成就了很多高分辨率的产品，这些产品给人带来了更加细腻的视觉体验，但同时带来了越来越小的界面。

高分辨率带来的细腻的视觉体验，不同设备屏幕中内容尺寸一致的体验，才是我们真正需要的。

{% asset_img diff.jpg diff %}

# px是绝对单位吗？

px是分辨率的单位，所以我们首先要了解有哪些分辨率。

* 物理分辨率：硬件实际分辨率，比如led屏幕种的每个发光点，相对于机器的绝对单位。
* 系统分辨率：操作系统设置的分辨率
* **视觉分辨率**：使用屏幕尺寸、物理分辨率、系统分辨率算出来的分辨率。16px的文字在不同尺寸显示器和系统分辨率的设备中成像尺寸是一致，很像cm、inch等单位。

| 设备 | 像素比 DPR | 物理分辨率 | 系统分辨率 | **视觉分辨率** |
| --- | --- | --- | --- | --- |
| Mackbook Pro | @2x | 2560 x 1600 | 1280 x 800  | 1280 x 800 |
| iPhone X | @3x | 2436 x 1125 | 2436 x 1125 | 812 x 375 |
| Android Pixel 2 | @2.62x | 1920 x 1080 | 1920 x 1080 | 731 x 411 |
[查看设备视觉分辨率](http://viewportsizes.com/mine/)

{% asset_img DPR.jpg DPR %}

# 开启视觉分辨率

viewport就是w3c为你准备的钥匙，在head中加上如下meta代码。

```html
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  ...
  </head>
```

### px完全能做响应式App

###### Bootstrap 是用px来做屏幕区分

```css
/* breakpoint-sm */
@media (min-width: 576px) {
  body { background: red; }
}
/* breakpoint-md */
@media (min-width: 768px) {
  body { background: green; }
}
/* breakpoint-lg */
@media (min-width: 992px) {
  body { background: orange; }
}
```

###### ElementUI 是完全使用px，并没有使用rem
ElementUI做响应式App非常优秀。

> rem单位和响应式没什么关系！

# 被妖魔化的rem

有很多的老文章用flexible.js或者rem.js等包来完成rem自适应功能，甚至有很多人基于此类思想写了各种各样的奇怪的包。
[amfe-flexible](https://github.com/amfe/lib-flexible)是Alibaba MFE团队在2016年flexible自适应布局中使用了rem单位，并且对html标签中的font-size做了动态计算。当时这种做法很超前非常不错，但是在2018年1月宣布建议用户使用viewport方案。
但是百度上搜索rem时依然出现很多flexible.js方案误导。

# 真实的rem

w3c描述rem为：font size of the root element. (html标签font-size = 1rem)

```html
<p>inherit root element font-size</p>
<p class="is-rem">font-size rem</p>
<p class="is-px">font-size px</p>
<style>
.is-rem { font-size: 1rem;}
.is-px { font-size: 16px; }
</style>
```
以上代码在Chrome浏览器中文字大小是一致的，但是在浏览器设置界面把字号改成"特大"后rem设置的字体变得很大、px设置的字体则没有变化。

###### 再谈用户体验
在欧美国家非常重视用户体验，残障人士的用户体验也是非常重视也有法规来保护弱势群体。
比如：tts(text to speech)是为视力缺陷者提供的文字转语音的服务，浏览器设置中的字号也是为视力缺陷者提供的非常重要的服务。

**"字号"设置就是根据视力缺陷级别科学的更改了root element的font-size**
然而为了写代码方便设置了html的font-size，这岂不是对视力残障人士的一种不负责任？

{% asset_img mangren.jpg mangren %}

> 如果只是为了动态修改文字大小建议rem + em 或者 px + em。

# rem和px建议

* 使用viewport
* 包括字体以内的大部分情况下请使用rem单位，布局和细线使用px单位

{% asset_img user-fe-be.png user-fe-be %}

