//
//  UIImage+Extension.swift
//  SnowballAssetKit
//
//  Created by Vivian Phung on 5/23/23.
//

import UIKit

public func SnowballUIImage(_ name: String) -> UIImage {
    UIImage(named: name, in: Bundle.module, compatibleWith: nil)!
}

public func SnowballUIImage(_ type: SnowballIcon) -> UIImage {
    UIImage(type)
}

public extension UIImage {
    convenience init(_ type: SnowballIcon) {
        self.init(named: type.assetName, in: Bundle.module, compatibleWith: nil)!
    }
    
    convenience init(_ type: SnowballIcon, assetType: SnowballIconAssetType = .image) {
        self.init(named: type.string(for: assetType), in: Bundle.module, compatibleWith: nil)!
    }
}
