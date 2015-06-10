//
//  ViewController.swift
//  Tips1
//
//  Created by 管理者 on 2015/04/12.
//  Copyright (c) 2015年 Shun Katata. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    struct Item {
        var title:String = "";
        var url:String = ""
    }
    var mItems:[Item] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Qiita"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        var myRequest:NSURLRequest  = NSURLRequest(URL: NSURL(string:"https://qiita.com/api/v2/items")!)
        NSURLConnection.sendAsynchronousRequest(myRequest, queue: NSOperationQueue.mainQueue(), completionHandler: comp)
    }
    
    func comp(res: NSURLResponse?, data: NSData?, error: NSError?) {
        if(error != nil){
            // TODO:エラー処理
            return
        }
        
        let json = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSArray
        for data in json {
            var item = Item(
                title:data["title"] as! String,
                url:data["url"] as! String
            )
            mItems.append(item)
        }
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let item = mItems[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let item = mItems[indexPath.row]
        var vc = DetailViewController();
        vc.mUrl = item.url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
