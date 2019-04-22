//
//  DevTools.swift
//  DevToolKit
//
//  Created by gaolijun on 2019/4/19.
//

import UIKit

class DevTools: NSObject {

}

enum FileSizeType {
    case B
    case KB
    case M
    case G
    case T
}

class FileSize: NSObject {
    static let sharedInstance = FileSize()
    
    let kS:CGFloat = 1024
    let mS:CGFloat = 1024 * 1024
    let gS:CGFloat = 1024 * 1024 * 1024
    let tS:CGFloat = 1024 * 1024 * 1024 * 1024
    
    func getUrlFileLength(url:String,completion:@escaping (_ length:CLongLong,_ error:NSError)->()) {
        
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
    
    func fileSize(size:CGFloat, originType:FileSizeType) -> String {
        
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
    
    func tranformFileSize(size:CGFloat,originType:FileSizeType,type:FileSizeType) -> String {
        
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
    
    func transformOriginSizeToB(size:CGFloat,originType:FileSizeType) -> CGFloat {
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


class StringTransfrom: NSObject {
    
    
    
}
