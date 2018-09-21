//
//  Constants.swift
//  sellCarIOS
//
//  Created by 蔣政言 on 2018/9/21.
//  Copyright © 2018年 Chris. All rights reserved.
//

import Foundation

class Constants {
    
    public static var SERVER_URL: String = "";
    
    public static let APNS_PRODUCTION_TYPE: String = "production";
    public static let APNS_DEVELOPMENT_TYPE: String = "development";
    
    //javascript
    public static let IOS_PARAMETER_FOR_JAVASCRIPT: String = "callIosNativeApp";
    public static let JAVASCRIPT_PARAMETER_FOR_IOS: String = "jsAppInterface";
    public static let INSERT_IP_HISTORY_LIST_JAVASCRIPT = "insertIpHistoryList";
    public static let INSERT_ACCOUNT_HISTORY_LIST_JAVASCRIPT = "insertAccountHistoryList";
    public static let INSERT_PROJECT_LIST_JAVASCRIPT = "insertProjectList";
    public static let INSERT_FUNCTION_LIST_JAVASCRIPT = "insertFunctionList";
    public static let INSERT_ALARM_SUMMARY_JAVASCRIPT = "insertAlarmSummary";
    public static let CB_ACCOUNT_LOGIN_JAVASCRIPT = "cbAccountLogin";
    public static let INSERT_NODE_LIST_JAVASCRIPT = "insertNodeList";
    public static let INSERT_NODE_STATUS_JAVASCRIPT = "insertNodeStatus";
    public static let INSERT_ALARM_LOG_JAVASCRIPT = "insertAlarmLog";
    public static let INSERT_ACTION_LOG_JAVASCRIPT = "insertActionLog";
    public static let ALARM_ACK_ALL_STATUS_JAVASCRIPT = "alarmAckAllStatus";
    public static let INSERT_TAGS_LIST_JAVASCRIPT = "insertTagsList";
    public static let INSERT_TAG_VALUE_JAVASCRIPT = "insertTagValue";
    public static let INSERT_LANGUAGE_JAVASCRIPT = "insertLanguage";
    public static let INSERT_VERSION_JAVASCRIPT = "insertVersion";
    public static let INSERT_LOCAL_STORAGE_MEM_ALL_JAVASCRIPT = "insertLocalStorageMemAll";
    public static let INSERT_LOCAL_STORAGE_MEM_JAVASCRIPT = "insertLocalStorageMem";
    public static let INSERT_R_TREND_ID_JAVASCRIPT = "insertRTrendId";
    public static let INSERT_R_TREND_CONFIG_JAVASCRIPT = "insertRTrendConfig";
    public static let INSERT_REAL_TIME_TAG_VALUES_JAVASCRIPT = "insertRealTimeTagValues";
    public static let INSERT_TAGS_DATA_JAVASCRIPT = "insertTagsData";
    // 2018.05.24 Elvis for gmap and bmap
    public static let INSERT_SELECTED_NODE_JAVASCRIPT = "insertSelectedNode"
    public static let INSERT_MAP_LIST_BY_NODE_JAVASCRIPT = "insertMapListByNode"
    public static let INSERT_MAP_CONFIG_JAVASCRIPT = "insertMapConfig"
    // 2018.06.13 Elvis for data log list
    public static let INSERT_DATA_LOG_LIST_BY_NODE_JAVASCRIPT = "insertHisTrendGroupId"
    // 2018.06.15 Elvis for data log
    public static let INSERT_DATA_LOG_JAVASCRIPT = "insertDataLog"
    
    //socket
    public static let SOCKET_PATH = "/WADashboard/socket.io";
    public static let ACTION_LOG_NSP = "/actionlog";
    public static let ALARM_LOG_NSP = "/alarmlog";
    public static let ALARM_SUMMARY_LOG_NSP = "/alarmSummary";
    public static let DATA_NSP = "/data";
    public static let SYSTEM_DATA_NSP = "/systemData";
    public static let NODE_STATUS_NSP = "/nodeStatus";
    public static let SOCKET_SUBSCRIBE_EVENT = "subscribe";
    public static let SOCKET_STREAM_EVENT = "stream";
    public static let SOCKET_AUTHENTICATION_EVENT = "authentication";
    public static let SOCKET_AUTHENTICATED_EVENT = "authenticated";
    public static let SOCKET_CONNECT_EVENT = "connect";
    
