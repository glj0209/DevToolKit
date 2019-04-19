//
//  ViewExtensions.swift
//  DevToolKit
//
//  Created by gaolijun on 2019/4/18.
//

import UIKit

extension UIView {
    
    public var ld_x: CGFloat {
        
        get {
            return self.frame.origin.x
        }
        
        set(newValue) {
            var ld_frame: CGRect = self.frame
            ld_frame.origin.x = newValue
            self.frame = ld_frame
            
        }
        
    }
    
    public var ld_y: CGFloat {
        
        get {
            return self.frame.origin.y
        }
        
        set(newValue) {
            var ld_frame: CGRect = self.frame
            ld_frame.origin.y = newValue
            self.frame = ld_frame
            
        }
        
    }
    
    public var ld_width: CGFloat {
        
        get {
            return self.frame.size.width
        }
        
        set(newValue) {
            var ld_frame: CGRect = self.frame
            ld_frame.size.width = newValue
            self.frame = ld_frame
            
        }
        
    }
    
    public var ld_height: CGFloat {
        
        get {
            return self.frame.size.height
        }
        
        set(newValue) {
            var ld_frame: CGRect = self.frame
            ld_frame.size.height = newValue
            self.frame = ld_frame
            
        }
        
    }
    
    public var ld_size: CGSize {
        
        get {
            return self.frame.size
        }
        
        set(newValue) {
            var ld_frame: CGRect = self.frame
            ld_frame.size = newValue
            self.frame = ld_frame
            
        }
        
    }
    
    public var ld_centerX: CGFloat {
        
        get {
            return self.center.x
        }
        
        set(newValue) {
            var ld_center: CGPoint = self.center
            ld_center.x = newValue
            self.center = ld_center
            
        }
        
    }
    
    public var ld_centerY: CGFloat {
        
        get {
            return self.center.y
        }
        
        set(newValue) {
            var ld_center: CGPoint = self.center
            ld_center.y = newValue
            self.center = ld_center
            
        }
        
    }
    
    
}
