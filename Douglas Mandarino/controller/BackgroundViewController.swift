//
//  BackgroundViewController.swift
//  Douglas Mandarino
//
//  Created by Douglas Mandarino on 4/23/15.
//  Copyright (c) 2015 Douglas Mandarino. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class BackgroundViewController:UIViewController, MKMapViewDelegate {

    @IBOutlet weak var PopUpView: UIView!
    
    @IBOutlet weak var imageView: UIView!

    @IBOutlet weak var map: MKMapView!
    
    var isMapViewShowing = true
    var isPopUpShowing = false
    
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
    
    var ann = MyAnnotation(title: "Oxford English Center", subtitle: "Exchange in 2010", coordinate:
        CLLocationCoordinate2DMake(0.0, 0.0))
    
    override func viewDidLoad() {
        customizeBars()
        
        PopUpView.alpha = 0.0
        PopUpView.layer.zPosition = 1
        PopUpView.layer.cornerRadius = 5
        PopUpView.layer.masksToBounds = true
        PopUpView.layer.shadowOpacity = 0.8
        PopUpView.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
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
        
        let exchangeLocation = CLLocation(latitude: 51.76466, longitude: -1.26057)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(exchangeLocation.coordinate, 1000, 1000)
        ann = MyAnnotation(title: "Oxford English Center", subtitle: "Exchange in 2010", coordinate:
            CLLocationCoordinate2DMake(exchangeLocation.coordinate.latitude, exchangeLocation.coordinate.longitude))
        self.map.setRegion(coordinateRegion, animated: true)
        self.map.addAnnotation(ann)
        
        var circle = MKCircle(centerCoordinate: exchangeLocation.coordinate, radius: 200)
        self.map.addOverlay(circle)
        self.map.selectAnnotation(ann, animated: true)
        
        self.map.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        
//         NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update08"), userInfo: nil, repeats: false)
         NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("update03"), userInfo: nil, repeats: false)
         NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("update06"), userInfo: nil, repeats: false)
         NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("update05"), userInfo: nil, repeats: false)
         NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("update09"), userInfo: nil, repeats: false)
    }
    
    @IBAction func showDetails(sender: AnyObject) {
        
        if !isPopUpShowing {
            UIView.animateWithDuration(0.8, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.PopUpView.alpha = 1.0
                }, completion: nil)
            
            if isMapViewShowing {
                counterViewTap(nil)
            }
            
            self.button.setTitle("Tap on map for more", forState: UIControlState.Normal)
            isPopUpShowing = true
        } else {
            UIView.animateWithDuration(0.8, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.PopUpView.alpha = 0.0
            }, completion: nil)
            self.button.setTitle("Tap here for more Information", forState: UIControlState.Normal)
            
            isPopUpShowing = false
        }
    }
    
    @IBAction func counterViewTap(gesture:UITapGestureRecognizer?) {
        if (isMapViewShowing) {
            
            //hide image
            UIView.transitionFromView(imageView,
                toView: map,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion:nil)
            self.button.setTitle("Tap on map for more", forState: UIControlState.Normal)
            self.map.selectAnnotation(ann, animated: true)
        } else {
            
            //show image
            UIView.transitionFromView(map,
                toView: imageView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromRight
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion: nil)
            self.button.setTitle("close", forState: UIControlState.Normal)
            self.map.selectAnnotation(ann, animated: true)
        }
        isMapViewShowing = !isMapViewShowing
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if let annotation = annotation as? MyAnnotation {
            
            let identifier = "pin"
            var view: MKPinAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
                view.animatesDrop = true
                view.canShowCallout = true
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            return view
        }
        return nil
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if (overlay is MKCircle) {
            var pr = MKCircleRenderer(overlay: overlay);
            pr.strokeColor = UIColor.redColor().colorWithAlphaComponent(0.3);
            pr.fillColor = UIColor.redColor().colorWithAlphaComponent(0.1)
            pr.lineWidth = 5;
            return pr;
        }
        
        return nil
    }

    
    func update06() {
        if self.circleGraph6.endArc != 0.6 {
            self.circleGraph6.endArc += 0.1
            self.circleGraph4.endArc += 0.1
            
            NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update06"), userInfo: nil, repeats: false)
        }
    }

    func update05() {
        if self.circleGraph1.endArc != CGFloat(0.5) {
            self.circleGraph1.endArc += 0.1
            self.circleGraph2.endArc += 0.1
            self.circleGraph5.endArc += 0.1
            
            NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update05"), userInfo: nil, repeats: false)
        }
    }

    func update09() {
        if self.circleGraph7.endArc != CGFloat(0.7) {
            self.circleGraph7.endArc += 0.1
            self.circleGraph3.endArc += 0.1
            
            NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update09"), userInfo: nil, repeats: false)
        }
    }
    
    func update03() {
        if self.circleGraph8.endArc != CGFloat(0.2) {
            self.circleGraph8.endArc += 0.1
            
            NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("update03"), userInfo: nil, repeats: false)
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