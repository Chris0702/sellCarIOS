//
//  PosterController.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/22.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation
import WebKit

class PosterController: Controller{
    
    //    override init(webView: WKWebView, systemInfo: SystemInfoRole){
    //        super.init(webView: webView, systemInfo: systemInfo)
    //    }
    
    override init(webView: WKWebView, model:Model,urlRequest:URLRequest){
        super.init(webView: webView, model: model,urlRequest:urlRequest)
        print("----------urlRequest-----------")
        print(urlRequest)
        print("---------------------")
        webView.load(urlRequest)
    }
    
    
    override func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        
        print("------child controller: poster------")
        
        let command = funcMsgDic[Constants.FUNCNAME] as! String
        switch command {
            //        case Constants.GET_FUNCTION_LIST_COMMAND:
            //            getFunctionList()
            //        case Constants.GET_LANGUAGE_COMMAND:
        //            insertLanguage();
        case Constants.CHANGE_PAGE_COMMAND:
            changePage(url:msg[Constants.URL] as!String)
        case Constants.GET_LOCAL_STORAGE_MEM_ALL_COMMAND:
            insertLocalStorageMemAll()
        case Constants.GET_LOCAL_STORAGE_MEM_COMMAND:
            insertLocalStorageMem(key:msg[Constants.KEY] as!String)
        case Constants.SET_LOCAL_STORAGE_MEM_COMMAND:
            setLocalStorageMem(key:msg[Constants.KEY] as!String,value:msg[Constants.VALUE] as!String)
        case Constants.REMOVE_LOCAL_STORAGE_MEM_COMMAND:
            removeLocalStorageMem(key: msg[Constants.KEY] as!String)
        default:
            print("unknow command")
        }
    }
    
    deinit {
        print("------end poster controller---------")
    }
}
