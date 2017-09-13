//
//  NetworkConstants.swift
//  NetworkModule
//
//  Created by Srujan on 07/09/17.
//  Copyright © 2017 BTC. All rights reserved.
//

import Foundation
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


//Mark: WebRequestMethods

struct NetworkConnectionConstants {
    static let ConnectionTimeoutInterval = 30.0
    static let NoOfRequestRetry  = 3
    static let EnableRequestRetry = false
}

struct TrustedHosts {
    static let TrustedHost1 = ""
    static let TrustedHost2 = ""
    static let TrustedHost3 = ""
}

struct HTTPHeaderKeys {
    static let SetCookie = "Set-Cookie"
    static let ContentType = "Content-Type"
}

struct HTTPHeaderValues {
    static  let ContentTypeJson = "application/json"
}

struct NetworkURLConstants {
    //TODO: Set the server end points
    
    static let ProductionURL = "https://hphci-fdama-te-ur-01.labkey.com/fdahpUserRegWS/"
    static let DevelopmentURL = "https://hphci-fdama-te-ur-01.labkey.com/fdahpUserRegWS/"
    
}




class NetworkConstants: NSObject {
    //TODO: Configure common parameters for requests here.
    class func getCommonRequestParameters()-> Dictionary<String, Any>? {
        return nil
    }
    
    class func getCommonHeaderParameters() -> Dictionary<String, String>? {
        _ = UserDefaults.standard.value(forKey: "cookies")
        let headers : Dictionary<String, String>? =  nil
        /*
        if (cookie != nil && (cookie as AnyObject).length > 0){
            headers = ["cookie" : cookie!]
        }
        */
        return headers
    }
    
    fileprivate func getTrustedHosts()-> Array<String> {
        let array = [TrustedHosts.TrustedHost1,TrustedHosts.TrustedHost2,TrustedHosts.TrustedHost3]
        return array as Array
    }
    
    class func checkResponseHeaders(_ response : URLResponse)-> (NSInteger,String) {
        let httpResponse = response as? HTTPURLResponse
       
        let headers = httpResponse!.allHeaderFields as! Dictionary<String, Any>
        let statusCode = httpResponse!.statusCode
        var statusMessage = ""
        
        if let message = headers["StatusMessage"] {
            // now val is not nil and the Optional has been unwrapped, so use it
            statusMessage = message as! String
        }
        
        return (statusCode,statusMessage)
    }
}

