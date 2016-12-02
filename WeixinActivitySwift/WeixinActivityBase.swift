//
//  WeixinActivityBase.swift
//  WeixinActivitySwift
//
//  Created by Zhou Hao on 02/12/16.
//  Copyright © 2016年 Zhou Hao. All rights reserved.
//

import UIKit

class WeixinActivityBase : UIActivity {
    var title: String = ""
    var image: UIImage?
    var url: URL?
    var scene: WXScene = WXSceneSession
    
    override open class var activityCategory: UIActivityCategory {
        get {
            return UIActivityCategory.share
        }
    }
    
    override var activityType: UIActivityType? {
        return UIActivityType(rawValue: "WeixinActivity")
    }
    
    override open func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        
        if WXApi.isWXAppInstalled() && WXApi.isWXAppSupport() {
            for activityItem in activityItems {
                if activityItem is UIImage {
                    return true
                }
                if activityItem is URL {
                    return true
                }
            }
        }
        return false
    }
    
    override open func prepare(withActivityItems activityItems: [Any]) {
        for activityItem in activityItems {
            if activityItem is UIImage {
                image = activityItem as? UIImage
            }
            if activityItem is URL {
                url = activityItem as? URL
            }
            if activityItem is String {
                title = activityItem as! String
            }
        }
    }
    
    func setThumbImage(req : SendMessageToWXReq) {
    
        if image != nil {
            let width = 100.0
            let height = image!.size.height * 100.0 / image!.size.width
            UIGraphicsBeginImageContext(CGSize(width:Double(width), height:Double(height)))
            image?.draw(in: CGRect(x: 0.0, y: 0.0, width: Double(width), height: Double(height)))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            req.message.setThumbImage(scaledImage)
        }
    }
    
    override func perform() {
 
        let req = SendMessageToWXReq()
        req.scene = Int32(scene.rawValue)
                
        req.message = WXMediaMessage()
        if scene == WXSceneSession {
            req.message.title = "Share"
            req.message.description = title
        } else {
            req.message.title = title
        }
        self.setThumbImage(req: req)
        
        if url != nil {
            let webObject = WXWebpageObject()
            webObject.webpageUrl = url!.absoluteString
            req.message.mediaObject = webObject
        } else if image != nil {
            let imageObject = WXImageObject()
            imageObject.imageData = UIImageJPEGRepresentation(image!, 1)
            req.message.mediaObject = imageObject
        }
        WXApi.send(req)
        self.activityDidFinish(true)
    }
    
}
