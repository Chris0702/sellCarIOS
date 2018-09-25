//
//  StringProcess.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/21.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation

class StringProcess {
    
    static func getEvaluateJavaScriptString(funcName:String, jsonString:String) -> String{
        return Constants.JAVASCRIPT_PARAMETER_FOR_IOS+".\(funcName)('\(jsonString)')"
    }
    
    static func getCurrentLanguage() -> String {
        let defaults = UserDefaults.standard
        let complete_lang = defaults.object(forKey: "AppleLanguages") as! NSArray?
        var lang = complete_lang?.firstObject as! String
        let lang_length = lang.count
        let lang_org = lang
        if(lang_length>2)
        {
            lang=(lang as NSString).substring(to: 2);
            switch(lang)
            {
            case "en":
                return "en"
            case "zh":
                if( lang_org=="zh-TW"||lang_org=="zh-HK"||lang_org=="zh-Hant-TW"||lang_org=="zh-Hant-HK")
                {
                    return "zh_tw"
                }
                else
                {
                    return "zh_cn"
                }
            case "ja":
                return "ja"
            case "ko":
                return "ko"
            case "fr":
                return "fr"
            default:
                return "en"
            }
        }
        else
        {
            return lang_org
        }
    }
    
    static func getSocketServerTokenStr(serverToken:String)->String
    {
        return "WDT=\(serverToken)"
    }
    
    static func getSocketUrl()->String
    {
        return "http://\(Constants.SERVER_URL)"
    }
    
    static func getTagListByPageUrl(projectName:String,start:Int,count:Int)->String
    {
        return Constants.GET_TAG_LIST_BY_PAGE_REST_API+"/\(projectName)/\(start)/\(count)"
    }
    
    //    static func getSaveMobileInfoPostData(firebaseToken:String,project:String,username:String,password:String,notification:String,language:String,baiduNotificationChannelId:String)->String
    //    {
    //        return "firebaseToken=\(firebaseToken)&project=\(project)&username=\(username)&password=\(password)&notification=\(notification)&language=\(language)&type=iOS&baiduNotificationChannelId=\(baiduNotificationChannelId)"
    //    }
    
    static func getSubscribeNotifyPostData(deviceID:String,project:String,username:String,password:String,isNotify:String,language:String,apnsToken:String, apnsType:String)->String
    {
        let dic = [
            "deviceID" : deviceID,
            "deviceType" : "iOS",
            "project" : project,
            "username" : username,
            "password" : password,
            "isNotify" : isNotify,
            "appType" : "scada",
            "language" : language,
            "firebaseToken" : "",
            "baiduNotificationChannelId" : "",
            "apnsToken" : apnsToken,
            "pushMessageType" : "apns",
            "apnsType" : apnsType,
            ]
        
        let dataStrJson = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let dataStr = String(data: dataStrJson!, encoding: .utf8)
        return dataStr!
    }
    
    static func getTagListByPagePostData(tags:Array<Dictionary<String, String>>)->String
    {
        let tagsStrJson = try? JSONSerialization.data(withJSONObject: ["filters":tags], options: [])
        let tagsStr = String(data: tagsStrJson!, encoding: .utf8)
        return tagsStr!
    }
    
    static func getTagsDataPostData(tags:Array<Dictionary<String, Any>>)->String
    {
        let tagsStrJson = try? JSONSerialization.data(withJSONObject: ["Tags":tags], options: [])
        let tagsStr = String(data: tagsStrJson!, encoding: .utf8)
        return tagsStr!
    }
    
    static func setTagValuesPostData(tags:Array<Dictionary<String, Any>>)->String
    {
        let tagsStrJson = try? JSONSerialization.data(withJSONObject: ["Tags":tags], options: [])
        let tagsStr = String(data: tagsStrJson!, encoding: .utf8)
        return tagsStr!
    }
    
    static func getAlarmAckPostData(tags:Dictionary<String, String>)->String
    {
        let reTags = ["Name": tags["tagName"]]
        
        let tagsStrJson = try? JSONSerialization.data(withJSONObject: ["Tags":reTags], options: [])
        let tagsStr = String(data: tagsStrJson!, encoding: .utf8)
        return tagsStr!
    }
    
