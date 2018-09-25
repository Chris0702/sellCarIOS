//
//  HttpClient.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/21.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation

class HttpClient {
    static func get (url:String, successFunc: @escaping (String)->(), errorFunc:@escaping ()-> ()){
        
//        let systemInfo = SystemInfoRole.shared()
//        let serverToken = systemInfo.value(forKey: "lastServerToken") as! String
        
        // Set the URL where we're making the request
        if let getUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            var request = URLRequest(url: getUrl, timeoutInterval: 10.0)
            request.httpMethod = "GET"
//            request.addValue("WDT=\(serverToken)", forHTTPHeaderField: "cookie")
            
            // Perform the request
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    
                    if (statusCode == 500) {
//                        Toast(text: "Internet server error".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
                        errorFunc()
                        return;
                    } /*else if(statusCode == 404) {
                     errorFunc()
                     return;
                     }*/
                }
                
                if let data = data,
                    let html = String(data: data, encoding: String.Encoding.utf8) {
                    successFunc(html)
                }else{
//                    if let error = error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorTimedOut{
//                        Toast(text: "The request timed out".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
//                    }else{
//                        Toast(text: "Internet server error".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
//                    }
                    errorFunc()
                    print(error ?? "http get error")
                }
            }
            task.resume()
        }else{
//            Toast(text: "URL error".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
            errorFunc()
            print("http url error")
        }
    }
    
    static func post (url:String, postData: String, successFunc:@escaping (String)->(), errorFunc:@escaping ()->()){
        if let getUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            var request = URLRequest(url: getUrl, timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.httpBody = postData.data(using: .utf8)
//            request.addValue("WDT=\(serverToken)", forHTTPHeaderField: "cookie")
            request.allHTTPHeaderFields = [ "Content-Type": "application/json" ]
            
            // Perform the request
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    
                    if (statusCode == 500) {
//                        Toast(text: "Internet server error".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
                        errorFunc()
                        return;
                    }
                }
                
                if let data = data,
                    let html = String(data: data, encoding: String.Encoding.utf8) {
                    successFunc(html)
                }else{
                    if let error = error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorTimedOut{
//                        Toast(text: "The request timed out".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
                    }else{
//                        Toast(text: "Internet server error".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
                    }
                    errorFunc()
                    print(error ?? "http post error")
                }
            }
            task.resume()
        }else{
//            Toast(text: "URL error".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
            errorFunc()
            print("http url error")
        }
    }
    
    static func postWithHeader (url:String, postData: String, headers: [String: String], successFunc:@escaping (String)->(), errorFunc:@escaping ()->()){
        if let getUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            var request = URLRequest(url: getUrl, timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.httpBody = postData.data(using: .utf8)
            for (key, value) in headers{
                request.addValue(value, forHTTPHeaderField: key)
            }
            
            // Perform the request
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    
                    if (statusCode == 500) {
                        //                        Toast(text: "Internet server error".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
                        errorFunc()
                        return;
                    }
                }
                
                if let data = data,
                    let html = String(data: data, encoding: String.Encoding.utf8) {
                    successFunc(html)
                }else{
                    if let error = error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorTimedOut{
                        //                        Toast(text: "The request timed out".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
                    }else{
                        //                        Toast(text: "Internet server error".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
                    }
                    errorFunc()
                    print(error ?? "http post error")
                }
            }
            task.resume()
        }else{
            //            Toast(text: "URL error".localized(lang: systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String)).show()
            errorFunc()
            print("http url error")
        }
    }
    
    static func updateServerUrl()
    {
        HttpClient.get(url: Constants.GET_SERVER_URL_REST_API,
                       successFunc: updateServerUrlSuccess,
                       errorFunc: updateServerUrlError)
    }
    
    static func updateServerUrlSuccess(html:String){
        print("server url = "+html)
        do{
            Constants.SERVER_URL = html
            StringProcess.updateUrlPath()
            checkServerIsExist()
        }catch{
            updateServerUrlError()
        }
    }
    
    static func updateServerUrlError(){
       let controlModel: Model = Model()
       controlModel.ToastShow(text: Constants.PLEASE_CHECK_NETWORK)
       sendMessage2SupportLine(lineMessage:Constants.SERVER_GIT_URL_ABMORMAL_SUPPORT)
    }
    
    static func checkServerIsExist(){
        HttpClient.get(url: Constants.SERVER_IS_EXIST_API,
                       successFunc: checkServerIsExistSuccess,
                       errorFunc: checkServerIsExistError)
    }
    
    static func checkServerIsExistSuccess(html:String){
        print("checkServerIsExistSuccess  = "+html)
        do{
            var result = StringProcess.convertToDictionary(text: html)
            if(result != nil && result?[Constants.RESULT_REST_API] != nil && result?[Constants.RESULT_REST_API] as! Int == 0){
                
            }else{
                checkServerIsExistError()
            }
        }catch{
            checkServerIsExistError()
        }
    }
    
    static func checkServerIsExistError(){
        let controlModel: Model = Model()
        controlModel.ToastShow(text: Constants.SERVER_ABMORMAL)
        sendMessage2SupportLine(lineMessage:Constants.SERVER_ABMORMAL_SUPPORT)
    }
    
    static func sendMessage2SupportLine(lineMessage:String){
        HttpClient.postWithHeader(url: Constants.LINE_NOTIFY_URL,
                        postData: StringProcess.getMessage2SupportLine(message: lineMessage),
                        headers: [Constants.LINE_AUTH_NAME:Constants.LINE_SUPPORT_AUTH],
                        successFunc: sendMessage2SupportLineSuccess,
                        errorFunc: sendMessage2SupportLineError
        )
    }
    
    static func sendMessage2SupportLineSuccess(html:String){
        print(html)
    }
    
    static func sendMessage2SupportLineError(){
    }
    
}
