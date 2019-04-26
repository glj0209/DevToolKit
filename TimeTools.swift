//
//  TimeTools.swift
//  DevToolKit
//
//  Created by gaolijun on 2019/4/25.
//

import UIKit

struct TimeStyle {
    static let TheTimeStyleYearToSecond = "yyyy-MM-dd HH:mm:ss"
    static let TheTimeStyleYearToMinute = "yyyy-MM-dd HH:mm"
    static let TheTimeStyleYearToDay = "yyyy-MM-dd"
    static let TheTimeStyleMonthToSecond = "MM-dd HH:mm:ss"
    static let TheTimeStyleMonthToMinute = "MM-dd HH:mm"
}

class TimeTools: NSObject {
    static let sharedInstance = TimeTools()
    
    /**
     *  获取当前时间
     */
    func getCurrentTime() -> TimeInterval {
        let nowDate = NSDate()
        let nowTime = nowDate.timeIntervalSince1970
        return nowTime
    }
    
    /**
     *  转化时间样式
     *  style: 展示样式,默认:"yyyy-MM-dd HH:mm:ss"
     */
    func transformNowTime(style:String?) -> String {
        let nowDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = style ?? TimeStyle.TheTimeStyleYearToSecond
        let time = dateFormatter.string(from: nowDate as Date)
        return time
    }
    
    /**
     *  转化时间样式
     *  time: 时间戳秒
     *  style: 展示样式,默认:"yyyy-MM-dd HH:mm:ss"
     */
    func transformTime(time:String,style:String?) -> String {
        let t = Double(time)
        let date = NSDate(timeIntervalSinceNow: t!)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = style ?? TimeStyle.TheTimeStyleYearToSecond
        let time = dateFormatter.string(from: date as Date)
        return time
    }
    
    /**
     *  获取当前星期
     */
    func getWeek() -> String {
        let weekDays = [NSNull.init(),"星期 日","星期 一","星期 二","星期 三","星期 四","星期 五","星期 六"] as [Any]
        
        let calendar:NSCalendar = NSCalendar.init(identifier: NSCalendar.Identifier.gregorian)!
        calendar.timeZone = NSTimeZone(name: "Asia/Shanghai")! as TimeZone
        let nowDate = NSDate()
        
        let comps = calendar.components(NSCalendar.Unit.weekday, from: nowDate as Date)
        
        return weekDays[comps.weekday!] as! String
    }
    
    /**
     *  计算过去多少时间
     *  timeString: 时间戳秒
     *  style: 超过一天的现实样式,默认:"yyyy-MM-dd HH:mm"
     *  返回数据为 xx小时前、xx分钟前、刚刚、yyyy-MM-dd HH:mm
     */
    func transformPastTime(timeString:String,style:String?) -> String {
        
        let nowTime = getCurrentTime()
        let pastTime = Int(timeString)!
        
        let chaTime = Int(nowTime) - pastTime
        
        let day = Int(chaTime / (60 * 60 * 24))
        
        if  day == 0 {
        
            let hour = Int(chaTime / (60 * 60))
            if hour > 0 {
                return "\(hour)" + "小时前"
            }else {
                
                let min = Int(chaTime / 60)
                if min > 0 {
                    return "\(min)" + "分钟前"
                }else {
                    return "刚刚"
                }
            }
            
        }else {
            return transformTime(time: timeString, style: style ?? TimeStyle.TheTimeStyleYearToMinute)
        }
    }
    
    /**
     *  计算距离时间差
     *  startTime: 时间戳秒
     *  返回数据为 ["day":"00","hour":"00","min":"00","sec":"00"],可根据key获取具体时间差
     */
    func calculateCountdownTime(startTime:String) -> NSDictionary {
        let nowTime = getCurrentTime()
        let pastTime = Int(startTime)!
        
        let chaTime = pastTime - Int(nowTime)
        
        if chaTime <= 0 {
            return ["day":"00","hour":"00","min":"00","sec":"00"]
        }
        
        let day = chaTime / (60 * 60 * 24)
        let allhour = chaTime % (60 * 60 * 24)
        
        let hour = allhour / (60 * 60)
        let allmin = allhour % (60 * 60)
        
        let min = allmin / 60
        let sec = allmin % 60
        
        let dayS = "\(day)"
        let hourS = hour <= 9 ? "0" + "\(hour)" : "\(hour)"
        let minS = min <= 9 ? "0" + "\(min)" : "\(min)"
        let secS = sec <= 9 ? "0" + "\(sec)" : "\(sec)"
        
        return ["day":dayS,"hour":hourS,"min":minS,"sec":secS]
    }
}
