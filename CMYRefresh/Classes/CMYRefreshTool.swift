//
//  CMYRefreshTool.swift
//  CMYRefresh
//
//  Created by Melody on 2019/4/24.
//

import Foundation

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
    let fullName = "CMYRefresh.bundle/images/" + named
    let bundle = Bundle(for: CMYRefresh.self)
    let path = bundle.path(forResource: named, ofType: nil, inDirectory: "/") ?? fullName
    return UIImage(contentsOfFile: path)
}
