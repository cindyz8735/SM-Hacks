//
//  DrawImageMap.swift
//  SM Hacks
//
//  Created by Cindy Zhang on 1/2/17.
//  Copyright © 2017 Cindy Zhang. All rights reserved.
//

import UIKit

class DrawImageMap: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        
        
        let smHacksLogo = UIImage(named: "logo.png")
        let floor = UIImage(named: "Floorplan.png")
        
         let location = CGPoint(x: 25, y:25)
         floor?.draw(at: location)
        
//        let entireScreen = UIScreen.main.bounds
//        floor?.draw(in: entireScreen)
    }
    

}
