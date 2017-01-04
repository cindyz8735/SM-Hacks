//
//  ScheduleViewController.swift
//  SM Hacks
//
//  Created by Cindy Zhang on 1/2/17.
//  Copyright © 2017 Cindy Zhang. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // arrays/data for schedule
    let saturday = [
        ("Mentor Check-in", "10 AM", "Lobby", ""),
        ("Hacker Check-in", "10:30 AM", "Lobby", ""),
        ("Opening Ceremony", "11:30 AM", "Auditorium", ""),
        ("Hacking Starts", "12 PM", "", ""),
        ("Team Mixer", "12 PM", "Room 1", "Come find team members!"),
        ("Lunch", "12 PM", "Cafeteria", ""),
        ("Workshop: Intro iOS", "1 PM", "Room 1", "By Make School"),
        ("Workshop: Intermediate iOS", "2:30 PM", "Room 1", "By Make School"),
        ("Workshop: Intro to Git", "3 PM", "Room 2", "By Hanah"),
        ("Dinner", "6:30 PM", "Cafeteria", "")
    ]
    let sunday = [
        ("Midnight Snack", "12 AM", "Cafeteria", "Free food!"),
        ("Breakfast", "8 AM", "Cafeteria", ""),
        ("Project Submissions", "11 AM to 12 PM", "", "Submit on Devpost"),
        ("Hacking Ends", "12 PM", "", ""),
        ("Judging and Demos", "12:30 PM to 1:15 PM", "Lobby", ""),
        ("Closing Ceremony", "1:45 PM", "Auditorium", "")
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
            var (satName, satTime, satLocation, satNotes) = saturday[indexPath.row]
            cell.textLabel?.text = satName
            cell.detailTextLabel?.text = satTime
        }
        else {
            var (sunName, sunTime, sunLocation, sunNotes) = sunday[indexPath.row]
            cell.textLabel?.text = sunName
            cell.detailTextLabel?.text = sunTime
        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ShowDetailSchedule" {
                let upcoming = segue.destination as? DetailScheduleViewController
                var (sunName, sunTime, sunLocation, sunNotes) = sunday[indexPath.row]
                upcoming?.eventName = sunName
                upcoming?.eventTime = sunTime
                upcoming?.eventLocation = sunLocation
                upcoming?.eventDescription = sunNotes
            }
        }
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
