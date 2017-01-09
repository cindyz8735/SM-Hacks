//
//  HomeViewController.swift
//  SM Hacks
//
//  Created by Cindy Zhang on 1/2/17.
//  Copyright © 2017 Cindy Zhang. All rights reserved.
//  Home Tab Icon made by Iconnice from www.flaticon.com
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBAction func tapSlackButton(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://goo.gl/aifJf2")! as URL)
    }
    @IBAction func tapFacebookButton(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://www.facebook.com/sanmateohacks/")! as URL)
    }
    @IBAction func tapTwitterButton(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://twitter.com/sanmateohacks")! as URL)
    }
    @IBAction func tapDevpostButton(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://smhacks.devpost.com/")! as URL)
    }
    
    
    let formatter = DateFormatter()
    let userCalendar = Calendar.current;
    let requestedComponent : Set<Calendar.Component> = [
        Calendar.Component.month,
        Calendar.Component.day,
        Calendar.Component.hour,
        Calendar.Component.minute,
        Calendar.Component.second
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timePrinter), userInfo: nil, repeats: true)
        
        timer.fire()
    }
    
    func timeCalculator(dateFormat: String, endTime: String, startTime: Date = Date()) -> DateComponents {
        formatter.dateFormat = dateFormat
        let _startTime = startTime
        let _endTime = formatter.date(from: endTime)
        
        let timeDifference = userCalendar.dateComponents(requestedComponent, from: _startTime, to: _endTime!)
        return timeDifference
    }
    
    func timePrinter() -> Void {
        var time = timeCalculator(dateFormat: "MM/dd/yyyy hh:mm:ss a", endTime: "01/15/2017 12:00:00 p")
        
        time.hour = (time.day!) * 24 + (time.hour!)
        
        var hourString = String(time.hour!)
        var minuteString = String(time.minute!)
        var secondString = String(time.second!)

        if (time.hour!) < 10 {
            hourString = "0" + hourString
        }
        if (time.minute!) < 10 {
            minuteString = "0" + minuteString
        }
        if (time.second!) < 10 {
            secondString = "0" + secondString
        }
        timerLabel.text = hourString + ":" + minuteString + ":" + secondString
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
