//
//  CMYRefreshConfig.swift
//  CMYRefresh
//
//  Created by Melody on 2019/4/24.
//

import Foundation

/** 刷新控件的配置 */
public struct CMYRefreshConfig {
    public var textIdle = "下拉可以刷新"
    public var textReady = "松开立即刷新"
    public var textRefreshing = "正在刷新..."
    
    public var viewHeight: CGFloat = 50.0
    public var readyOffset: CGFloat = 50.0
    
    public var animationDurationFast = 0.25
    public var animationDurationSlow = 0.4
    public var parkVisible = true
    
    public init() {
        
    }
}
