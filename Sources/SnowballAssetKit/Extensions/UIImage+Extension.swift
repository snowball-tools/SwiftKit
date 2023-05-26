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
    SnowballUIImage(type.assetName)
}
