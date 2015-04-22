//
//  ProfileController.swift
//  Douglas Mandarino
//
//  Created by Douglas Mandarino on 4/14/15.
//  Copyright (c) 2015 Douglas Mandarino. All rights reserved.
//

import Foundation
import UIKit

//class ProfileViewController:UIViewController, UITableViewDelegate,UITableViewDataSource{

class ProfileViewController:UIViewController {

    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
//    @IBOutlet var tableView: UITableView!
   
    var titles: [String] = [
        "Occupation",
        "University",
        "Idioms"]
    var details: [String] = [
        "Undergraduate in Computer Science",
        "PUC-Rio, Brazil",
        "English:Fluent \n Portuguese: Native \n French:Intermediate"]
    
    var font = UIFont(name: "Avenir-Book", size: 16)

    var selectedRowIndex: NSIndexPath = NSIndexPath(forRow: -1, inSection: 0)
    var cellOpenHeight:CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeBars()
        
        name.font = UIFont(name: "Avenir-Book", size: 24)
        age.font = UIFont(name: "Avenir-Book", size: 16)
        occupationLabel.font = UIFont(name: "Avenir-Book", size: 16)
    }
        
//        tableView.delegate = self
//        tableView.dataSource! = self
    
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.titles.count;
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
//        
//        let swiftColor = UIColor(red: 41/255, green:128/255, blue: 185/255, alpha: 0)
//        
//        cell.textLabel?.text = self.titles[indexPath.row]
//        cell.detailTextLabel?.text = self.details[indexPath.row]
//        cell.detailTextLabel?.numberOfLines = 5;
//
////        cell.textLabel?.font = font
////        cell.textLabel?.textColor = swiftColor
//        
//        return cell
//    }
//    
////    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
////        println("You selected cell #\(indexPath.row)!")
////        selectedRowIndex = indexPath
////        
////        tableView.beginUpdates()
////        tableView.endUpdates()
////    }
//    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
////        if indexPath.row == selectedRowIndex.row {
//////            var frame = tableView.rectForRowAtIndexPath(indexPath);
//////            if frame.height == cellOpenHeight{
//////                return 70
//////            }
////            
////            return cellOpenHeight
////        }
//        return 70
//    }

    private func customizeBars() {
        var nav = navigationController?.navigationBar
        
        let swiftColor = UIColor(red: 52/255, green:152/255, blue: 219/255, alpha: 1)
        nav!.barTintColor = swiftColor
        self.navigationController?.navigationBarHidden = false
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.tabBarController?.tabBar.tintColor = swiftColor
    }
}