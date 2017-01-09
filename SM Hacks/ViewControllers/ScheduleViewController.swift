//
//  ScheduleViewController.swift
//  SM Hacks
//
//  Created by Cindy Zhang on 1/2/17.
//  Copyright © 2017 Cindy Zhang. All rights reserved.
//  Schedule Tab Icon from MHacks iOS Github Repo
//

import UIKit
import Alamofire
import SwiftyJSON

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var saturdayArray = [[String:AnyObject]]()
    var sundayArray = [[String:AnyObject]]()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ScheduleViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Alamofire.request("https://cindyz8735.github.io/sm-hacks-data/saturday").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["saturday"].arrayObject {
                    self.saturdayArray = resData as! [[String:AnyObject]]
                }
                self.tableView.reloadData()
            }
        }
        Alamofire.request("https://cindyz8735.github.io/sm-hacks-data/sunday").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["sunday"].arrayObject {
                    self.sundayArray = resData as! [[String:AnyObject]]
                }
                self.tableView.reloadData()
            }
        }
        self.tableView.addSubview(self.refreshControl)
    }
    
    // refresh
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        // get data with alamofire and swiftyJSON
        Alamofire.request("https://cindyz8735.github.io/sm-hacks-data/saturday").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["saturday"].arrayObject {
                    self.saturdayArray = resData as! [[String:AnyObject]]
                }
            }
        }
        Alamofire.request("https://cindyz8735.github.io/sm-hacks-data/sunday").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["sunday"].arrayObject {
                    self.sundayArray = resData as! [[String:AnyObject]]
                }
            }
        }
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    // how many sections in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("nnum cell func")

        if section == 0 {
            print (saturdayArray.count)
            return saturdayArray.count
        }
        else {
            return sundayArray.count
        }
    }
    
    // make table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        print("make table func")
        
        if indexPath.section == 0 {
            var sat = saturdayArray[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = sat["event"] as? String
            cell.detailTextLabel?.text = sat["time"] as? String
        }
        else {
            var sun = sundayArray[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = sun["event"] as? String
            cell.detailTextLabel?.text = sun["time"] as? String
        }
        
        // format cell
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
}
