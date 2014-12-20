//
//  ViewController.swift
//  BigClock
//
//  Created by naoyashiga on 2014/11/02.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.hexStr("60DFE5", alpha: 1)
        self.view.backgroundColor = UIColor.hexStr("000000", alpha: 1)
        
        getTime()
        // 一秒ごとにupdateを呼び出す
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func update(){
        getTime()
    }
    
    func getTime(){
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
        
        hourLabel.text = hourStr
        minuteLabel.text = minuteStr
        secondLabel.text = secondStr
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }
    
    @IBAction func tapGesture(sender: AnyObject) {
        let controller: UINavigationController! = self.storyboard?.instantiateViewControllerWithIdentifier("NavigationController") as? UINavigationController
        controller.modalPresentationStyle = .Custom
        controller.transitioningDelegate = self
        self.presentViewController(controller, animated: true, completion: {
            
        })
    }
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return CustomPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
extension UIColor {
    class func hexStr (var hexStr : NSString, var alpha : CGFloat) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
}