    static func getTagValueSubscribe(projectName:String,tagsStr:String)->String{
        return "{\"projectName1\":\"\(projectName)\"," +
            "\"Widget\":\"SingleValue\"," +
            "\"Widgetlid\":\"SingleValue\"," +
            "\"widgetPushinterval\":5000," +
            "\"intervalWPush\":\"N\"," +
        "\"Tags\":\(tagsStr)}"
    }
    
    static func getAlarmSummarySubscribe(projectName:String,count:Int,start:Int)->String{
        return "{\"projectName1\":\"\(projectName)\"," +
            "\"Widget\":\"alarmSummaryAndCount\"," +
            "\"Widgetlid\":\"ALARM_SUMMARY_WIDGETLID\"," +
            "\"widgetPushinterval\":0," +
            "\"count\":\(count)," +
        "\"start\":\(start)}"
    }
    
    static func getSystemDataSubscribe(projectName:String)->String{
        return "{\"projectName1\":\"\(projectName)\"}"
    }
    
    
    static func getActionLogSubscribe(projectName:String,count:Int,nodeName:String,start:Int)->String{
        return "{\"projectName1\":\"\(projectName)\"," +
            "\"Widget\":\"actionLogAndCount\"," +
            "\"Widgetlid\":\"ACTION_WIDGETLID\"," +
            "\"widgetPushinterval\":0," +
            "\"count\":\(count)," +
            "\"nodeName\":\"\(nodeName)\"," +
        "\"start\":\(start)}"
    }
    
    static func getAlarmLogSubscribe(projectName:String,count:Int,nodeName:String,start:Int)->String{
        return "{\"projectName1\":\"\(projectName)\"," +
            "\"Widget\":\"alarmLogAndCount\"," +
            "\"Widgetlid\":\"ALARM_WIDGETLID\"," +
            "\"widgetPushinterval\":0," +
            "\"count\":\(count)," +
            "\"nodeName\":\"\(nodeName)\"," +
        "\"start\":\(start)}"
    }
    
    static func getNodeStatusSubscribe(projectName:String)->String{
        return "{\"projectName1\":\"\(projectName)\"}"
    }
    
    static func getRealTrendsSubscribe(projectName:String, interval:Int, records:Int, tagsStr:String)->String{
        return "{\"projectName1\":\"\(projectName)\"," +
            "\"Widget\":\"realTrends\"," +
            "\"Widgetlid\":\"RealTrends\"," +
            "\"widPushinterval\":\(interval)," +
            "\"intervalWPush\":\"Y\"," +
            "\"Tags\":\(tagsStr)," +
            "\"timezoneOffset\":\(TimeZone.current.secondsFromGMT()/(-60))," +
        "\"params\":[\(interval),\(records)]}"
    }
    
    // 2018.06.15 Elvis for data log
    static func getDataLogSubscribe(projectName:String, interval:Int, records:Int, tagsStr:String)->String{
        return "{\"projectName1\":\"\(projectName)\"," +
            "\"Widget\":\"dataLog\"," +
            "\"Widgetlid\":\"DataLog\"," +
            "\"widPushinterval\":\(interval)," +
            "\"intervalWPush\":\"Y\"," +
            "\"Tags\":\(tagsStr)," +
            "\"timezoneOffset\":\(TimeZone.current.secondsFromGMT()/(-60))," +
        "\"params\":[\(interval),\(records)]}"
    }
    
    static func setTagValuesUrl(projectName:String)->String{
        return Constants.SET_TAG_VALUES_REST_API+"/"+projectName
    }
    
    static func getAlarmAckUrl(projectName:String)->String{
        return Constants.ALARM_ACK_REST_API+"/"+projectName
    }
    
    static func getAlarmAckAllUrl(projectName:String)->String{
        return Constants.ALARM_ACK_ALL_REST_API+"/"+projectName
    }
    
    static func getNodeListUrl(projectName:String)->String{
        return Constants.GET_NODE_LIST_REST_API+"/"+projectName
    }
    
    static func getRTrendGroupIdUrl(projectName:String, nodeName:String)->String{
        return Constants.GET_R_TREND_GROUP_ID_REST_API+"/"+projectName+"/"+nodeName
    }
    
