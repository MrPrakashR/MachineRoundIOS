//
//  TabBarViewController.swift
//  TaskToFinish
//
//  Created by Apple on 03/03/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 12
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner] // TopLeft ,TopRight Corner
    }

}
