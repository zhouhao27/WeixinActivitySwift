//
//  ViewController.swift
//  WeixinActivitySwift
//
//  Created by Zhou Hao on 02/12/16.
//  Copyright © 2016年 Zhou Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activities = [UIActivity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activities = [WeixinSessionActivity(), WeixinTimelineActivity()];
    }

    @IBAction func onShare(_ sender: Any) {
        let activityView = UIActivityViewController(activityItems: ["My title",UIImage(named:"Oauth")!, URL(string: "http://www.google.com")!], applicationActivities: activities)
        activityView.excludedActivityTypes = [.assignToContact,.copyToPasteboard,.print]
        
        self.present(activityView, animated: true, completion: nil)
    }

}

