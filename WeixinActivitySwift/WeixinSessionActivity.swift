//
//  WeixinSessionActivity.swift
//  WeixinActivitySwift
//
//  Created by Zhou Hao on 02/12/16.
//  Copyright © 2016年 Zhou Hao. All rights reserved.
//

import Foundation

class WeixinSessionActivity : WeixinActivityBase {
    
    override init() {
        super.init()
        self.scene = WXSceneSession
    }
    
    override open var activityImage: UIImage? {
        get {
            return Int(UIDevice.current.systemVersion)! >= 8 ? UIImage(named: "icon_session-8.png") : UIImage(named: "icon_session.png")
        }
    }
    
    override var activityTitle: String? {
        get {
            return NSLocalizedString("WeChat Session", comment: "Session Title")
        }
    }

}
