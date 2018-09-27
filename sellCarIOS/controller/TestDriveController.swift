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
        case Constants.ORDER_TEST_DRIVE_COMMAND:
            orderTestDrive(name:msg[Constants.NAME] as!String,company:msg[Constants.COMPANY] as!String,phone:msg[Constants.PHONE] as!String,address:msg[Constants.ADDRESS] as!String,paymentType:msg[Constants.PAYMENT_TYPE] as!String,carName:msg[Constants.CAR_NAME] as!String,carCompany:msg[Constants.CAR_COMPANY] as!String,carVersion:msg[Constants.CAR_VERSION] as!String,carColor:msg[Constants.CAR_COLOR] as!String,hopeTime:msg[Constants.HOPE_TIME] as!String)
        case Constants.TOAST_COMMAND:
            toast(msg: msg[Constants.MSG] as!String)
        default:
            print("unknow command")
        }
    }
    
    func orderTestDrive(name:String,company:String,phone:String,address:String,paymentType:String,carName:String,carCompany:String,carVersion:String,carColor:String,hopeTime:String){
        HttpClient.post(url: Constants.ORDER_TEST_DRIVE_API,
                        postData:StringProcess.getOrderTestDrivePostData(name:name,company:company,phone:phone,address:address,paymentType:paymentType,carName:carName,carCompany:carCompany, carVersion:carVersion, carColor:carColor, hopeTime:hopeTime),
                       successFunc: orderTestDriveSuccess,
                       errorFunc: orderTestDriveError)
    }
    
    func orderTestDriveSuccess(html: String)
    {
        var result = StringProcess.convertToDictionary(text: html)
        if(result != nil && result?[Constants.RESULT_REST_API] != nil && result?[Constants.RESULT_REST_API] as! Int == 0){
          toast(msg: Constants.ORDER_TEST_DRIVE_SUCCESS)
            changePage(url: Constants.PRICE_PAGE_NAME)
        }else{
            orderTestDriveError()
        }
    }
    
    func orderTestDriveError()
    {
        toast(msg: Constants.ORDER_TEST_DRIVE_FAIL)
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
