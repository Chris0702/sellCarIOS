//
//  PriceController.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/22.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation
import WebKit

class PriceController: Controller{
    
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
        print("------child controller: price------")
        let command = funcMsgDic[Constants.FUNCNAME] as! String
        switch command {
        case Constants.CHANGE_PAGE_COMMAND:
            changePage(url:msg[Constants.URL] as!String)
        case Constants.GET_CARS_INFO_BY_COMPANY_COMMAND:
            getCarsInfoByCompany()
        case Constants.SET_FAVORITE_CAR_COMMAND:
            setFavoriteCar(car: msg[Constants.FAVORITE_CAR] as!String)
        default:
            print("unknow command")
        }
    }
    
    func setFavoriteCar(car:String){
        controlModel.setFavoriteCar(car: car)
    }
    
    func getCarsInfoByCompany(){
        HttpClient.get(url: StringProcess.getCarsInfoByCompanyUrl(company:controlModel.getCompanyType()),
                       successFunc: getCarsInfoByCompanySuccess,
                       errorFunc: getCarsInfoByCompanyError)
    }
    
    func getCarsInfoByCompanySuccess(html: String)
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
    
    func getCarsInfoByCompanyError()
    {
        print("getCarImagePathByFolder")
    }
    
    deinit {
        print("------end price controller---------")
    }
}
