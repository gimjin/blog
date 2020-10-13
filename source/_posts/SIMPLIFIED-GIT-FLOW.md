---
title: Understanding the GitLab flow
date: 2020-10-13 17:45:21
tags: git flow, github flow, gitlab flow, git
---

<p>{% asset_img github-flow-create-branch.png github-flow-create-branch %}</p>

## Create a branch

当您从事一个项目时，您将拥有许多不同的 features 或 ideas（任何给定的时间内 - 其中一些准备就绪，而另一些则没有）。分支可帮助您管理此工作流程。

当您在项目中创建分支时，就是在创建尝试新想法的环境。您在分支上所做的更改不会影响主分支，因此您**可以自由地进行试验和提交更改**，因为您可以知道自己的分支不会被合并， **直到 Maintainer 审核为止，这是安全** 的。

#### ProTip

分支是 Git 中的核心概念，整个 GitLab flow 都以此为基础。 **只有一条规则：LTS(Long Time Support) 分支中的任何内容始终都是可部署** 的。

因此，在处理 feature 或 fix 时，要从 LTS branch 之外创建新分支是非常重要的。 您的分支名称应该是描述性的（例如，refactor-authentication, user-content-cache-key, make-retina-avatars），以便其他人可以看到正在处理的内容。

---

<p>{% asset_img github-flow-add-commits.png github-flow-add-commits %}</p>

## Add commits

创建分支后，就该开始进行更改了。 无论何时添加，编辑或删除文件，都在进行 commit，并将其添加到分支中。 添加 commit 的过程会跟踪您在功能分支上工作的进度。

Commits 还会为您的工作创建一个透明的历史记录，其他人可以遵循该历史记录来了解您的工作以及原因。 每个提交都有一个关联的提交消息，该消息是说明为什么进行特定更改的说明。此外，每次提交都被视为一个单独的变更单元。 如果发现错误或决定朝其他方向前进，则可以回滚更改。

#### ProTip

Commit messages 非常重要，特别是因为 Git 会跟踪您的更改，然后将它们显示为提交（一旦将其推送到服务器）。 通过编写清晰的 commit messages，您可以使其他人更容易跟进并提供反馈。

> Nodejs 研发人员建议使用 [Commitlint](https://commitlint.js.org) 和 [Husky](https://typicode.github.io/husky) 来管理和检查提交消息。

---

<p>{% asset_img github-flow-merge-request.png github-flow-merge-request %}</p>

## Open a Merge Request

Merge Requests 启动有关提交的讨论。 因为它们与基础 Git 存储库紧密集成，所以任何人都可以确切地看到接受您的请求将被合并的更改。

#### ProTip

如果您使用的是 Fork([创建 Fork](https://docs.gitlab.com/ee/user/project/repository/forking_workflow.html#creating-a-fork))，则 Merge Requests 提供了一种通知项目维护者您希望他们考虑的更改的方法。如果您使用的是 Shared Repository，则可在合并到主分支之前帮助您代码审查和有关建议更改的讨论。

---

<p>{% asset_img github-flow-discuss.png github-flow-discuss %}</p>

## Discuss and review your code

打开 Merge Request 后，审阅您的 changes 的 Maintainer 或 Team 可能会有疑问或意见。 可能是编码风格与项目指南不符，更改缺少单元测试，或者看起来一切都很好，并且道具井井有条。Merge Requests 旨在鼓励和捕获这种类型的对话。

您还可以根据有关提交的讨论和反馈中直接把修改推送到分支。如果有人评论您忘记做某事，或者代码中有错误，您可以在 branch 中对其进行 fix，并 push 更改。GitLab 将在统一的 Merge Request 视图中显示您的新提交以及您可能收到的任何其他反馈。

#### ProTip

Merge Requests 注释使用 Markdown 编写，因此您可以嵌入图像和表情符号，使用预格式化的文本块以及其他轻量级格式。

---

<p>{% asset_img github-flow-deploy.png github-flow-deploy %}</p>

## Deploy

借助 GitLab，您可以从 Branch 进行部署，以在正式生产之前进行最终测试。

一旦审查了 Merge Requests 并且 Branch 通过了测试，就可以部署在生产中进行验证。 如果分支引起问题，当前 LTS branch 回滚后部署生产环境。

不同的团队可能有不同的部署策略。 对于某些人来说，最好将其部署到专门配置的测试环境中。对于其他人，基于工作流程直接部署到生产可能是更好的选择。

#### ProTip

测试环境中通过测试，需要升级版本号，例如：[Standard Version](https://github.com/conventional-changelog/standard-version) 可以帮助前端团队自动完成 升级版本号、创建 Tag、更新 CHANGELOG.md 等工作。

---

<p>{% asset_img github-flow-merge.png github-flow-merge %}</p>

## Merge

现在您的 Changes 已在生产环境中得到验证，是时候将您的代码合并到 LTS Branch 中了。为了保证 LTS Branch 可靠性和扩展性 **只有 Maintainer 才有权限 Merge** 。

合并后，Merge Requests 将保留代码历史更改的记录。 因为它们是可搜索的，可以让任何人回到过去，了解做出决定的原因和方式。

#### ProTip

GitLab Flavored Markdown 可以识别与 GitLab 相关的[参考资料](https://docs.gitlab.com/ee/user/markdown.html#special-gitlab-references)。 例如，您可以引用项目中的问题，提交，团队成员，甚至整个团队。 GFM会将引用转换为链接，以便您可以在它们之间进行导航。使用＃123 引用问题将把输出格式化为带有文本 ＃123 的发布编号123的链接。

---

## C2D models

C2D 全称是 Coding To Deploy，从编码到部署生产环境过程中使用 Git 模式。看似复杂的 Git 使用方式归纳一下仅有以下 3 种模式。

<p>{% asset_img serial.png serial %}</p>

客户单一 或 者产品型软件开发团队往往会使用串行模式。每一次开发完发布正式版本后才会继续迭代。

<p>{% asset_img parallel.png parallel %}</p>

多客户 或 交付型软件开发团队会使用并行模式，其特点是同时有多个团队/人同时开发多个需求。例如：正在开发上海客户需求过程中深圳客户的需求要同步开发，在不同的时间点进行交付。
LTS branch 上永远都是稳定全量功能，所以深圳发布版本是包含上海发布的版本。

<p>{% asset_img mixed.png mixed %}</p>

混合模式和并行模式唯一的区别是从 LTS branch merge 或者 cherrypick 到当前分支。例如：接着上面的例子，如果深圳客户不想要上海的某个功能时需要给此功能增加开关配置，所以需要从已被合并完成上海分支的 LTS Branch merge 到深圳研发分支上加入开关配置。

## Reference
- https://guides.github.com/introduction/flow/
- https://guides.github.com/pdfs/githubflow-online.pdf
- https://docs.gitlab.com/ee/university/training/gitlab_flow.html
- https://docs.gitlab.com/ee/user/markdown.html#gitlab-flavored-markdown-gfm
- https://nvie.com/posts/a-successful-git-branching-model/
