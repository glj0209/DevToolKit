//
//  DevTools.swift
//  DevToolKit
//
//  Created by gaolijun on 2019/4/19.
//

import UIKit

@objc public enum FileSizeType:Int {
    case B
    case KB
    case M
    case G
    case T
}

@objc public class FileSize: NSObject {
    @objc public static let sharedInstance = FileSize()
    
    let kS:CGFloat = 1024
    let mS:CGFloat = 1024 * 1024
    let gS:CGFloat = 1024 * 1024 * 1024
    let tS:CGFloat = 1024 * 1024 * 1024 * 1024
    
    @objc public func getUrlFileLength(url:String,completion:@escaping (_ length:CLongLong,_ error:NSError)->()) {
        
        let session = URLSession.shared
        let URL = NSURL.init(string: url)
        var request = URLRequest(url: URL! as URL)
        request.httpMethod = "HEAD"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                
                let resp = response as! HTTPURLResponse
                let dict = resp.allHeaderFields as NSDictionary
                let length = dict.object(forKey: "Content-Length") as! CLongLong
                completion(length,error! as NSError)
            }
        }
        task.resume()
    }
    
    @objc public func calculateFileSize(size:CGFloat, originType:FileSizeType) -> String {
        
        let originSizeB = transformOriginSizeToB(size: size, originType: originType)
        
        if size < kS {
            return tranformFileSize(size: originSizeB, originType: .B, type: .B)
        }else if (size < mS) {
            return tranformFileSize(size: originSizeB, originType: .B, type: .KB)
        }else if (size < gS) {
            return tranformFileSize(size: originSizeB, originType: .B, type: .M)
        }else if (size < tS) {
            return tranformFileSize(size: originSizeB, originType: .B, type: .G)
        }else {
            return tranformFileSize(size: originSizeB, originType: .B, type: .T)
        }
    }
    
    @objc public func tranformFileSize(size:CGFloat,originType:FileSizeType,type:FileSizeType) -> String {
        
        let originSize = transformOriginSizeToB(size: size, originType: originType)
        var sizeStr = "\(originSize)" + "B"
        
        switch type {
        case .B:
            
            break
        case .KB:
            sizeStr = String(format: "%.0f", originSize / kS) + "KB"
            break
        case .M:
            sizeStr = String(format: "%.1f", originSize / mS) + "M"
            break
        case .G:
            sizeStr = String(format: "%.1f", originSize / gS) + "G"
            break
        case .T:
            sizeStr = String(format: "%.1f", originSize / tS) + "T"
            break
        }
        
        return sizeStr
    }
    
    @objc public func transformOriginSizeToB(size:CGFloat,originType:FileSizeType) -> CGFloat {
        var originSize = size
        switch originType {
        case .B:
            
            break
        case .KB:
            originSize = originSize * kS
            break
        case .M:
            originSize = originSize * mS
            break
        case .G:
            originSize = originSize * gS
            break
        case .T:
            originSize = originSize * tS
            break
        }
        
        return originSize
    }
}


//
@objc public class StringTransfrom: NSObject {
    @objc public static let sharedInstance = StringTransfrom()
    
    /** object 内容为空返回 "" */
    @objc public func transformJSONStringByObject(object:Any) -> String? {
        return transformStringJSON(object: object)
    }
    
    /** object 内容为空返回 "null" */
    @objc public func transformJSONStringByObjectWithNull(object:Any) -> String? {
        return transformStringJSON(object: object)
    }
    
    /** 将object转化为JSON */
    @objc public func transformStringJSON(object:Any) -> String? {
        var data:NSData?
        do {
            data = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions(rawValue: String.Encoding.utf8.rawValue)) as NSData
        }catch {
        
        }
        let jsonStr = NSString.init(data: data! as Data, encoding: String.Encoding.utf8.rawValue)
        return jsonStr! as String
    }
    
    /** 解析本地json文件 */
    @objc public func analysisBundleFileJSON(fileName:String,fileTyoe:String) -> Any? {
        let filePath = Bundle.main.path(forResource: fileName, ofType: fileTyoe)
        if filePath == nil {
            return nil
        }
        var jsonStr:NSString? = ""
        do {
            jsonStr = try NSString(contentsOfFile: filePath!, encoding: String.Encoding.utf8.rawValue)
        } catch {
            
        }
        
        var json:Any? = nil
        do {
            json = try JSONSerialization.jsonObject(with: (jsonStr?.data(using: String.Encoding.utf8.rawValue))!, options: JSONSerialization.ReadingOptions.mutableContainers)
        } catch {
            
        }
        
        return json
    }
    
    @objc public func regularString(str:String,pattern:String) -> Bool {
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch = pred.evaluate(with: str)
        return isMatch
    }
}


@objc public class DeviceInfo: NSObject {
    @objc public static let sharedInstance = DeviceInfo()
    
    @objc public func getDeviceVersion() -> CGFloat {
        return CGFloat((UIDevice.current.systemVersion as NSString).floatValue)
    }
    
    @objc public func getAppVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    @objc public func getBuildAPPVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
}

