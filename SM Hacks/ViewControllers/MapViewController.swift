//
//  MapViewController.swift
//  SM Hacks
//
//  Created by Cindy Zhang on 1/2/17.
//  Copyright © 2017 Cindy Zhang. All rights reserved.
//  Map Tab Icon from MHacks iOS Github Repo
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    var imageView: UIImageView!
    
    @IBOutlet var scrollViewWindow: UIScrollView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "floorplan-copy.png"))
        
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true

        scrollViewWindow.contentSize = imageView.bounds.size
        scrollViewWindow.addSubview(imageView)
        view.addSubview(scrollViewWindow)
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

