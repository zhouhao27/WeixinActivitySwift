//
//  WeixinTimelineActivity.swift
//  WeixinActivitySwift
//
//  Created by Zhou Hao on 02/12/16.
//  Copyright © 2016年 Zhou Hao. All rights reserved.
//

import Foundation

class WeixinTimelineActivity: WeixinActivityBase {
    
    override init() {
        super.init()
        self.scene = WXSceneTimeline
    }
    
    override open var activityImage: UIImage? {
        get {
            return Int(UIDevice.current.systemVersion)! >= 8 ? UIImage(named: "icon_timeline-8.png") : UIImage(named: "icon_timeline.png")
        }
    }
    
    override var activityTitle: String? {
        get {
            return NSLocalizedString("WeChat Timeline", comment: "Timeline Title")
        }
    }
    
}
