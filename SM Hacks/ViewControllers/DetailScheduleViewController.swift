//
//  DetailScheduleViewController.swift
//  SM Hacks
//
//  Created by Cindy Zhang on 1/3/17.
//  Copyright © 2017 Cindy Zhang. All rights reserved.
//

import UIKit

class DetailScheduleViewController: UIViewController {

    @IBOutlet var eventNameLabel: UILabel!

    @IBOutlet var eventTimeLabel: UITextField!
    
    @IBOutlet var eventLocationLabel: UITextField!
    
    @IBOutlet var eventDescriptionLabel: UITextView!
    
    
    var eventName = String()
    var eventTime = String()
    var eventLocation = String()
    var eventDescription = String()
    
    func viewWillAppear() {
        eventNameLabel.text = eventName
        eventTimeLabel.text = eventTime
        eventLocationLabel.text = eventLocation
        eventDescriptionLabel.text = eventDescription
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   
    
    var numberToDisplay = 0
    
}
