//
//  ViewController.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/21.
//  Copyright © 2018年 Chris. All rights reserved.
//

import UIKit
import WebKit
import Toaster

class ViewController: UIViewController {
    
    var webView: WKWebView? = nil
//    var controlModel: Model = Model()
    var urlPage: String = Constants.HOMEL_WEB_URL
    
    override func viewDidLoad() {
        super.viewDidLoad()
         Toast(text: "Internet server error2").show()
        // Do any additional setup after loading the view, typically from a nib.
        let contentController = WKUserContentController();
//        contentController.add(self, name: Constants.IOS_PARAMETER_FOR_JAVASCRIPT)
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.websiteDataStore = WKWebsiteDataStore.default()
        self.webView = WKWebView(
            frame: CGRect(x:0, y:20, width: self.view.frame.width, height:self.view.frame.height-20),
            configuration: config
        )
        self.webView?.scrollView.isScrollEnabled = false
        self.view.addSubview(self.webView!)
        
//        controlModel.setViewController(ViewController: self)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

