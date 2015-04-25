//
//  BackgroundChart.swift
//  Douglas Mandarino
//
//  Created by Douglas Mandarino on 4/23/15.
//  Copyright (c) 2015 Douglas Mandarino. All rights reserved.
//

import Foundation
import UIKit

class BackgroundChartView: UIView {
 
    var endArc:CGFloat = 0.0{   // in range of 0.0 to 1.0
        didSet{
            setNeedsDisplay()
        }
    }
    var arcWidth:CGFloat = 7.0
    var arcColor = UIColor.yellowColor()
    var arcBackgroundColor = UIColor.blackColor()
    
    override func drawRect(rect: CGRect) {
        
        //Important constants for circle
        let fullCircle = 2.0 * CGFloat(M_PI)
        let start:CGFloat = -0.25 * fullCircle
        let end:CGFloat = endArc * fullCircle + start
                
        var centerPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        
        //define the radius by the smallest side of the view
        var radius:CGFloat = 0.0
        if CGRectGetWidth(rect) > CGRectGetHeight(rect){
            radius = (CGRectGetWidth(rect) - arcWidth) / 2.0
        }else{
            radius = (CGRectGetHeight(rect) - arcWidth) / 2.0
        }
        
        //starting point for all drawing code is getting the context.
        let context = UIGraphicsGetCurrentContext()
        
        //set colorspace
        let colorspace = CGColorSpaceCreateDeviceRGB()
        
        //make the circle background
        CGContextSetLineWidth(context, arcWidth)
        CGContextSetStrokeColorWithColor(context, arcBackgroundColor.CGColor)
        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, 0, fullCircle, 0)
        CGContextStrokePath(context)
        
        //set line attributes
        CGContextSetLineWidth(context, arcWidth * 0.8)
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetStrokeColorWithColor(context, arcColor.CGColor)
        
        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, start, end, 0)
        CGContextStrokePath(context)

    }
}