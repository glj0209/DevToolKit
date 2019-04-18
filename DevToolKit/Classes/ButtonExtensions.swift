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
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space/2.0, 0.0, 0.0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(0.0, -imageWith - 20, -imageHeight - space/2.0 - 20, 0.0)
            break
        case .Left:
            imageEdgeInsets = UIEdgeInsetsMake(0.0, -space/2.0, 0.0, space/2.0)
            labelEdgeInsets = UIEdgeInsetsMake(0.0, space/2.0, 0.0, -space/2.0)
            break
        case .Bottom:
            imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -labelHeight-space/2.0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0.0, 0.0)
            break
        case .Right:
            imageEdgeInsets = UIEdgeInsetsMake(0.0, labelWidth+space/2.0, 0.0, -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsetsMake(0.0, -imageWith-space/2.0, 0.0, imageWith+space/2.0)
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
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space/2.0, 0.0, 0.0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(0.0, -arg, -imageHeight - space/2.0 - 20, 0.0)
            break
        case .Left:
            imageEdgeInsets = UIEdgeInsetsMake(0.0, -space/2.0, 0.0, space/2.0)
            labelEdgeInsets = UIEdgeInsetsMake(0.0, space/2.0, 0.0, -space/2.0)
            break
        case .Bottom:
            imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -labelHeight-space/2.0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0.0, 0.0)
            break
        case .Right:
            imageEdgeInsets = UIEdgeInsetsMake(0.0, labelWidth+space/2.0, 0.0, -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsetsMake(0.0, -imageWith-space/2.0, 0.0, imageWith+space/2.0)
            break
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
}