    //page
    public static let CONTROL_PAGE_NAME: String = "Controller";
    public static let ACTION_LOG_PAGE_NAME: String = "actionLog";
    public static let ALARM_LOG_PAGE_NAME: String = "alarmLog";
    public static let ALARM_SUMMARY_LOG_PAGE_NAME: String = "alarmSummary";
    public static let CONFIG_PAGE_NAME: String = "config";
    public static let HOME_PAGE_NAME: String = "homePage";
    public static let IP_INPUT_PAGE_NAME: String = "ipInput";
    public static let LOGIN_PAGE_NAME : String = "login";
    public static let SINGLE_VALUE_PAGE_NAME: String = "singleValue";
    public static let TAGS_INFO_GROUP_PAGE_NAME: String = "tagsInfoGroup";
    public static let TAGS_INFO_LIST_PAGE_NAME: String = "tagsInfoList";
    public static let TAGS_INFO_VALUE_PAGE_NAME: String = "tagsInfoValue";
    public static let TAGS_INFO_PAGE_NAME: String = "tagsInfo";
    public static let TREND_PAGE_NAME: String = "trend";
    public static let TREND_LIST_PAGE_NAME: String = "trendList";
    public static let G_MAP_PAGE_NAME: String = "map";
    public static let NODE_STATUS_PAGE_NAME: String = "nodeStatus";
    public static let DASHBOARD_VIEW_PAGE_NAME: String = "dashboard";
    // 2018.05.29 Elvis for gmap and bmap
    public static let MAP_LIST_PAGE_NAME = "mapList"
    public static let B_MAP_PAGE_NAME = "bmapPage"
    // 2018.06.13 Elvis for data log trend
    public static let DATA_LOG_SETTING_PAGE_NAME = "dataLogSetting"
    public static let DATA_LOG_LIST_PAGE_NAME = "dataLogList"
    public static let DATA_LOG_PAGE_NAME = "dataLog"
    
    //page config
    public static var GO_HOME_PAGE: Bool = false;
    
    //viewController
    public static let VIEW_CONTROLLER_NAME: String = "viewController";
    public static let DASHBOARD_VIEW_VIEW_CONTROLLER_NAME: String = "dashboardViewViewController";
    
    //local web url
    public static let HOMEL_WEB_URL: String = "home";
    
    
    public static let ACTION_LOG_LOCAL_WEB_URL: String = "actionLog";
    public static let ALARM_LOG_LOCAL_WEB_URL: String = "alarmLog";
    public static let ALARM_SUMMARY_LOG_LOCAL_WEB_URL: String = "alarmSummary";
    public static let NODE_STATUS_LOCAL_WEB_URL: String = "nodeStatus";
    //public static let SINGLE_VALUE_LOCAL_URL: String = "file:///android_asset/login.html";
    public static let CONFIG_LOCAL_WEB_URL: String = "config";
    public static let HOME_LOCAL_WEB_URL: String = "home";
    public static let LOGIN_LOCAL_WEB_URL: String = "login";
    public static let TREND_LOCAL_WEB_URL: String = "trend";
    public static let TREND_LIST_LOCAL_WEB_URL: String = "trendList";
    public static let TAGS_INFO_GROUP_LOCAL_WEB_URL: String  = "tagsInfoGroup";
    public static let TAGS_INFO_LIST_LOCAL_WEB_URL: String  = "tagsInfoList";
    public static let TAGS_INFO_VALUE_LOCAL_WEB_URL : String = "tagsInfoValue";
    public static let WEB_LOCAL_DIRECTORY: String = "GUI";
    public static var DASHBOARD_VIEW_WEB_URL: String = "wadashboard/dashboardviewer";
    // 2018.05.23 Elvis for gmap and bmap
    public static let MAP_LOCAL_WEB_URL = "map"
    public static let MAP_IN_CHINA_LOCAL_WEB_URL = "mapInChina"
    public static let BAIDU_MAP_LOCAL_WEB_URL = "bmapPage"
    public static let MAP_LIST_LOCAL_WEB_URL = "mapList"
    // 2018.06.13 Elvis for data log trend
    public static let DATA_LOG_SETTING_LOCAL_WEB_URL = "dataLogSetting"
    public static let DATA_LOG_LIST_LOCAL_WEB_URL = "dataLogList"
    public static let DATA_LOG_LOCAL_WEB_URL = "dataLog"
    
    //table user sql
    public static let TABLE_USER_SQL = "User";
    public static let USER_ID_SQL = "UserId";
    public static let USER_USERNAME_SQL = "username";
    public static let USER_PASSWORD_SQL = "password";
    public static let USER_PROJECT_NAME_SQL = "projectName";
    public static let USER_SERVER_TOKEN_SQL = "serverToken";
    public static let USER_SERVER_IP_SQL = "ip";
    public static let USER_TABLE_CREATE_SQL = "CREATE TABLE ";
    
