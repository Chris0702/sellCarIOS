//
//  Model.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/21.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation

import WebKit
import Toaster

class Model: NSObject {
    
//    var systemInfo:SystemInfoRole
//    var user:User
//    var server:Server
//    var project:Project
    var controller: Controller? = nil
    var webView: WKWebView? = nil
    var loadingView: UIImageView? = nil
    var alertLoadingViewController: UIAlertController? = nil
    var viewController :UIViewController? = nil
    //var systemData: SystemData? = nil
    //var systeminfo:SystemInfoRole = SystemInfoRole.shared()
    
    override init(){
//        systemInfo = SystemInfoRole.shared();
//        user = User()
//        server = Server()
//        project = Project()
    //systemData = SystemData()
    }
    
    func setViewController(ViewController:UIViewController)
    {
        viewController = ViewController;
    }
//    func getSysteminfo() -> SystemInfoRole{
//        return systemInfo
//    }
//
//    func getUser() -> User{
//        return user
//    }
//
//    func getServer() -> Server{
//        return server
//    }
//
//    func getProject() -> Project{
//        return project
//    }
    
    func setLoadingView(view:UIImageView)
    {
        loadingView = view;
    }
    
    func setAlertLoadingView(view:UIAlertController)
    {
        alertLoadingViewController = view;
    }
    
    func showLoadingView(show:Bool)
    {
        if((alertLoadingViewController) != nil){
            
            if(show && UIApplication.shared.delegate?.window??.rootViewController?.presentedViewController == nil){
                viewController?.present(alertLoadingViewController!, animated: true, completion: nil)
            } else {
                DispatchQueue.main.async {
                    if(UIApplication.shared.delegate?.window??.rootViewController?.presentedViewController is UIAlertController) {
                        self.viewController?.dismiss(animated: false, completion: nil)
                    }
                }
            }
            
            /*if(show && !(loadingView?.isAnimating)!)
             {
             loadingView?.startAnimating();
             }
             else
             {
             Thread.detachNewThreadSelector(#selector(self.stopLoadingView),
             toTarget: self, with: nil)
             }*/
        }
    }
    
    func stopLoadingView(){
        self.loadingView?.stopAnimating();
    }
    
//    func isLogin()->Bool
//    {
//        if((systemInfo.value(forKey: Constants.SYSTEM_INFO_IS_LOGIN_SQL) as! Bool) == true){
//            return true;
//        }else{
//            return false;
//        }
//
//    }
//
//    func logout()
//    {
//        systemInfo.setValue(false, forKey: Constants.SYSTEM_INFO_IS_LOGIN_SQL)
//        systemInfo.updateSystemInfo()
//    }
//
//
//    func updateApnsToken(newToken:String)
//    {
//        systemInfo.setValue(newToken, forKey: Constants.SYSTEM_INFO_APNS_TOKEN_SQL)
//        systemInfo.updateSystemInfo()
//    }
//
//    func updateFirebaseToken(newToken:String)
//    {
//        systemInfo.setValue(newToken, forKey: Constants.SYSTEM_INFO_FIREBASE_TOKEN_SQL)
//        systemInfo.updateSystemInfo()
//    }
    
    func getFileURLRequest(localWebURL:String) -> URLRequest
    {
        let url = Bundle.main.url(forResource: localWebURL, withExtension: Constants.HTML, subdirectory: Constants.WEB_LOCAL_DIRECTORY)
        print(url)
        let request = NSURLRequest(url: url!)
        return request as URLRequest
    }
    
