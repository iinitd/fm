//
//  ChannelController.swift
//  fm
//
//  Created by Cogons on 16/7/29.
//  Copyright © 2016年 Cogons. All rights reserved.
//

import UIKit


class ChannelController: UITableViewController,HttpProtocol {
    
    //定义一个变量，接收频道的歌曲数据
    var tableData = []
    
    //定义一个变量，接收频道的数据
    var channelData = []
    var data = [:]
    var num:Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()

        var eHttp:HttpController = HttpController()
        eHttp.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        eHttp.onSearch("https://www.douban.com/j/app/radio/channels")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return self.channelData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("channel", forIndexPath: indexPath)
        
       
        cell.textLabel?.text = self.channelData[indexPath.row]["name"] as! String
        //cell.textLabel?.text = self.channelData[indexPath.row]["name"]!!.string
        // Configure the cell...

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func didReceive(results:AnyObject){
        //        println("获取到得数据：\(results)")
        //print(results)
        self.data = results as! NSDictionary
        
        if results["channels"] != nil{
            self.channelData = results["channels"] as! NSArray
        } else if results["song"] != nil{
            self.tableData = results["song"] as! NSArray
        }
        
        self.num = self.channelData.count
        //print(self.channelData)
        //print(self.tableData)
        self.tableView.reloadData()

    }
    }



