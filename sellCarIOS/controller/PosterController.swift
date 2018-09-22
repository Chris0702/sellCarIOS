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
        Constants.GO_HOME_PAGE = false;
    }
    
    
    override func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>){
        
        print("------child controller: home------")
        
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
    
    //    func getFunctionList()
    //    {
    //        let resDic = [Constants.FUNCTION_LIST:[
    //            Constants.ALARM_LOG: (systemInfo.value(forKey: Constants.SYSTEM_INFO_ALARM_LOG_PAGE_NAME_SQL) as! Bool) ? Constants.TRUE_STRING:Constants.FALSE_STRING,
    //            Constants.ALARM_SUMMARY: (systemInfo.value(forKey: Constants.SYSTEM_INFO_ALARM_SUMMARY_LOG_PAGE_NAME_SQL) as! Bool) ? Constants.TRUE_STRING:Constants.FALSE_STRING,
    //            Constants.ACTION_LOG: (systemInfo.value(forKey: Constants.SYSTEM_INFO_ACTION_LOG_PAGE_NAME_SQL) as! Bool) ? Constants.TRUE_STRING:Constants.FALSE_STRING,
    //            Constants.TREND: (systemInfo.value(forKey: Constants.SYSTEM_INFO_TREND_PAGE_NAME_SQL) as! Bool) ? Constants.TRUE_STRING:Constants.FALSE_STRING,
    //            Constants.DASHBOARD: (systemInfo.value(forKey: Constants.SYSTEM_INFO_DASHBOARD_PAGE_NAME_SQL) as! Bool) ? Constants.TRUE_STRING:Constants.FALSE_STRING,
    //            Constants.TAGS_INFO: (systemInfo.value(forKey: Constants.SYSTEM_INFO_TAGS_INFO_PAGE_NAME_SQL) as! Bool) ? Constants.TRUE_STRING:Constants.FALSE_STRING,
    //            Constants.G_MAP: (systemInfo.value(forKey: Constants.SYSTEM_INFO_G_MAP_PAGE_NAME_SQL) as! Bool) ? Constants.TRUE_STRING:Constants.FALSE_STRING,
    //            Constants.NODE_STATUS: (systemInfo.value(forKey: Constants.SYSTEM_INFO_NODE_STATUS_PAGE_NAME_SQL) as! Bool) ? Constants.TRUE_STRING:Constants.FALSE_STRING,
    //            // 2018.06.13 Elvis for data log trend
    //            Constants.DATA_LOG: (systemInfo.value(forKey: Constants.SYSTEM_INFO_DATA_LOG_PAGE_NAME_SQL) as! Bool) ? Constants.TRUE_STRING:Constants.FALSE_STRING
    //            ]]
    //        print("------------getFunctionList-------------\(resDic)")
    //        evaluateScript(funcName: Constants.INSERT_FUNCTION_LIST_JAVASCRIPT, resDic: resDic, completionHandler: nil)
    //    }
    //
    deinit {
        print("------end home controller---------")
    }
}