    func getHttpURLRequest(localWebURL:String) -> URLRequest
    {
        let url = NSURL(string: localWebURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        let request = NSURLRequest(url: url! as URL)
        return request as URLRequest
    }
    
    func changeViewController(viewControllerName:String)
    {
        switch viewControllerName {
        case Constants.VIEW_CONTROLLER_NAME :
            //viewController?.present(ViewController(), animated: true, completion: nil)
            DispatchQueue.main.async {
                self.viewController?.dismiss(animated: false, completion: nil)
            }
            break;
        case Constants.DASHBOARD_VIEW_VIEW_CONTROLLER_NAME :
//            viewController?.present(DashboardViewViewController(), animated: true, completion: nil)
            Constants.GO_HOME_PAGE = true
            break;
        default:
            break
        }
    }
    
    func releaseController()
    {
//        controller?.releaseResource()
//        controller = nil
    }
    
    func changePage(webView: WKWebView, page:String)
    {
        print("change page to : \(page)");
        switch page {
//        case Constants.LOGIN_PAGE_NAME:
//            releaseController();
//            controller = LoginController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.LOGIN_LOCAL_WEB_URL),alarmSummary:false)
        case Constants.HOME_PAGE_NAME:
            releaseController();
            print("change page to 222222: \(page)");
            controller = HomeController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.HOMEL_WEB_URL))
//        case Constants.CONFIG_PAGE_NAME:
//            releaseController();
//            controller = ConfigController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.CONFIG_LOCAL_WEB_URL))
//        case Constants.ALARM_LOG_PAGE_NAME:
//            releaseController();
//            controller = AlarmLogController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.ALARM_LOG_LOCAL_WEB_URL))
//        case Constants.ACTION_LOG_PAGE_NAME:
//            releaseController();
//            controller = ActionLogController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.ACTION_LOG_LOCAL_WEB_URL))
//        case Constants.ALARM_SUMMARY_LOG_PAGE_NAME:
//            releaseController();
//            controller = AlarmSummaryController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.ALARM_SUMMARY_LOG_LOCAL_WEB_URL))
//        case Constants.TREND_LIST_PAGE_NAME:
//            releaseController();
//            controller = TrendListController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.TREND_LIST_LOCAL_WEB_URL))
//        case Constants.TREND_PAGE_NAME:
//            releaseController();
//            controller = TrendController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.TREND_LOCAL_WEB_URL))
//        case Constants.TAGS_INFO_GROUP_PAGE_NAME:
//            releaseController();
//            controller = TagsInfoGroupController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.TAGS_INFO_GROUP_LOCAL_WEB_URL))
//        case Constants.TAGS_INFO_LIST_PAGE_NAME:
//            releaseController();
//            controller = TagsInfoListController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.TAGS_INFO_LIST_LOCAL_WEB_URL))
//        case Constants.TAGS_INFO_VALUE_PAGE_NAME:
//            releaseController();
//            controller = TagsInfoValueController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.TAGS_INFO_VALUE_LOCAL_WEB_URL))
//        case Constants.NODE_STATUS_PAGE_NAME:
//            releaseController();
//            controller = NodeStatusController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.NODE_STATUS_LOCAL_WEB_URL))
//        case Constants.DASHBOARD_VIEW_PAGE_NAME:
//            //releaseController();
//            controller?.releaseResource()
//            changeViewController(viewControllerName:Constants.DASHBOARD_VIEW_VIEW_CONTROLLER_NAME)
//        // 2018.05.24 Elvis for gmap and bmap
//        case Constants.MAP_LIST_PAGE_NAME:
//            releaseController()
//            controller = MapListController(webView: webView, model: self, urlRequest: self.getFileURLRequest(localWebURL: Constants.MAP_LIST_LOCAL_WEB_URL))
//        case Constants.G_MAP_PAGE_NAME:
//            releaseController()
//            let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String
//            print("countryCode: \(String(describing: countryCode))")
//            if let code = countryCode, code.lowercased() == "cn" {
//                controller = MapController(webView: webView, model: self, urlRequest: self.getFileURLRequest(localWebURL: Constants.MAP_IN_CHINA_LOCAL_WEB_URL))
//            } else {
//                controller = MapController(webView: webView, model: self, urlRequest: self.getFileURLRequest(localWebURL: Constants.MAP_LOCAL_WEB_URL))
//            }
//        case Constants.B_MAP_PAGE_NAME:
//            releaseController()
//            controller = MapController(webView: webView, model: self, urlRequest: self.getFileURLRequest(localWebURL: Constants.BAIDU_MAP_LOCAL_WEB_URL))
//        // 2018.06.13 Elvis for data log list
//        case Constants.DATA_LOG_LIST_PAGE_NAME:
//            releaseController()
//            controller = DataLogListController(webView: webView, model: self, urlRequest: self.getFileURLRequest(localWebURL: Constants.DATA_LOG_LIST_PAGE_NAME))
//        // 2018.06.15 Elvis for data log
//        case Constants.DATA_LOG_PAGE_NAME:
//            releaseController()
//            controller = DataLogController(webView: webView, model: self, urlRequest: self.getFileURLRequest(localWebURL: Constants.DATA_LOG_PAGE_NAME))
//            //if let v = viewController {
//            //    v.performSegue(withIdentifier: "showDataLog", sender: self)
//        //}
//        case Constants.DATA_LOG_SETTING_PAGE_NAME:
//            //controller = DataLogSettingController(webView: webView, model: self, urlRequest: self.getFileURLRequest(localWebURL: Constants.DATA_LOG_SETTING_PAGE_NAME))
//            if let v = viewController {
//                v.performSegue(withIdentifier: "showDataLogSetting", sender: self)
//            }
        default:
            Toast(text: "頁面尚未實作").show()
            break
        }
        self.webView = webView;
    }
    
    func ToastShow(text: String)
    {
        Toast(text: text).show()
    }
    
    func goToAlarmSummaryPage()
    {
//        controller?.releaseResource()
//        controller = nil
//        controller = LoginController(webView: self.webView!, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.LOGIN_LOCAL_WEB_URL),alarmSummary:true)
    }
    
    //func systemDataAction(projectName:String,serverToken:String)
    //{
    //systemData?.systemDataSocket(projectName: projectName, serverToken: serverToken)
    //}
    
    //func systemDataShutDown()
    //{
    //systemData?.releaseResource()
    //}
    
    func scriptCallbackHandler(funcMsgDic:Dictionary<String, Any>, msg:Dictionary<String, Any>)  {
//        controller?.scriptCallbackHandler(funcMsgDic:funcMsgDic, msg: msg)
    }
}
