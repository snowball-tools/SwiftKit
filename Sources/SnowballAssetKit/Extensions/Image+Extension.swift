//
//  Image+Extension.swift
//  SnowballAssetKit
//
//  Created by Vivian Phung on 5/23/23.
//

import UIKit
import SwiftUI

public func SnowballImage(_ name: String) -> Image {
    Image(uiImage: SnowballUIImage(name))
}

public func SnowballImage(_ type: SnowballIcon, assetType: SnowballIconAssetType = .image) -> Image {
    Image(type, assetType: assetType)
}

public extension Image {
    init(_ type: SnowballIcon) {
        self.init(uiImage: UIImage(type))
    }
    
    init(_ type: SnowballIcon, assetType: SnowballIconAssetType = .image) {
        self.init(uiImage: UIImage(type, assetType: assetType))
    }
}
