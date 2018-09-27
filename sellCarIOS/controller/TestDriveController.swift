//
//  TestDriveController.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/22.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation
import WebKit

class TestDriveController: Controller{
    
    //    override init(webView: WKWebView, systemInfo: SystemInfoRole){
    //        super.init(webView: webView, systemInfo: systemInfo)
    //    }
    
    override init(webView: WKWebView, model:Model,urlRequest:URLRequest){
        super.init(webView: webView, model: model,urlRequest:urlRequest)
        print("----------urlRequest-----------")
        print(urlRequest)
        webView.load(urlRequest)
    }
    
    
    override func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        print("------child controller: test drive------")
//        let command = funcMsgDic[Constants.FUNCNAME] as! String
//        switch command {
//        case Constants.CHANGE_PAGE_COMMAND:
//            changePage(url:msg[Constants.URL] as!String)
//        default:
//            print("unknow command")
//        }
    }
    

    deinit {
        print("------end test drive controller---------")
    }
}
