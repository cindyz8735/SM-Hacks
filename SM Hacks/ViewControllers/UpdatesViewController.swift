//
//  UpdatesViewController.swift
//  SM Hacks
//
//  Created by Cindy Zhang on 1/2/17.
//  Copyright © 2017 Cindy Zhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UpdatesViewController: UIViewController {

    @IBOutlet var jsonTable: UITableView!
    
    // Create array (dictionary)
    var updatesArray = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Get data with Alamofire
        Alamofire.request("https://cindyz8735.github.io/ios-app/test-contacts").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["updates"].arrayObject {
                    self.updatesArray = resData as! [[String:AnyObject]]
                }
                if self.updatesArray.count > 0 {
                    self.jsonTable.reloadData()
                }
            }
        }
    }
    
    // Create Table
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        var dict = updatesArray[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = dict["title"] as? String
        cell.detailTextLabel?.text = dict["name"] as? String
        
        // Format cell
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        
        return cell
    }
    
    // Number of cells in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updatesArray.count
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
