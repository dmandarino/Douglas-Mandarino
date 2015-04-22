//
//  ViewController.swift
//  Douglas Mandarino
//
//  Created by Douglas Mandarino on 4/14/15.
//  Copyright (c) 2015 Douglas Mandarino. All rights reserved.
//

import UIKit

class IMCPedController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeBars()
    
        textView.font = UIFont(name: "Avenir-Book", size: 16)
        
        var btnLayer = button.layer
        btnLayer.cornerRadius = 22
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func circleTapped(sender:UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
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

