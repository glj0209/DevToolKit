//
//  ButtonExtensions.swift
//  DevToolKit
//
//  Created by gaolijun on 2019/4/18.
//

import UIKit

enum ButtonEdgeInsetsStyle {
    case Top
    case Left
    case Right
    case Bottom
}

extension UIButton {
    
    func layoutButtonWithEdgeInsetsStyle(style:ButtonEdgeInsetsStyle,space:CGFloat) {
        let imageWith = self.imageView?.frame.size.width ?? 0.0
        let imageHeight = self.imageView?.frame.size.height ?? 0.0
        
        var labelWidth:CGFloat = 0.0
        var labelHeight:CGFloat = 0.0
        
        let version = UIDevice.current.systemVersion as NSString
        
        if version.floatValue >= 8.0 {
            labelWidth = self.titleLabel?.intrinsicContentSize.width ?? 0.0
            labelHeight = self.titleLabel?.intrinsicContentSize.height ?? 0.0
        }else {
            labelWidth = self.titleLabel?.frame.size.width ?? 0.0
            labelHeight = self.titleLabel?.frame.size.height ?? 0.0
        }
        
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        switch style {
        case .Top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: 0.0, bottom: 0.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageWith - 20, bottom: -imageHeight - space/2.0 - 20, right: 0.0)
            break
        case .Left:
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -space/2.0, bottom: 0.0, right: space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0.0, left: space/2.0, bottom: 0.0, right: -space/2.0)
            break
        case .Bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -labelHeight-space/2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWith, bottom: 0.0, right: 0.0)
            break
        case .Right:
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: labelWidth+space/2.0, bottom: 0.0, right: -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageWith-space/2.0, bottom: 0.0, right: imageWith+space/2.0)
            break
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
    
    func layoutNewButtonWithEdgeInsetsStyle(style:ButtonEdgeInsetsStyle,space:CGFloat) {
        let imageWith = self.imageView?.frame.size.width ?? 0.0
        let imageHeight = self.imageView?.frame.size.height ?? 0.0
        
        var labelWidth:CGFloat = 0.0
        var labelHeight:CGFloat = 0.0
        
        let version = UIDevice.current.systemVersion as NSString
        
        if version.floatValue >= 8.0 {
            labelWidth = self.titleLabel?.intrinsicContentSize.width ?? 0.0
            labelHeight = self.titleLabel?.intrinsicContentSize.height ?? 0.0
        }else {
            labelWidth = self.titleLabel?.frame.size.width ?? 0.0
            labelHeight = self.titleLabel?.frame.size.height ?? 0.0
        }
        
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        var arg:CGFloat = 0.0
        if labelWidth > imageWith {
            arg = labelWidth - imageWith
        }else {
            arg = imageWith - labelWidth
        }
        
        switch style {
        case .Top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: 0.0, bottom: 0.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0.0, left: -arg, bottom: -imageHeight - space/2.0 - 20, right: 0.0)
            break
        case .Left:
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -space/2.0, bottom: 0.0, right: space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0.0, left: space/2.0, bottom: 0.0, right: -space/2.0)
            break
        case .Bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -labelHeight-space/2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWith, bottom: 0.0, right: 0.0)
            break
        case .Right:
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: labelWidth+space/2.0, bottom: 0.0, right: -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageWith-space/2.0, bottom: 0.0, right: imageWith+space/2.0)
            break
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
}
