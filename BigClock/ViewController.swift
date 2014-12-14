//
//  ViewController.swift
//  BigClock
//
//  Created by naoyashiga on 2014/11/02.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timeLabel:UILabel!

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var centerX: CGFloat = self.view.bounds.size.width / 2
        var centerY: CGFloat = self.view.bounds.size.height / 2
        var screenWidth: CGFloat = self.view.bounds.size.width
        var screenHeight: CGFloat = self.view.bounds.size.height
        var timeWidth: CGFloat = screenWidth * 0.8
        
        
        //現在時刻
//        let now = NSDate() // 現在日時の取得
//        let dateFormatter = NSDateFormatter()
//        
//        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
//        
//        dateFormatter.timeStyle = .MediumStyle
//        dateFormatter.dateStyle = .MediumStyle
//        println(dateFormatter.stringFromDate(now)) // -> 2014/06/24 11:14:17
//        
//        var strArray:NSArray = dateFormatter.stringFromDate(now).componentsSeparatedByString("/")[2].componentsSeparatedByString(" ")[1].componentsSeparatedByString(":")
//        println(strArray)
//
//        println(strArray[0] as? Int)
//        var hourInt = strArray[0] as NSObject
//        println(hourInt)
////        var hourStr:String = String(strArray[0] as NSString)
//        if (hourInt >= 0 || hourInt < 10){
//            
//            println("bbb")
//        }else{
//            println("aa")
//        }
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        let second = components.second
        
        var hourStr:String!
        var minuteStr:String!
        var secondStr:String!
        
        if hour >= 0 && hour < 10{
            hourStr = "0" + String(hour)
        }else{
            hourStr = String(hour)
        }
        
        if minutes >= 0 && minutes < 10{
            minuteStr = "0" + String(minutes)
        }else{
            minuteStr = String(minutes)
        }
        
        if second >= 0 && second < 10{
            secondStr = "0" + String(second)
        }else{
            secondStr = String(second)
        }
        
        //タイトル
        timeLabel = UILabel(frame: CGRectMake(centerX - timeWidth / 2, centerY, timeWidth, 30))
        timeLabel.text = hourStr + " " + minuteStr + " " + secondStr
        timeLabel.font = UIFont (name: "Futura-CondensedExtraBold", size: 40)
        timeLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(timeLabel)
        
        // 一秒ごとにupdateを呼び出す
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func update(){
        //現在時刻
//        let now = NSDate() // 現在日時の取得
//        let dateFormatter = NSDateFormatter()
//        
//        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
//        
//        dateFormatter.timeStyle = .MediumStyle
//        dateFormatter.dateStyle = .MediumStyle
//        
//        var strArray:NSArray = dateFormatter.stringFromDate(now).componentsSeparatedByString("/")[2].componentsSeparatedByString(" ")[1].componentsSeparatedByString(":")
//        var hour:String = String(strArray[0] as NSString)
//        var minute:String = String(strArray[1] as NSString)
//        var second:String = String(strArray[2] as NSString)
//        timeLabel.text = hour + minute + second
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        let second = components.second
        
        var hourStr:String!
        var minuteStr:String!
        var secondStr:String!
        
        if hour >= 0 && hour < 10{
            hourStr = "0" + String(hour)
        }else{
            hourStr = String(hour)
        }
        
        if minutes >= 0 && minutes < 10{
            minuteStr = "0" + String(minutes)
        }else{
            minuteStr = String(minutes)
        }
        
        if second >= 0 && second < 10{
            secondStr = "0" + String(second)
        }else{
            secondStr = String(second)
        }
        
        timeLabel.text = hourStr + " " + minuteStr + " " + secondStr
        
    }
}

