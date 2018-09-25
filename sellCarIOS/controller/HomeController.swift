//
//  HomeController.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/21.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation
import WebKit

class HomeController: Controller{
    
    override init(webView: WKWebView, model:Model,urlRequest:URLRequest){
        super.init(webView: webView, model: model,urlRequest:urlRequest)
        webView.load(urlRequest)
    }
    
    override func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        print("------child controller: home------")
        let command = funcMsgDic[Constants.FUNCNAME] as! String
        switch command {
        case Constants.CHANGE_PAGE_COMMAND:
            changePage(url:msg[Constants.URL] as!String)
        default:
            print("unknow command")
        }
    }
    
    deinit {
        print("------end home controller---------")
    }
}
