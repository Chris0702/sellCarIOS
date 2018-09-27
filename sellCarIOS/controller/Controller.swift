//
//  Controller.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/21.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation
import WebKit
import Toaster

class Controller {
    
    var webView: WKWebView?
    var controlModel: Model
    var urlRequest: URLRequest
    static var localStorageMem: Dictionary<String, Any>=[:]
    
    
    init(webView: WKWebView, model: Model, urlRequest: URLRequest){
        self.webView = webView
        self.controlModel = model
        self.urlRequest = urlRequest
        controlModel.showLoadingView(show: false)
    }
    
    
    func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        print("------parent controller------")
    }
    
    func evaluateScript(funcName: String, resDic: Dictionary<String, Any>, completionHandler: ((Any?, Error?) -> Void)? = nil) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: resDic, options: [])
            var jsonString = String(data: jsonData, encoding: .utf8)!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            // jsonString = jsonData.base64EncodedString(options: .endLineWithLineFeed)
            jsonString = String(data:jsonData, encoding: String.Encoding.utf8)!
            // webView!.evaluateJavaScript("jsAppInterface.\(funcName)('\(jsonString)')", completionHandler: completionHandler)
            
            DispatchQueue.main.async {
                self.webView!.evaluateJavaScript(StringProcess.getEvaluateJavaScriptString(funcName:funcName, jsonString:jsonString), completionHandler: completionHandler)
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func evaluateScript(funcName: String, resStr: String, completionHandler: ((Any?, Error?) -> Void)? = nil) {
        do {
            DispatchQueue.main.async {
                self.webView!.evaluateJavaScript(StringProcess.getEvaluateJavaScriptString(funcName:funcName, jsonString:resStr), completionHandler: completionHandler)
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func toast(msg:String)
    {
        Toast(text: msg).show()
    }
    
    func changePage(url:String)
    {
        controlModel.changePage(webView: webView!, page: url)
    }
    
    func releaseResource(){
    }
   
}
