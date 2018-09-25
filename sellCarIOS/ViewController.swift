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

class ViewController: UIViewController , WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name == Constants.IOS_PARAMETER_FOR_JAVASCRIPT) {
            let funcMsgDic = StringProcess.convertToDictionary(text: message.body as! String)
            let msg = StringProcess.convertToDictionary(text: funcMsgDic?["msg"] as! String)
            print("JavaScript is sending a message \(String(describing: funcMsgDic))")
            controlModel.scriptCallbackHandler(funcMsgDic:funcMsgDic!, msg: msg!)
        }
    }
    
    
    var webView: WKWebView? = nil
    var controlModel: Model = Model()
    var urlPage: String = Constants.HOME_WEB_URL
    
    override func loadView() {
        super.loadView()
        
        let contentController = WKUserContentController();
        contentController.add(self , name: Constants.IOS_PARAMETER_FOR_JAVASCRIPT)
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.websiteDataStore = WKWebsiteDataStore.default()
        self.webView = WKWebView(
            frame: CGRect(x:0, y:20, width: self.view.frame.width, height:self.view.frame.height-20),
            configuration: config
        )
        self.webView?.scrollView.isScrollEnabled = false
        self.view.addSubview(self.webView!)
        
        controlModel.setViewController(ViewController: self)
        print("asdasd")
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         Toast(text: "Internet server error2").show()
        // Do any additional setup after loading the view, typically from a nib.
        controlModel.changePage(webView: webView!, page: Constants.HOME_PAGE_NAME)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if (self.webView?.estimatedProgress == 1){
                print("loaded")
                if(self.urlPage == "login"){
                }else if(self.urlPage == "config"){
                    //self.systemSocket()
                }else if(self.urlPage == "home"){
                }
            }
        }
    }

}

