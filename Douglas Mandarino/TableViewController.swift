

import UIKit

class TableViewController: UITableViewController{

    //MARK: Properties

//    private var resultData = [AvailableTime]()
    
    @IBOutlet var resultTableView: UITableView!
    
    //MARK: UIViewController Methods
    
    override func viewDidLoad(){

        self.title = "Available Times"
        resultTableView.reloadData()
    }
    //MARK: TableView DataSource Methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return resultData.count
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = resultTableView.dequeueReusableCellWithIdentifier("ResultTableViewCell") as? ProjectTableViewCell
        
        if cell == nil{
            let nib = UINib(nibName: "ResultCustomCell", bundle: NSBundle.mainBundle())
            resultTableView.registerNib(nib, forCellReuseIdentifier: "ResultTableViewCell")
            cell = resultTableView.dequeueReusableCellWithIdentifier("ResultTableViewCell") as? ProjectTableViewCell
        }
        
//        cell?.weekDay.text = resultData[indexPath.row].getDay()
//        cell?.timeSpan.text = resultData[indexPath.row].getHour()
        
        return cell!
    }
    
    
    //MARK: TableView Delegate Methods
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    
    //MARK: Custom Methods
    
//    func loadScheduleData(scheduleData: [AvailableTime]){
//        
//        resultData = scheduleData
//        
//        //TESTE
//        for data in resultData{
//            println(data.getDay() + "   " + data.getHour() + "\n")
//        }
//    }
}
