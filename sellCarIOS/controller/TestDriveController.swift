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
        let command = funcMsgDic[Constants.FUNCNAME] as! String
        switch command {
        case Constants.CHANGE_PAGE_COMMAND:
            changePage(url:msg[Constants.URL] as!String)
        case Constants.GET_CARS_INFO_BY_ID_COMMAND:
            getCarsInfoById()
        case Constants.TOAST_COMMAND:
            toast(msg: msg[Constants.MSG] as!String)
        default:
            print("unknow command")
        }
    }
    
    func getCarsInfoById(){
        HttpClient.get(url: StringProcess.getCarsInfoByIdUrl(id:controlModel.getFavoriteCar()),
                       successFunc: getCarsInfoByIdSuccess,
                       errorFunc: getCarsInfoByIdError)
    }

    func getCarsInfoByIdSuccess(html: String)
    {
        var result = StringProcess.convertToDictionary(text: html)
        if(result != nil && result?[Constants.RESULT_REST_API] != nil && result?[Constants.RESULT_REST_API] as! Int == 0){
            let resDic = [
                Constants.CARS_INFO : result![Constants.RES_STRING_REST_API],
                Constants.SERVER_URL_STRING : Constants.SERVER_URL,
                ] as [String : Any]
            self.evaluateScript(funcName: Constants.SET_CARS_INFO_JAVASCRIPT, resDic: resDic, completionHandler: nil)
        }
    }
    
    func getCarsInfoByIdError()
    {
        print("getCarImagePathByFolder")
    }
    
    deinit {
        print("------end test drive controller---------")
    }
}