    //table project sql
    public static let TABLE_PROJECT_SQL = "Project";
    public static let PROJECT_ID_SQL = "ProjectId";
    public static let PROJECT_IP_SQL = "ip";
    public static let PROJECT_NAME_SQL = "projectName";
    
    //table server sql
    public static let TABLE_SERVER_SQL = "Server";
    public static let SERVER_IP_SQL = "ip";
    public static let SERVER_FIREBASE_TOKEN_ENABLE_SQL = "firebaseTokenEnable";
    public static let SERVER_UUID_SQL = "UUID";
    
    //table systeminfo sql
    public static let TABLE_SYSTEM_INFO_SQL = "SystemInfo";
    public static let SYSTEM_INFO_ID: String  = "id";
    public static let SYSTEM_INFO_FIREBASE_TOKEN_SQL = "firebaseToken";
    public static let SYSTEM_INFO_APNS_TOKEN_SQL = "apnsToken";
    public static let SYSTEM_INFO_LAST_IP_SQL = "lastIP";
    public static let SYSTEM_INFO_LAST_USERNAME_SQL = "lastUsername";
    public static let SYSTEM_INFO_LAST_PASSWORD_SQL = "lastPassword";
    public static let SYSTEM_INFO_LAST_PROJECT_NAME_SQL = "lastProjectName";
    public static let SYSTEM_INFO_IS_LOGIN_SQL: String = "isLogin";
    public static let SYSTEM_INFO_ACTION_LOG_PAGE_NAME_SQL = "actionLogPage";
    public static let SYSTEM_INFO_ALARM_LOG_PAGE_NAME_SQL = "alarmLogPage";
    public static let SYSTEM_INFO_ALARM_SUMMARY_LOG_PAGE_NAME_SQL = "alarmSummaryPage";
    public static let SYSTEM_INFO_TREND_PAGE_NAME_SQL = "trendPage";
    public static let SYSTEM_INFO_DASHBOARD_PAGE_NAME_SQL = "dashboardPage";
    public static let SYSTEM_INFO_TAGS_INFO_PAGE_NAME_SQL = "tagsInfoPage";
    public static let SYSTEM_INFO_G_MAP_PAGE_NAME_SQL = "gMapPage";
    public static let SYSTEM_INFO_NODE_STATUS_PAGE_NAME_SQL = "nodeStatusPage";
    public static let SYSTEM_INFO_LAST_SERVER_TOKEN_SQL = "lastServerToken";
    public static let SYSTEM_INFO_LANGUAGE_SQL = "language";
    public static let SYSTEM_INFO_DEVICE_ID_SQL = "deviceID";
    
    // 2018.06.13 Elvis for data log trend
    public static let SYSTEM_INFO_DATA_LOG_PAGE_NAME_SQL = "dataLogPage";
    
    //controller command
    public static let INPUT_CONNECT_IP_COMMAND: String = "inputConnectIP";
    public static let GET_IP_HISTORY_LIST_COMMAND: String = "getIpHistoryList";
    public static let INPUT_ACCOUNT_COMMAND: String = "inputAccount";
    public static let GET_ACCOUNT_HISTORY_LIST_COMMAND: String = "getAccountHistoryList";
    public static let GET_PROJECT_LIST_COMMAND: String = "getProjectList";
    public static let GET_FUNCTION_LIST_COMMAND: String = "getFunctionList";
    public static let GET_ALARM_SUMMARY_BY_PAGE_COMMAND: String = "getAlarmSummaryByPage";
    public static let GET_PROJECT_LIST_BY_IP_COMMAND: String = "getProjectListByIp";
    public static let GET_NODE_STATUS_COMMAND: String = "getNodeStatus";
    public static let GET_NODE_LIST_COMMAND: String = "getNodeList";
    public static let GET_ALARM_LOG_AND_COUNT_COMMAND: String = "getAlarmLogAndCount";
    public static let GET_ACTION_LOG_AND_COUNT_COMMAND: String = "getActionLogAndCount";
    public static let SAVE_FUNCTION_LIST_COMMAND: String = "saveFunctionList";
    public static let ALARM_ACK_COMMAND: String = "alarmAck";
    public static let ALARM_ACK_ALL_LIST_COMMAND: String = "alarmAckAll";
    public static let GET_TAGS_LIST_BY_PAGE_COMMAND: String = "getTagsListByPage";
    public static let GET_TAG_VALUE_COMMAND: String = "getTagValue";
    public static let CHANGE_PAGE_COMMAND: String = "changePage";
    public static let LOG_OUT_COMMAND: String = "logout";
    public static let SET_TAG_VALUE_COMMAND: String = "setTagValue";
    public static let GET_LANGUAGE_COMMAND = "getLanguage";
    public static let SET_LANGUAGE_COMMAND = "setLanguage";
    public static let GET_VERSION_COMMAND = "getVersion";
    public static let GET_R_TREND_GROUP_ID_COMMAND = "getRTrendGroupId";
    public static let GET_R_TREND_CONFIG_COMMAND = "getRTrendConfig";
    public static let GET_REAL_TIME_TAG_VALUES_COMMAND = "getRealTimeTagValues";
    public static let GET_TAGS_DATA_COMMAND = "getTagsData";
    
