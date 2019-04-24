//
//  CMYRuntime.swift
//  CMYKit
//
//  Created by  MarvinChan on 2019/3/28.
//

import Foundation

public final class CMYRuntime {
    
    /// 交换方法
    ///
    /// - Parameters:
    ///   - selector: 被交换的方法
    ///   - replace: 用于交换的方法
    ///   - classType: 所属类型
    public static func exchangeMethod(selector: Selector, replace: Selector, class classType: AnyClass) {
        let select1 = selector
        let select2 = replace
        let select1Method = class_getInstanceMethod(classType, select1)
        let select2Method = class_getInstanceMethod(classType, select2)
        let didAddMethod  = class_addMethod(classType,
                                            select1,
                                            method_getImplementation(select2Method!),
                                            method_getTypeEncoding(select2Method!))
        if didAddMethod {
            class_replaceMethod(classType,
                                select2,
                                method_getImplementation(select1Method!),
                                method_getTypeEncoding(select1Method!))
        }else {
            method_exchangeImplementations(select1Method!, select2Method!)
        }
    }
    
}
