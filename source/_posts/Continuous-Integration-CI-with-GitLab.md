---
title: CI/CD 关键知识
date: 2020-10-21 15:03:00
tags:
---

## 1) Continuous integration is built-in

<p>{% asset_img ci-cd-test-deploy-illustration_2x.png ci-cd-test-deploy-illustration_2x %}</p>

**持续集成(CI)**致力于将您的团队提供的代码集成到共 Shared Repository 中。开发人员在合并请求中共享新代码。在合并已修改代码之前，该请求触发构建 Pipline，构建，测试和验证新代码。

通过结构化的部署 Pipline **持续交付(CD)**，确保将 CI 验证的代码交付到您的应用程序。

CI 和 CD 一起帮助您的团队从客户和参与人更快的获得交付反馈。CI 可帮助您在开发周期的早期发现并消除错误，而 CD 可确保仅将经过验证的代码发送到您的应用程序。

CI和CD必须共同努力以帮助您的团队快速有效的构建，这对于全面优化的软件开发至关重要。

---

## 2) Why your team needs a CI/CD workflow

#### CD/CI workflow

<p>{% asset_img cicd_pipeline_infograph.png cicd_pipeline_infograph %}</p>

#### Continuous integration (CI)

- **尽快发现错误：**在解决问题时代码在开发人员的脑中十分新鲜
- **减少集成问题：**较小的问题更易于消化和解决
- **避免复合问题：**使团队开发更快，更自信

#### Continuous delivery (CD)

- **确保每个更改都是可发布的：**在完成之前测试所有内容，包括部署
- **降低每次发布的风险：**使发布“无聊”
- **更加频繁地实现价值：**可靠的部署意味着更多的发布
- **紧密的客户反馈循环：**快速而频繁的获得客户对变更的反馈

###### ProTip

部署有多种方式：比如蓝绿部署、金丝雀部署等。

---

## 3) Remember Infrastructure as Code

#### 基础设施即代码有四项关键原则:

- **再生性：**环境中的任何元素可以轻松复制。
- **一致性：**无论何时，创建的环境各个元素的配置是完全相同的。
- **快速反馈：**能够频繁、容易地进行变更，并快速知道变更是否正确。
- **可见性：**所有对环境的变更应该容易理解、**可审计、受版本控制**。

#### 基础设施即代码的目标是：

- **标准化：**以代码来定义环境，实现开发环境、测试环境、生产环境的标准化。
- **自动化：**以自动化工具来驱动代码准备环境。包括创建环境、更新环境以及销毁环境。
- **可视化：**以监控来可视化环境信息。环境当前状态可视、**环境变更历史可视、可追溯**。

---

## 4) Reference
- https://about.gitlab.com/stages-devops-lifecycle/continuous-integration/
- https://infrastructure-as-code.com/book/
- https://www.jianshu.com/p/89f681694326?from=timeline&isappinstalled=0
