[![License](https://img.shields.io/cocoapods/l/YZAppSDK.svg?style=flat)][CocoaPods] [![Platform][platform]][CocoaPods] [![Pod Version][version]][CocoaPods]

<p>
<a href="https://github.com/youzan/"><img alt="有赞logo" width="36px" src="https://img.yzcdn.cn/public_files/2017/02/09/e84aa8cbbf7852688c86218c1f3bbf17.png" alt="youzan">
</p></a>

## 简介
为了满足移动应用搭建商城的需求，有赞云将有赞积累多年的电商交易系统开放，移动开发者**通过一个 SDK 便可以在 App 内集成有赞提供的整个交易服务**，除了享受完善的商城功能、丰富的营销玩法，更有有赞强劲的技术及服务作保障，实现低成本、高效率、强融合的移动电商方案，快速获得 App 流量的商业化变现。

有赞 AppSDK 基于 WebView 将有赞提供的 HTML5 页面嵌入到 App 中，基于此提供帐号打通、资产合并、客服 IM、多渠道支付、营销能力开放等 App 应用特色功能，更拥有媲美原生页面的性能。该方案由于接入极速、功能完善、性能稳定，现已被大多数电商 App 开发者采用。

对接过程中有任何问题、需求、建议，或是想了解 AppSDK 更多玩法，欢迎联系有赞青溪，youzan_qingxi（微信）。

##  安装
### 通过 CocoaPods 安装

 1. 在你的 Podfile 文件中添加  `pod 'YZAppSDK'` 
 2. 在命令行中运行 `pod install` 或 `pod update`.

### 手动导入

 1. 下载[最新的 Release 版本](https://github.com/youzan/YouzanMobileSDK-iOS/releases)。
 2. 将 `YZBaseSDK` 文件夹中的内容添加到你的 Xcode 工程中。

## Demo 注意事项

- 使用 demo 前，需要先运行 `pod install`。
- 填写 YZDemoConfig.h 中的 CLIENT_ID 和 CLIENT_SECRET 来使用 Demo.
- iOS BundleID须与有赞云应用后台的安全码id保持一致，如图（左：XCode截图 右：有赞云后台截图）
![image](https://github.com/user-attachments/assets/ce441e48-154f-4da1-ab9b-79f247ab436a)


## 文档
https://github.com/youzan/YouzanMobileSDK-iOS/wiki

## License
[MIT][LICENSE]

[LICENSE]: https://zh.wikipedia.org/wiki/MIT%E8%A8%B1%E5%8F%AF%E8%AD%89

[CocoaPods]: http://cocoapods.org/pods/YZAppSDK
[version]: https://img.shields.io/cocoapods/v/YZAppSDK.svg?style=flat
[platform]: https://img.shields.io/cocoapods/p/YZAppSDK.svg?style=flat


