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
     
    @IBOutlet weak var titleProject: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var buttonIMC: UIButton!
    @IBOutlet weak var textViewIMC: UITextView!
    
    let swiftColor = UIColor(red: 52/255, green:152/255, blue: 219/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var color = UIColor()

        if titleProject != nil {
            titleProject.font = UIFont(name: "Avenir-Book", size: 22)
            if titleProject.text != "Tap on a Project" {
                color = titleProject.textColor
            } else {
                color = swiftColor
            }
            customizeBars(color)
        }
        if textViewIMC != nil {
            textViewIMC.font = UIFont(name: "Avenir-Book", size: 16)
        }
        if infoLabel != nil {
            infoLabel.font = UIFont(name: "Avenir-Book", size: 16)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func circleTapped(sender:UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
        var color = swiftColor
        customizeBars(color)
    }
    
    private func customizeBars(color:UIColor) {
        var nav = navigationController?.navigationBar
        
        nav!.barTintColor = color
        self.navigationController?.navigationBarHidden = false
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.tabBarController?.tabBar.tintColor = color
        self.navigationItem.hidesBackButton = true;
    }
}