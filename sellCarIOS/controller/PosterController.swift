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
        print("----------urlRequest-----poster------")
        print(urlRequest)
        print("----------urlRequest-----poster---type---")
        print(controlModel.getCompanyType())
        print("---------------------")
        webView.load(urlRequest)
    }
    
    
    override func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        
        print("------child controller: poster------")
        print(msg)
        let command = funcMsgDic[Constants.FUNCNAME] as! String
        switch command {
        case Constants.CHANGE_PAGE_COMMAND:
            changePage(url:msg[Constants.URL] as!String)
        case Constants.GET_CAR_IMAGE_PATH_BY_FOLDER_COMMAND:
            getCarImagePathByFolder(folderName:msg[Constants.FOLDER_NAME] as!String)
//            changePage(url:msg[Constants.URL] as!String)
        print("test")
        default:
            print("unknow command")
        }
    }
    
    func getCarImagePathByFolder(folderName:String){
        HttpClient.get(url: StringProcess.getCarImagePathByFolderUrl(company:controlModel.getCompanyType(),type:Constants.POSTER),
                       successFunc: getCarImagePathByFolderSuccess,
                       errorFunc: getCarImagePathByFolderError)
    }
    
    func getCarImagePathByFolderSuccess(html: String)
    {
        print("----------------------getCarImagePathByFolder"+html)
        let result = StringProcess.getCarImagePathByFolderDic(imgArrStr: html)
        self.evaluateScript(funcName: Constants.SET_IMAGE_ALL_JAVASCRIPT, resDic: result, completionHandler: nil)
    }
    
    func getCarImagePathByFolderError()
    {
        print("getCarImagePathByFolder")
    }
    
    deinit {
        print("------end poster controller---------")
    }
}
