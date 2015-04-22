//
//  ProjectsViewController.swift
//  Douglas Mandarino
//
//  Created by Douglas Mandarino on 4/16/15.
//  Copyright (c) 2015 Douglas Mandarino. All rights reserved.
//

import Foundation
import UIKit

class ProjectViewController : UIViewController {
     
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeBars()
        
        self.titleLabel.font = UIFont(name: "Avenir-Book", size: 20)
    }
    
    private func customizeBars() {
        var nav = navigationController?.navigationBar
        
        let swiftColor = UIColor(red: 52/255, green:152/255, blue: 219/255, alpha: 1)
        nav!.barTintColor = swiftColor
        self.navigationController?.navigationBarHidden = false
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.tabBarController?.tabBar.tintColor = swiftColor
    }
}