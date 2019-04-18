//
//  ColorExtensions.swift
//  DevToolKit
//
//  Created by gaolijun on 2019/4/18.
//

import UIKit

extension UIColor {
    
    convenience init(hexString:String, alpha:CGFloat) {
        var colorStr = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased() as NSString
        if colorStr.length < 6 {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            return
        }
        
        if colorStr.hasPrefix("0X") {
            colorStr = colorStr.substring(from: 2) as NSString
        }
        
        if colorStr.hasPrefix("#") {
            colorStr = colorStr.substring(from: 1) as NSString
        }
        
        if colorStr.length != 6 {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            return
        }
        
        var range:NSRange = NSRange(location: 0, length: 2)
        range.location = 0
        range.length = 2
        
        let redStr = colorStr.substring(with: range)
        
        range.location = 2
        let greenStr = colorStr.substring(with: range)
        
        range.location = 4
        let blueStr = colorStr.substring(with: range)
        
        var r:CUnsignedInt = 0
        var g:CUnsignedInt = 0
        var b:CUnsignedInt = 0
        
        Scanner(string: redStr).scanHexInt32(&r)
        Scanner(string: greenStr).scanHexInt32(&g)
        Scanner(string: blueStr).scanHexInt32(&b)
        
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
    convenience init(hexString:String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
}
