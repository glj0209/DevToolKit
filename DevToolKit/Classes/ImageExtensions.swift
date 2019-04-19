//
//  ImageExtensions.swift
//  DevToolKit
//
//  Created by gaolijun on 2019/4/18.
//

import UIKit

extension UIImage {
    
    func imageWithColor(color:UIColor) -> UIImage {
        let imageW:CGFloat = 10.0
        let imageH:CGFloat = 10.0
        
        // 1.开启基于位图的图形上下文
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageW, height: imageH), false, 0.0)
        
        // 2.画一个color颜色的矩形框
        color.set()
        UIRectFill(CGRect(x: 0, y: 0, width: imageW, height: imageH))
        
        // 3.拿到图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        // 4.关闭上下文
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func resizedImage(name:String) -> UIImage {
        let image = UIImage(named: name)
        return (image?.stretchableImage(withLeftCapWidth: Int(image?.size.width ?? 0.0 * 0.5), topCapHeight: Int(image?.size.height ?? 0.0 * 0.5)))!
    }
    
    func rotationImage(image:UIImage, orientation:UIImageOrientation) -> UIImage {
        var rotate:Double = 0.0
        var rect:CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        var translateX:CGFloat = 0.0
        var translateY:CGFloat = 0.0
        var scaleX:CGFloat = 1.0
        var scaleY:CGFloat = 1.0
        
        switch orientation {
        case .left:
            rotate = Double.pi/2
            rect = CGRect(x: 0, y: 0, width: image.size.height, height: image.size.width)
            translateX = 0
            translateY = -rect.size.width
            scaleY = rect.size.width/rect.size.height
            scaleX = rect.size.height/rect.size.width
            break
        case .right:
            rotate = Double.pi/2 * 3
            rect = CGRect(x: 0, y: 0, width: image.size.height, height: image.size.width)
            translateX = -rect.size.height
            translateY = 0
            scaleY = rect.size.width/rect.size.height
            scaleX = rect.size.height/rect.size.width
            break
        case .down:
            rotate = Double.pi
            rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
            translateX = -rect.size.width
            translateY = -rect.size.height
            break
        default:
            rotate = 0
            rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
            translateX = 0
            translateY = 0
            break
        }
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // 做CTM变换
        context.translateBy(x: 0.0, y: rect.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.rotate(by: CGFloat(rotate))
        context.translateBy(x: translateX, y: translateY)
        context.scaleBy(x: scaleX, y: scaleY)
        context.draw(image.cgImage!, in: CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height), byTiling: true)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        return newImage!
    }
    
    func imageUserToCompressForSizeImage(image:UIImage, newSize:CGSize) -> UIImage {
        
        var newImage:UIImage?
        
        let originalSize = image.size
        let originalWidth = originalSize.width
        let originalHeight = originalSize.height
        
        if originalWidth <= size.width && originalHeight <= size.height {
            newImage = image
        }else {
            let scale = size.width/originalWidth < size.height/originalHeight ? size.width/originalWidth:size.height/originalHeight
            let newImageSize = CGSize(width: originalWidth*scale, height: originalHeight*scale + 10.0)
            UIGraphicsBeginImageContextWithOptions(CGSize(width: newImageSize.width, height: newImageSize.height), false, 0)
            image.draw(in: CGRect(x: 0, y: 0, width: newImageSize.width, height: newImageSize.height), blendMode: .normal, alpha: 1.0)
            newImage = UIGraphicsGetImageFromCurrentImageContext()
            
            if newImage == nil {
                newImage = image
            }
            UIGraphicsEndImageContext()
        }
        return newImage!
    }
    
}