    public static let GET_LOCAL_STORAGE_MEM_ALL_COMMAND = "getLocalStorageMemAll";
    public static let GET_LOCAL_STORAGE_MEM_COMMAND = "getLocalStorageMem";
    public static let SET_LOCAL_STORAGE_MEM_COMMAND = "setLocalStorageMem";
    public static let REMOVE_LOCAL_STORAGE_MEM_COMMAND = "removeLocalStorageMem";
    
    // 2018.05.23 Elvis for gmap and bmap
    public static let GET_SELECTED_NODE_COMMAND = "getSelectedNode"
    public static let GET_MAP_LIST_BY_NODE_COMMAND = "getMapListByNode"
    public static let GET_MAP_CONFIG = "getMapConfig"
    // 2018.06.13 Elvis for data log list
    public static let GET_HIS_TREND_GROUP_ID_COMMAND = "getHisTrendGroupId"
    
    //loadingView
    public static let IMAGE_PROGRESS_0_LOADING_VIEW: String = "progress_0.png";
    public static let IMAGE_PROGRESS_1_LOADING_VIEW: String = "progress_1.png";
    public static let IMAGE_PROGRESS_2_LOADING_VIEW: String = "progress_2.png";
    public static let IMAGE_PROGRESS_3_LOADING_VIEW: String = "progress_3.png";
    public static let IMAGE_PROGRESS_4_LOADING_VIEW: String = "progress_4.png";
    public static let IMAGE_PROGRESS_5_LOADING_VIEW: String = "progress_5.png";
    public static let IMAGE_PROGRESS_6_LOADING_VIEW: String = "progress_6.png";
    public static let IMAGE_PROGRESS_7_LOADING_VIEW: String = "progress_7.png";
    public static let WIDTH_LOADING_VIEW = 70;
    public static let HEIGHT_LOADING_VIEW = 70;
    public static let DURATIONN_LOADING_VIEW = 0.8;
    
    //util
    public static let HTML: String  = "html";
    public static let FUNCNAME: String = "funcName";
    public static let HTTP: String = "http:";
    public static let HTTPS: String = "https:";
    public static let SLASH: String = "//";
    public static let EMPTY_STRING: String = "";
    public static let ZERO_STRING: String = "0";
    public static let IP: String = "ip";
    public static let USERNAME: String = "username";
    public static let ACCOUNT: String = "account";
    public static let PASSWORD: String = "password";
    public static let REMEMBER: String = "remember";
    public static let TYPE: String = "type";
    public static let PROJECT_NAME: String = "projectName";
    public static let PROJECT_NAME_1: String = "projectName1";
    public static let PROJECT: String = "project";
    public static let TRUE_STRING: String = "true";
    public static let FALSE_STRING: String = "false";
    public static let FIREBASE_TOKEN: String = "firebaseToken";
    public static let DOUBLE_QUOTES: String="\"";
    public static let JAVASCRIPT="javascript";
    public static let IP_LIST: String="ipList";
    public static let PROJECT_LIST: String="projectList";
    public static let ACCOUNT_LIST: String="accountList";
    public static let FUNCTION_LIST: String="funcList";
    public static let EＭPTY_STRING: String = "";
    public static let RESULT_REST_API:String = "resStatus";
    public static let RES_STRING_REST_API:String = "resString";
    public static let TOKEN:String = "token";
    public static let VERSION:String = "version";
    public static let ALARM_LOG:String = "alarmLog";
    public static let ALARM_SUMMARY:String = "alarmSummary";
    public static let ACTION_LOG:String = "actionLog";
    public static let TREND:String = "trend";
    public static let TREND_CONFIG:String = "trendConfig";
    public static let TREND_GROUP_ID:String = "trendGroupId";
    public static let DASHBOARD:String = "dashboard";
    public static let TAGS_INFO:String = "tagsInfo";
    // 2018.05.23 Elvis modefied G_MAP = "gMap" to "map"
    public static let G_MAP = "map";
    public static let DATA_LOG = "dataLog";
    // 2018.05.24 Elvis for gmap and bmap
    public static let NAME = "name"
    public static let MAP_LIST = "mapList"
    public static let MAP_TYPE = "mapType"
    public static let MAP_NAME = "mapName"
    public static let SELECTED_NODE = "selectedNode"
    // 2018.06.22 Elvis for data log
    public static let DATA_LOG_SCADA_NODE = "dataLogScadaNode"
    public static let GROUP_NBR = "groupNbr"
    
