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
                    self.updateServerToken(_response: response!)
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
        
//        let systemInfo = SystemInfoRole.shared()
//        let serverToken = systemInfo.value(forKey: "lastServerToken") as! String
//        print(serverToken)
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
                    self.updateServerToken(_response: response!)
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
    
    static func updateServerToken(_response: URLResponse){
        if let httpResponse = _response as? HTTPURLResponse {
            //print("statusCode: \(String(describing: httpResponse.allHeaderFields["Set-Cookie"] as? String))")
            
            let cookieStr = httpResponse.allHeaderFields["Set-Cookie"] as? String
            let cookieArr = cookieStr?.components(separatedBy: "; ")
            if cookieArr != nil {
                for cookie in cookieArr!{
                    if cookie.components(separatedBy: "=")[0] == "WDT"{
//                        let systemInfo = SystemInfoRole.shared()
//                        systemInfo.setValue(cookie.components(separatedBy: "=")[1], forKey: "lastServerToken")
//                        systemInfo.updateSystemInfo()
                        break
                    }
                }
            }
            
        }
    }
}
