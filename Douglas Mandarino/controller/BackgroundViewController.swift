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

    @IBOutlet weak var circleGraph: BackgroundChartView!
    
    override func viewDidLoad() {
        circleGraph.endArc = 0.5
        circleGraph.arcWidth =  10.0
        
        let backgroundTrackColor = UIColor(white: 0.15, alpha: 1.0)
        circleGraph.arcBackgroundColor = backgroundTrackColor
    }
    
    override func viewDidAppear(animated: Bool) {
        circleGraph.animationDidStart(<#anim: CAAnimation!#>)
        [UIView animateWithDuration:2.
        delay:0
        options:0
        animations:^{
        chart.transform = CGAffineTransformIdentity;
        }
        completion:nil];
    }
//    @IBAction func slider(sender: UISlider) {
//        circleGraph.endArc = CGFloat(sender.value)
//        percentLabel.text = String(format:" %5.2f %%",sender.value * 100)
//    }
    
}