    public static let NODE_STATUS:String = "nodeStatus";
    public static let TRUE_String: String  = "true";
    public static let FALSE_String: String  = "false";
    public static let NODE_LISTS: String  = "nodeLists";
    public static let TREND_LIST: String  = "trendList";
    public static let COUNT: String  = "count";
    public static let START: String  = "start";
    public static let NODE_NAME: String  = "nodeName";
    public static let COOKIE: String  = "cookie";
    public static let FILTERS: String  = "filters";
    public static let TAGS_LIST: String  = "tagsList";
    public static let TOTAL_COUNT: String  = "totalCount";
    public static let TAG_INFOS: String  = "tagInfos";
    public static let TAGS_UPPERCASE: String  = "Tags";
    public static let TAGS_LOWERCASE: String  = "tags";
    public static let TAGS_DATA: String  = "tagsData";
    public static let INTERVAL: String  = "Interval";
    public static let RECORDS: String  = "Records";
    public static let LANG: String  = "lang";
    public static let BAIDU_NOTIFICATION_CHANNEL_ID: String  = "baiduNotificationChannelId";
    public static let URL: String  = "url";
    public static let KEY: String  = "key";
    public static let VALUE: String  = "value";
    // 2018.06.13 Elvis for data log list
    public static let DATA_LOG_LIST = "dataLogList"
    
    //rest api
    public static var READ_PROJECT_LIST_REST_API =  "/WADashboard/api/dashboard/v1/mainframes/readProjectList";
    public static var GET_WEBACCESS_PROJECT_LIST_API =  "/WADashboard/api/dashboard/v6/waConfig/getWebAccessProjectList";
    public static var GET_VERSION_API =  "/WADashboard/api/dashboard/v6/waConfig/getDashReVer";
    public static var GET_DASHBOARD_TOKEN_REST_API = "/WADashboard/api/dashboard/v6/auth/getToken";
    public static var SAVE_MOBILE_INFO_REST_API = "/WADashboard/api/dashboard/v1/mobile/saveMobileInfo";
    public static var GET_NODE_LIST_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getNodeList";
    public static var ALARM_ACK_ALL_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/alarmAckAll";
    public static var ALARM_ACK_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/alarmAck";
    public static var GET_TAG_LIST_BY_PAGE_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getTagListByPage";
    public static var UPDATE_NOTIFICATION_REST_API = "/WADashboard/api/dashboard/v1/mobile/updateNotification";
    public static var SET_TAG_VALUES_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/setTagValues";
    public static var SUBSCRIBE_NOTIFY_REST_API = "/WADashboard/api/dashboard/v1/mobile/subscribeNotify";
    public static var UNSUBSCRIBE_NOTIFY_REST_API = "/WADashboard/api/dashboard/v6/mobile/unSubscribeNotify";
    public static var GET_R_TREND_GROUP_ID_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getRTrendGroupId";
    public static var GET_R_TREND_CONFIG_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getRTrendConfig";
    public static var GET_TAGS_DATA_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getTagsData";
    // 2018.05.24 Elvis for gmap and bmap
    public static var GET_GOOGLE_MAP_LIST_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getGoogleMapList"
    public static var GET_BAIDU_MAP_LIST_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getBaiduMapList"
    public static var GET_GOOGLE_MAP_CONFIG_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getGoogleMapConfig"
    public static var GET_BAIDU_MAP_CONFIG_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getBaiduMapConfig"
    // 2018.06.13 Elvis for data log list
    public static var GET_HIS_TREND_GROUP_ID_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getHisTrendGroupId"
    public static var GET_HIS_TREND_CONFIG_REST_API = "/WADashboard/api/dashboard/v1/tagAjaxAction/getHisTrendConfig"
}
