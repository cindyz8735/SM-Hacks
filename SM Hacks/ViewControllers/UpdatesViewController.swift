//
//  UpdatesViewController.swift
//  SM Hacks
//
//  Created by Cindy Zhang on 1/2/17.
//  Copyright © 2017 Cindy Zhang. All rights reserved.
//

import UIKit

var updatesArray = [String]()
var newUpdate : String = String()

class UpdatesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        // add push updates to array
        updatesArray.append(newUpdate)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // how many sections in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // return int = how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updatesArray.count
    }
    
    // contents of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "defaultCell")
        
        var updateText = updatesArray[indexPath.row]
        cell.textLabel?.text = updateText
        return cell
    }
    
    // give section title
    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        else {
            return "Sunday, Jan. 15, 2017"
        }
    }
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
