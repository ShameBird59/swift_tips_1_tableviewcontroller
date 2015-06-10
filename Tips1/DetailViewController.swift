//
//  DetailViewController.swift
//  Tips1
//
//  Created by katata on 2015/05/11.
//  Copyright (c) 2015年 Shun Katata. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var mUrl:String = "";
    var wb:UIWebView = UIWebView()
    override func loadView() {
        var screenFrame = UIScreen.mainScreen().bounds
        var v = UIView(frame: screenFrame)
        wb.frame = screenFrame
        let url = NSURL(string: mUrl)
        let request = NSURLRequest(URL: url!)
        //wb.delegate = self
        wb.loadRequest(request)
        v.addSubview(wb)
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        wb.loadHTMLString("", baseURL: nil)
        wb.stopLoading()
        wb.delegate = nil
        wb.removeFromSuperview()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
