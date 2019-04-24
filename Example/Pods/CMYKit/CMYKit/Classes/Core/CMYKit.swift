//
//  CMYExtension.swift
//  CMYKit
//
//  Created by  MarvinChan on 2019/3/27.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import Foundation
import UIKit

public struct CMYKit<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol ExtensionCompatible {
    associatedtype CompatibleType
    var cmy: CompatibleType { get }
}

extension ExtensionCompatible {
    public var cmy: CMYKit<Self> {
        get { return CMYKit(self) }
    }
}


extension NSObject: ExtensionCompatible { }
