//
//  CMYRefreshConst.swift
//  CMYRefresh
//
//  Created by Melody on 2019/4/24.
//

import Foundation

// MARK: - Type

/** 刷新控件的位置 */
public enum CMYRefreshPosition {
    case top, left, bottom, right
}

/** 刷新控件的状态 */
public enum CMYRefreshState {
    case idle       /** 普通闲置状态 */
    case ready      /** 松开就可以进行刷新的状态 */
    case refreshing /** 正在刷新中的状态 */
}


// MARK: - Protocol

//自定义RefreshView必须实现的协议
public protocol CMYRefreshViewProtocol {
    var view: UIView { get }
    //不同状态时的显示
    func show(_ state: CMYRefreshState, config: CMYRefreshConfig, animated: Bool)
}

//为协议扩展一个默认的实现来实现类似Objc里面的可选协议
extension CMYRefreshViewProtocol {
    public func show(_ state: CMYRefreshState, config: CMYRefreshConfig, animated: Bool) { }
}

//Do UIView<SomeProtocol> in Swift
extension CMYRefreshViewProtocol where Self: UIView {
    public var view: UIView {
        return self
    }
}