    static func getRTrendConfigUrl(projectName:String, nodeName:String, trendGroupId:String)->String{
        return Constants.GET_R_TREND_CONFIG_REST_API + "/" + projectName + "/" + nodeName + "/" + trendGroupId
    }
    
    static func getTagsDataUrl(projectName:String)->String{
        return Constants.GET_TAGS_DATA_REST_API + "/" + projectName
    }
    
    static func getServerTokenUrl(projectName1:String,username:String,password:String)->String{
        return Constants.GET_DASHBOARD_TOKEN_REST_API+"?projectName1=\(projectName1)&username=\(username)&password=\(password)"
    }
    
    static func getUnSubscribeNotifyUrl(deviceID:String)->String{
        return Constants.UNSUBSCRIBE_NOTIFY_REST_API+"?deviceID=\(deviceID)&deviceType=iOS"
    }
    
    // 2018.05.29 Elvis for gmap and bmap
    static func getMapList(projectName: String, nodeName: String) -> String  {
        return Constants.GET_GOOGLE_MAP_LIST_REST_API + "/" + projectName + "/" + nodeName
    }
    
    static func getBaiduMapList(projectName: String, nodeName: String) -> String  {
        return Constants.GET_BAIDU_MAP_LIST_REST_API + "/" + projectName + "/" + nodeName
    }
    
    static func getMapConfig(projectName: String, nodeName: String, mapType: String, mapName: String) -> String  {
        
        if mapType == "b" {
            return Constants.GET_BAIDU_MAP_CONFIG_REST_API + "/" + projectName + "/" + nodeName + "/" + mapName
        } else {
            return Constants.GET_GOOGLE_MAP_CONFIG_REST_API + "/" + projectName + "/" + nodeName + "/" + mapName
        }
    }
    
    static func getBaiduMapConfig(projectName: String, nodeName: String, mapType: String, mapName: String) -> String  {
        return Constants.GET_BAIDU_MAP_CONFIG_REST_API + "/" + projectName + "/" + nodeName + "/" + mapName
    }
    
    // 2018.06.13 Elvis for data log list
    static func getHisTrendGroupId(projectName: String, nodeName: String) -> String {
        return Constants.GET_HIS_TREND_GROUP_ID_REST_API + "/" + projectName + "/" + nodeName
    }
    
    static func getHisTrendConfig(projectName: String, nodeName: String, groupNumber: String) -> String {
        return Constants.GET_HIS_TREND_CONFIG_REST_API + "/" + projectName + "/" + nodeName + "/" + groupNumber
    }
    
    /*static func stringDictionary2JsonString(dictionary:Dictionary<String, String>)->String
     {
     var tmp="\(dictionary)";
     let tmp_length = tmp.characters.count;
     tmp=(tmp as NSString).substring(to: tmp_length-1);
     tmp=(tmp as NSString).substring(from: 1);
     return "{"+"\(tmp)"+"}";
     }*/
    
    static func ip(_ip:String) -> String{
        if(_ip.count > 7){
            var index = _ip.index(_ip.startIndex, offsetBy: 7)
            //var subStr = _ip.substring(to: index)
            var subStr = String(_ip[..<index])
            
            if (subStr.caseInsensitiveCompare("http://") == ComparisonResult.orderedSame) {
                //print("str starts with 'http://'\(_ip.substring(from: index))")
                //return _ip.substring(from: index)
                print("str starts with 'https://'\(String(_ip[index...]))")
                return String(_ip[index...])
            }
            
            index = _ip.index(_ip.startIndex, offsetBy: 8)
            //subStr = _ip.substring(to: index)
            subStr = String(_ip[..<index])
            
            if (subStr.caseInsensitiveCompare("https://") == ComparisonResult.orderedSame) {
                //print("str starts with 'https://'\(_ip.substring(from: index))")
                //return _ip.substring(from: index)
                print("str starts with 'https://'\(String(_ip[index...]))")
                return String(_ip[index...])
            }
        }
        return _ip
    }
    
