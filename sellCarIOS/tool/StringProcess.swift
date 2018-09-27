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
    
    static func getMessage2SupportLine(message:String)->String
    {
        return Constants.LINE_MESSAGE_NAME+"="+message
    }
    
    static func getCarsInfoByIdUrl(id:String)->String
    {
        return Constants.GET_CARS_INFO_BY_ID_API + "?id="+id;
    }
    
    static func getCarImagePathByFolderDic(imgArrStr:String)->[String: Any]
    {
        var imgArray:[String]? = nil
        if let data = imgArrStr.data(using: String.Encoding.utf8) {
            do {
                let arrayOfString = try JSONSerialization.jsonObject(with: data, options: []) as? [String]
                imgArray = arrayOfString!
                }catch{
            }
        }
        let result = [
            Constants.IMAGE_ARRAY : imgArray,
            Constants.SERVER_URL_STRING : Constants.SERVER_URL,
            ] as [String : Any]
        return result
    }
    
    static func getCarsInfoByCompanyDic(carInfo:[Any])->[String: Any]
    {
//        var imgArray:[String]? = nil
//        if let data = imgArrStr.data(using: String.Encoding.utf8) {
//            do {
//                let arrayOfString = try JSONSerialization.jsonObject(with: data, options: []) as? [String]
//                imgArray = arrayOfString!
//            }catch{
//            }
//        }
        
        print("################carInfo##############")
        print(carInfo)
        print("##############################")
        let result = [
            Constants.IMAGE_ARRAY : carInfo,
            Constants.SERVER_URL_STRING : Constants.SERVER_URL,
            ] as [String : Any]
        return result
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
    
    static func getLocalPathAllUrl(folderName:String)->String{
        //http://35.221.137.207/file/getLocalPathAll?foldername=resource/company/NISSAN/image/poster
        return Constants.GET_LOCAL_PATH_ALL_API+"?foldername="+folderName
    }
    
    static func getCarImagePathByFolderUrl(company:String,type:String)->String{
        let folder = "resource/company/"+company+"/image/"+type
        return getLocalPathAllUrl(folderName:folder)
    }
    
    static func getCarsInfoByCompanyUrl(company:String)->String{
       return Constants.GET_CARS_INFO_BY_COMPANY_API+"?company="+company
    }
    
    static func updateUrlPath()
    {
        Constants.SERVER_IS_EXIST_API = getLocalRestAPI(apiType: Constants.SERVER_API_TYPE, api: Constants.SERVER_IS_EXIST_API)
        Constants.GET_LOCAL_PATH_ALL_API = getLocalRestAPI(apiType: Constants.FILE_API_TYPE, api: Constants.GET_LOCAL_PATH_ALL_API)
        Constants.GET_CARS_INFO_BY_COMPANY_API = getLocalRestAPI(apiType: Constants.CAR_API_TYPE, api: Constants.GET_CARS_INFO_BY_COMPANY_API)
        Constants.GET_CARS_INFO_BY_ID_API = getLocalRestAPI(apiType: Constants.CAR_API_TYPE, api: Constants.GET_CARS_INFO_BY_ID_API)
        Constants.ORDER_TEST_DRIVE_API = getLocalRestAPI(apiType: Constants.TEST_DRIVE_API_TYPE, api: Constants.ORDER_TEST_DRIVE_API)
    }
    
    static func getLocalRestAPI(apiType:String,api:String)->String
    {
        let localString=StringProcess.substringByString(substring: api,start: "/"+apiType)
        let result=Constants.SERVER_URL+localString
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
