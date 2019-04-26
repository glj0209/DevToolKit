//
//  AttritueTextExtension.swift
//  DevToolKit
//
//  Created by gaolijun on 2019/4/25.
//

import UIKit

class AttritueTextExtension: NSObject {
    static let sharedInstance = AttritueTextExtension()
    
    /** 设置lable的行间距 */
    func setAttributedTitleString(title:String,label:UILabel,sapace:CGFloat,aligment:NSTextAlignment?) {
        let attributedString = NSMutableAttributedString(string: title)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = sapace
        if aligment != nil {
            paragraphStyle.alignment = aligment!
        }
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: title.count))
        label.attributedText = attributedString
        label.sizeToFit()
    }
    
    /**
     *  设置带有高亮标签的字符串
     *  string: 带有高亮标签的字符串,如: “大家好呀,我叫<hot>你好</hot>,很高兴见到到家”
     *  startTag: 如上的<hot>
     *  endTag: 如上的</hot>
     *  normalColor: 普通文字颜色
     *  highlightColor: 高亮文字颜色
     */
    func setHighlightedString(string:String,startTag:String,endTag:String,highlightColor:UIColor?,normalColor:UIColor?) -> NSAttributedString {
        
        let array = string.split(separator: Character.init(startTag))
        let norDic = [NSAttributedStringKey.foregroundColor:normalColor ?? UIColor.black]
        let higDic = [NSAttributedStringKey.foregroundColor:highlightColor ?? UIColor.red]
        
        let dicArray = NSMutableArray()
        let strArray = NSMutableArray()
        
        for k in 0..<array.count {
            
            let ss = String(array[k])
            if ss.count == 0 {
                
            }else {
                let aArray = ss.split(separator: Character.init(endTag))
                
                if aArray.count > 1 {
                    
                    strArray.add(aArray[0])
                    dicArray.add(higDic)
                    
                    let seStr = aArray[1]
                    if seStr.count > 0 {
                        strArray.add(aArray[1])
                        dicArray.add(norDic)
                    }
                    
                }else {
                    strArray.add(ss)
                    dicArray.add(norDic)
                }
            }
            
        }
        
        return NSAttributedString(stringArray: strArray, attributeArray: dicArray)
    }
    
}

extension NSAttributedString {
    
    /** 根据string数组和zattribute数组,生成attritue富文本字符串 */
    convenience init(stringArray:NSArray,attributeArray:NSArray) {
        
        if stringArray.count == 0 || attributeArray.count == 0 || (stringArray.count != attributeArray.count) {
            self.init(string: "")
        }else {
            var attributedString:NSMutableAttributedString? = nil
            var str = ""
            
            for k in 0..<stringArray.count {
                str = str + (stringArray[k] as! String)
            }
            
            attributedString = NSMutableAttributedString(string: str)
            
            var no:NSInteger = 0
            for i in 0..<stringArray.count {
                let s = stringArray[i] as! String
                attributedString?.setAttributes(attributeArray[i] as? [NSAttributedStringKey : Any], range: NSRange(location: no, length: s.count))
                no += s.count
            }
            
            self.init(attributedString: attributedString!)
        }
    }
}
