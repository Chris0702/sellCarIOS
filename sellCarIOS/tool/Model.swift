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
        case Constants.HOME_PAGE_NAME:
            releaseController();
            controller = HomeController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.HOME_WEB_URL))
        case Constants.POSTER_PAGE_NAME:
            releaseController();
            controller = PosterController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.POSTER_WEB_URL))
        case Constants.PRICE_PAGE_NAME:
            releaseController();
            controller = PriceController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.PRICE_WEB_URL))
        case Constants.TEST_DRIVE_PAGE_NAME:
            releaseController();
            controller = TestDriveController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.TEST_DRIVE_WEB_URL))
        case Constants.REFERENCE_PAGE_NAME:
            releaseController();
            controller = ReferenceController(webView: webView, model: self,urlRequest:self.getFileURLRequest(localWebURL: Constants.REFERENCE_WEB_URL))
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
