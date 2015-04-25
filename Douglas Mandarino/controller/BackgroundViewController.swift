//
//  BackgroundViewController.swift
//  Douglas Mandarino
//
//  Created by Douglas Mandarino on 4/23/15.
//  Copyright (c) 2015 Douglas Mandarino. All rights reserved.
//

import Foundation
import UIKit

class BackgroundViewController:UIViewController {

    @IBOutlet weak var circleGraph1: BackgroundChartView!
    @IBOutlet weak var circleGraph2: BackgroundChartView!
    @IBOutlet weak var circleGraph3: BackgroundChartView!
    @IBOutlet weak var circleGraph4: BackgroundChartView!
    @IBOutlet weak var circleGraph5: BackgroundChartView!
    @IBOutlet weak var circleGraph6: BackgroundChartView!
    @IBOutlet weak var circleGraph7: BackgroundChartView!
    @IBOutlet weak var circleGraph8: BackgroundChartView!
    
    @IBOutlet weak var button: UIButton!
    
    var font = UIFont(name: "Avenir-Book", size: 16)
    let swiftColor = UIColor(red: 52/255, green:152/255, blue: 219/255, alpha: 1)
    
    override func viewDidLoad() {
        customizeBars()
        
        button.titleLabel!.font =  font

        self.circleGraph1.endArc = 0
        self.circleGraph2.endArc = 0
        self.circleGraph3.endArc = 0
        self.circleGraph4.endArc = 0
        self.circleGraph5.endArc = 0
        self.circleGraph6.endArc = 0
        self.circleGraph7.endArc = 0
        self.circleGraph8.endArc = 0
        
        self.circleGraph1.arcColor = UIColor.yellowColor()
        self.circleGraph2.arcColor = UIColor.yellowColor()
        self.circleGraph3.arcColor = UIColor.redColor()
        self.circleGraph4.arcColor = UIColor.orangeColor()
        self.circleGraph5.arcColor = UIColor.yellowColor()
        self.circleGraph6.arcColor = UIColor.yellowColor()
        self.circleGraph7.arcColor = UIColor.redColor()
        self.circleGraph8.arcColor = UIColor.yellowColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        
//         NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update08"), userInfo: nil, repeats: false)
         NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update03"), userInfo: nil, repeats: false)
         NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update06"), userInfo: nil, repeats: false)
         NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update05"), userInfo: nil, repeats: false)
         NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update09"), userInfo: nil, repeats: false)
    }
    
    func update06() {
        if self.circleGraph6.endArc != 0.6 {
            self.circleGraph6.endArc += 0.1
            self.circleGraph4.endArc += 0.1
            
            NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update06"), userInfo: nil, repeats: false)
        }
    }

    func update05() {
        if self.circleGraph1.endArc != CGFloat(0.5) {
            self.circleGraph1.endArc += 0.1
            self.circleGraph2.endArc += 0.1
            self.circleGraph5.endArc += 0.1
            
            NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update05"), userInfo: nil, repeats: false)
        }
    }

    func update09() {
        if self.circleGraph7.endArc != CGFloat(0.7) {
            self.circleGraph7.endArc += 0.1
            self.circleGraph3.endArc += 0.1
            
            NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update09"), userInfo: nil, repeats: false)
        }
    }
    
    func update03() {
        if self.circleGraph8.endArc != CGFloat(0.2) {
            self.circleGraph8.endArc += 0.1
            
            NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update03"), userInfo: nil, repeats: false)
        }
    }
    
    private func customizeBars() {
        var nav = navigationController?.navigationBar
        
        nav!.barTintColor = swiftColor
        self.navigationController?.navigationBarHidden = false
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.tabBarController?.tabBar.tintColor = swiftColor
    }
    
}