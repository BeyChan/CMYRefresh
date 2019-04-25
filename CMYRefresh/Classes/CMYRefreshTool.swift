//
//  CMYRefreshTool.swift
//  CMYRefresh
//
//  Created by Melody on 2019/4/24.
//

import UIKit

extension UIView {
    //设置view的anchorPoint，同时保证view的frame不改变
    public func setAnchorPoint(_ anchorPoint: CGPoint) {
        let oldOrigin = frame.origin
        layer.anchorPoint = anchorPoint
        let newOrign = frame.origin
        let transition = CGPoint(x: newOrign.x - oldOrigin.x, y: newOrign.y - oldOrigin.y)
        center = CGPoint(x: center.x - transition.x, y: center.y - transition.y)
    }
}


// MARK: - Function
func radiansToDegress(_ radians: Double) -> CGFloat {
    return CGFloat(((radians / Double.pi) * 180.0))
}
func degreesToRadians(_ degrees: Double) -> CGFloat {
    return CGFloat(((degrees * Double.pi) / 180.0))
}

func imageFromBundle(named: String) -> UIImage? {
    let cmyrefreshBundel = Bundle(for: CMYRefresh.self)
    let directory = cmyrefreshBundel.infoDictionary?["CFBundleName"] as? String
    let path = cmyrefreshBundel.path(forResource: directory, ofType: "bundle") ?? ""
    let bundle = Bundle(path: path)
    let imagePath = bundle?.path(forResource: named, ofType: "png") ?? ""
    let image = UIImage(contentsOfFile: imagePath)
    return image
}
