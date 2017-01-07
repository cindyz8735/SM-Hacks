//
//  ScheduleViewController.swift
//  SM Hacks
//
//  Created by Cindy Zhang on 1/2/17.
//  Copyright © 2017 Cindy Zhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var saturdayArray = [[String]]()
    var satTime = [[String:AnyObject]]()
    var sundayArray = [[String:AnyObject]]()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ScheduleViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Alamofire.request("https://cindyz8735.github.io/sm-hacks-data/schedule").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["schedule"].array {
                    // self.saturdayArray = resData as! [[String:AnyObject]]
                    
                    for userDict in resData {
                        var satEvent : String! = userDict["saturday"][0]["name"].string
                        var satTime : String! = userDict["saturday"][0]["time"].string
                        var sunEvent : String! = userDict["sunday"][0]["name"].string
                        var sunTime : String! = userDict["sunday"][0]["time"].string
                        
                        var x : [String] = [satEvent, satTime]
                        self.saturdayArray.append(x)
                    }
                    
                }
            }
        }
        
        self.tableView.reloadData()
        self.tableView.addSubview(self.refreshControl)
    }
    
    // refresh
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        // get data with alamofire and swiftyJSON
        
        Alamofire.request("https://cindyz8735.github.io/sm-hacks-data/schedule").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["schedule"].array {
                    // self.saturdayArray = resData as! [[String:AnyObject]]
                    
                    for userDict in resData {
                        var satEvent : String! = userDict["saturday"][0]["name"].string
                        var satTime : String! = userDict["saturday"][0]["time"].string
                        var sunEvent : String! = userDict["sunday"][0]["name"].string
                        var sunTime : String! = userDict["sunday"][0]["time"].string
                        
                        var x = [satEvent, satTime]
                        self.saturdayArray.append(x as! [String])
                    }
                    
                }
            }
        }
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    // how many sections in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("nnum cell func")

        // if section == 0 {
            print (saturdayArray.count)
            print (sundayArray.count)
            return saturdayArray.count
        // }
//        else {
//            return sundayArray.count
//        }
    }
    
    // make table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        print("make table func")
        
         var sat = saturdayArray[(indexPath as NSIndexPath).row]
    
//         var sun = sundayArray[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.selectionStyle = .none

         if indexPath.section == 0 {
            for i in saturdayArray {
                for j in i {
                    print (j)
                    // cell.textLabel?.text = j[0]
                    // cell.detailTextLabel?.text = j[1]
                    return cell
                }
            }
        }
//        else {
//            cell.textLabel?.text = sun["name"] as? String
//            cell.detailTextLabel?.text = sun["time"] as? String
//        }
        
        return cell
    }
    
    // give section title
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return nil
//        }
//        else {
//            return "Sunday, Jan. 15, 2017"
//        }
//    }
}

/*
import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // arrays/data for schedule
    let saturday = [
        ("Mentor Check-in", "10 AM // Lobby"),
        ("Hacker Check-in", "10:30 AM // Lobby"),
        ("Opening Ceremony", "11:30 AM // Auditorium"),
        ("Hacking Starts", "12 PM"),
        ("Team Mixer", "12 PM // Room 1"),
        ("Lunch", "12 PM // Cafeteria"),
        ("Workshop: Intro iOS", "1 PM // Room 1"),
        ("Workshop: Intermediate iOS", "2:30 PM // Room 1"),
        ("Workshop: Intro to Git", "3 PM // Room 2"),
        ("Dinner", "6:30 PM // Cafeteria")
    ]
    let sunday = [
        ("Midnight Snack", "12 AM // Cafeteria"),
        ("Breakfast", "8 AM // Cafeteria"),
        ("Project Submissions", "11 AM to 12 PM"),
        ("Hacking Ends", "12 PM"),
        ("Judging and Demos", "12:30 PM to 1:15 PM // Lobby"),
        ("Closing Ceremony", "1:45 PM // Auditorium")
    ]
    
    // how many sections in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // return int = how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return saturday.count
        }
        else {
            return sunday.count
        }
    }
    
    // contents of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "subtitleCell")

        if indexPath.section == 0 {
            var (satName, satTimeLoc) = saturday[indexPath.row]
            cell.textLabel?.text = satName
            cell.detailTextLabel?.text = satTimeLoc
        }
        else {
            var (sunName, sunTimeLoc) = sunday[indexPath.row]
            cell.textLabel?.text = sunName
            cell.detailTextLabel?.text = sunTimeLoc
        }
        
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    // give section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        else {
            return "Sunday, Jan. 15, 2017"
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "ShowDetailSchedule" {
//                let upcoming = segue.destination as? DetailScheduleViewController
//                var (sunName, sunTime, sunLocation, sunNotes) = sunday[indexPath.row]
//                upcoming?.eventName = sunName
//                upcoming?.eventTime = sunTime
//                upcoming?.eventLocation = sunLocation
//                upcoming?.eventDescription = sunNotes
//            }
//        }
//        self.performSegue(withIdentifier: "ShowDetailSchedule", sender: self)

    }
    
//    @IBOutlet weak var tableView: UITableView!
//    
//    func prepareForSegue(segue: UIStoryboardSegue, sender:
//        AnyObject?)
//    {
//        if (segue.identifier == "ShowDetailSchedule")
//        {
//            // upcoming is set to NewViewController (.swift)
//            var upcoming: DetailScheduleViewController = segue.destination as! DetailScheduleViewController
//            // indexPath is set to the path that was tapped
//            let indexPath = self.tableView.indexPathForSelectedRow!
//            // titleString is set to the title at the row in the objects array.
//            // let titleString = self.saturday[indexPath.row]
//            // the titleStringViaSegue property of NewViewController is set.
//            var (sunName, sunTime, sunLocation, sunNotes) = sunday[indexPath.row]
//            upcoming.eventName = sunName
//            upcoming.eventTime = sunTime
//            upcoming.eventLocation = sunLocation
//            upcoming.eventDescription = sunNotes
//            
//            self.tableView.deselectRow(at: indexPath, animated: true)
//        }
//    }


//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
*/
