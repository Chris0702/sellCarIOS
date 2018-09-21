//
//  Controller.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/21.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation

import WebKit

class Controller {
    
    var webView: WKWebView?
//    var systemInfo: SystemInfoRole
    var controlModel: Model
    var urlRequest: URLRequest
    static var localStorageMem: Dictionary<String, Any>=[:]
    
    //    init(webView: WKWebView, systemInfo: SystemInfoRole){
    //        self.webView = webView
    //        self.systemInfo = systemInfo
    //    }
    
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
    
    func changePage(url:String)
    {
        controlModel.changePage(webView: webView!, page: url)
    }
    
    func insertLocalStorageMemAll()
    {
        self.evaluateScript(funcName: Constants.INSERT_LOCAL_STORAGE_MEM_ALL_JAVASCRIPT, resDic: Controller.localStorageMem, completionHandler: nil)
    }
    
    func insertLocalStorageMem(key:String)
    {
        var result:Dictionary<String, Any>=[:];
        let value = Controller.localStorageMem[key];
        result.updateValue(value!, forKey: key);
        self.evaluateScript(funcName: Constants.INSERT_LOCAL_STORAGE_MEM_JAVASCRIPT, resDic: result, completionHandler: nil)
    }
    
    func setLocalStorageMem(key:String, value:Any)
    {
        Controller.localStorageMem.updateValue(value, forKey: key);
    }
    
    func removeLocalStorageMem(key:String)
    {
        Controller.localStorageMem.removeValue(forKey: key);
    }
    
    
    func alarmAckSuccess(html: String)
    {
        //print("----------------------alarmAckSuccess"+html)
        print(html)
    }
    
    func alarmAckError()
    {
        print("alarmAckError")
    }
    
//    func insertLanguage()
//    {
//        var language = systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String
//        if(language == Constants.EMPTY_STRING)
//        {
//            language = StringProcess.getCurrentLanguage();
//        }
//
//        let resDic: Dictionary = ["lang": language] as [String : Any]
//        self.evaluateScript(funcName: Constants.INSERT_LANGUAGE_JAVASCRIPT, resDic: resDic, completionHandler: nil)
//    }
//
//    func getUserLanguage() -> String {
//        return systemInfo.value(forKey: Constants.SYSTEM_INFO_LANGUAGE_SQL) as! String
//    }
//
//    func getNodeList(){
//        let _projectName = systemInfo.value(forKey: Constants.SYSTEM_INFO_LAST_PROJECT_NAME_SQL) as! String
//        HttpClient.get(url: StringProcess.getNodeListUrl(projectName:_projectName),
//                       successFunc: self.getNodeListSuccess,
//                       errorFunc: self.getNodeListError)
//    }
//
    func getNodeListSuccess(html: String){
        print(html)
        var result = StringProcess.convertToDictionary(text: html)
        if(result != nil && result?[Constants.RESULT_REST_API] != nil && result?[Constants.RESULT_REST_API] as! Int == 0){
            let resDic: Dictionary = [Constants.RESULT_REST_API:0, Constants.NODE_LISTS:result?[Constants.NODE_LISTS] ?? []] as [String : Any]
            
            
            
            evaluateScript(funcName: Constants.INSERT_NODE_LIST_JAVASCRIPT, resDic: resDic, completionHandler: nil)
        }else{
            print("get node list failed")
        }
    }
    
    func getNodeListError(){
    }
    
    func releaseResource(){
    }
    
    // MARK: - Maps Relative
    // TODO: - Optimize tmpMap and tmpMapList fetch method
    
    func getSelectedNode() {
        var resDic = [String: Any]()
        if let nodeName = Controller.localStorageMem[Constants.SELECTED_NODE] as? String {
            resDic[Constants.NODE_NAME] = nodeName
            evaluateScript(funcName: Constants.INSERT_SELECTED_NODE_JAVASCRIPT, resDic: resDic, completionHandler: nil)
        } else {
            print("getSelectedNode nil")
        }
    }
    
    // 2018.05.24 Elvis for gmap and gmap
    var tmpMap: [String: Any] = [:]
    var tmpMapList = [[String: Any]]()
    

    
    func getMapListSuccess(html: String) {
        print(html)
        if let result = StringProcess.convertToDictionary(text: html) {
            if let resStatus = result[Constants.RESULT_REST_API] as? Int, resStatus == 0 {
                var resDic = [Constants.RESULT_REST_API: resStatus, Constants.MAP_LIST: []] as [String: Any]
                
                if let mapList = result[Constants.MAP_LIST] as? [String] {
                    for name in mapList {
                        tmpMap[Constants.NAME] = name
                        if name.contains(".google") {
                            tmpMap[Constants.TYPE] = "g"
                        } else if name.contains(".baidu") {
                            tmpMap[Constants.TYPE] = "b"
                        } else {
                            tmpMap[Constants.TYPE] = "g"
                        }
                        
                        tmpMapList.append(tmpMap)
                    }
                }
                resDic[Constants.MAP_LIST] = tmpMapList
                evaluateScript(funcName: Constants.INSERT_MAP_LIST_BY_NODE_JAVASCRIPT, resDic: resDic, completionHandler: nil)
            } else {
                print("getMapListSuccess resStatus != 0")
            }
        } else {
            print("getMapListSuccess return nil")
        }
    }
    
    func getMapListError() {
        
    }
    
  
    
    func getMapConfigError() {
        
    }
    
   
}
