//
//  SwiftWebViewController.swift
//  YZBaseDemo
//
//  Created by Pan on 2018/7/24.
//  Copyright © 2018年 Youzan. All rights reserved.
//

import UIKit

class SwiftWebViewController: UIViewController {

    private var webView = YZWebView(webViewType: .wkWebView)
    var urlString = "https://h5.youzan.com/v2/showcase/homepage?alias=lUWblj8NNI"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = self.view.frame
        webView.delegate = self
        webView.noticeDelegate = self
        self.view.addSubview(webView)
        
        if !urlString.isEmpty {
            let url = URL(string: self.urlString)!
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}

extension SwiftWebViewController: YZWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: YZWebViewProtocol) {
        print(#function)
    }
    
    func webViewDidFinishLoad(_ webView: YZWebViewProtocol) {
        print(#function)
    }
}

extension SwiftWebViewController: YZWebViewNoticeDelegate {
    func webView(_ webView: YZWebViewProtocol, didReceive notice: YZNotice) {
        print(notice)
    }
}
