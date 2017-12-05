[![License](https://img.shields.io/cocoapods/l/YZAppSDK.svg?style=flat)][CocoaPods] [![Platform][platform]][CocoaPods] [![Pod Version][version]][CocoaPods]

<p>
<a href="https://github.com/youzan/"><img alt="有赞logo" width="36px" src="https://img.yzcdn.cn/public_files/2017/02/09/e84aa8cbbf7852688c86218c1f3bbf17.png" alt="youzan">
</p></a>

## 简介
有赞云AppSDK是为移动端应用打造的电商交易系统，通过一个SDK便可以在APP内集成有赞提供的整个交易服务。

有赞AppSDK提供两种: 基础版SDK(BaseSDK)和原生版SDK(NativeSDK),客户端根据需求选择两者之一接入即可。

两者区别在于:
基础版SDK基于webview将有赞提供的HTML5页面嵌入到App。我们将在后续不断优化基础版。
原生版SDK在基础SDK之上提供了部分页面的原生实现。

可根据您实际业务中对页面的要求, 选择其中一种客户端产品接入。

##  安装
### 通过 CocoaPods 安装

 1. 在你的 Podfile 文件中添加  `pod 'YZAppSDK'` 
 2. 在命令行中运行 `pod install` 或 `pod update`.

### 手动导入

 1. 下载最新的 Release 版本。
 2. 将 `YZBaseSDK` 文件夹中的内容添加到你的 Xcode 工程中。

## 文档
https://github.com/youzan/YouzanMobileSDK-iOS/wiki

## License
[MIT][LICENSE]

[LICENSE]: https://zh.wikipedia.org/wiki/MIT%E8%A8%B1%E5%8F%AF%E8%AD%89

[CocoaPods]: http://cocoapods.org/pods/YZAppSDK
[version]: https://img.shields.io/cocoapods/v/YZAppSDK.svg?style=flat
[platform]: https://img.shields.io/cocoapods/p/YZAppSDK.svg?style=flat