    static func convertToDictionary(text: String) -> [String: Any]? {
        if(text == ""){
            return [:]
        }
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print("err : "+text)
                print(error.localizedDescription)
            }
        }
        return [:]
    }
    
    static func updateUrlPath()
    {
//        Constants.READ_PROJECT_LIST_REST_API =  getNewRestApiPath(ip:ip,restApiUrl:Constants.READ_PROJECT_LIST_REST_API)
//        Constants.GET_WEBACCESS_PROJECT_LIST_API =  getNewRestApiPath(ip:ip,restApiUrl:Constants.GET_WEBACCESS_PROJECT_LIST_API)
//        Constants.GET_VERSION_API =  getNewRestApiPath(ip:ip,restApiUrl:Constants.GET_VERSION_API)
//        Constants.GET_DASHBOARD_TOKEN_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.GET_DASHBOARD_TOKEN_REST_API)
//        Constants.SAVE_MOBILE_INFO_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.SAVE_MOBILE_INFO_REST_API)
//        Constants.GET_NODE_LIST_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.GET_NODE_LIST_REST_API)
//        Constants.GET_R_TREND_GROUP_ID_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.GET_R_TREND_GROUP_ID_REST_API)
//        Constants.GET_R_TREND_CONFIG_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.GET_R_TREND_CONFIG_REST_API)
//        Constants.GET_TAGS_DATA_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.GET_TAGS_DATA_REST_API)
//        Constants.ALARM_ACK_ALL_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.ALARM_ACK_ALL_REST_API)
//        Constants.GET_TAG_LIST_BY_PAGE_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.GET_TAG_LIST_BY_PAGE_REST_API)
//        Constants.UPDATE_NOTIFICATION_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.UPDATE_NOTIFICATION_REST_API)
//        Constants.ALARM_ACK_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.ALARM_ACK_REST_API)
//        Constants.SET_TAG_VALUES_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.SET_TAG_VALUES_REST_API)
//        Constants.SUBSCRIBE_NOTIFY_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.SUBSCRIBE_NOTIFY_REST_API)
//        Constants.UNSUBSCRIBE_NOTIFY_REST_API = getNewRestApiPath(ip:ip,restApiUrl:Constants.UNSUBSCRIBE_NOTIFY_REST_API)
//        Constants.DASHBOARD_VIEW_WEB_URL = "http://"+ip+"/WADashboard/dashboardviewer?projectName1=\(projectName)&username=\(username)&password=\(password)"
//        // 2018.05.29 Elvis for gmap and bamp
//        Constants.GET_GOOGLE_MAP_LIST_REST_API = getNewRestApiPath(ip: ip, restApiUrl: Constants.GET_GOOGLE_MAP_LIST_REST_API)
//        Constants.GET_GOOGLE_MAP_CONFIG_REST_API = getNewRestApiPath(ip: ip, restApiUrl: Constants.GET_GOOGLE_MAP_CONFIG_REST_API)
//        Constants.GET_BAIDU_MAP_LIST_REST_API = getNewRestApiPath(ip: ip, restApiUrl: Constants.GET_BAIDU_MAP_LIST_REST_API)
//        Constants.GET_BAIDU_MAP_CONFIG_REST_API = getNewRestApiPath(ip: ip, restApiUrl: Constants.GET_BAIDU_MAP_CONFIG_REST_API)
//        // 2018.06.13 Elvis for data log list
//        Constants.GET_HIS_TREND_GROUP_ID_REST_API = getNewRestApiPath(ip: ip, restApiUrl: Constants.GET_HIS_TREND_GROUP_ID_REST_API)
//        Constants.GET_HIS_TREND_CONFIG_REST_API = getNewRestApiPath(ip: ip, restApiUrl: Constants.GET_HIS_TREND_CONFIG_REST_API)
        
//          Constants.SERVER_URL = ip
        
        
    }
    
//    public static String getLocalRestAPI(String apiType,String api) {
//    return api.substring(api.indexOf("/"+apiType), api.length());
//    }
    
    static func getNewRestApiPath(ip:String,restApiUrl:String)->String
    {
        let localString=StringProcess.substringByString(substring: restApiUrl,start: "/WADashboard")
        let result="http://"+ip+localString
        return result
    }
    
    static func substringByString(substring:String,start:String)->String
    {
        let range = substring.range(of: start)
        let startIndex = range?.lowerBound
        //let result = substring.substring(from: startIndex!)
        let result = String(substring[startIndex!...])
        return result
        
    }
}
