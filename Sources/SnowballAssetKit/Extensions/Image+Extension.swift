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

public func SnowballImage(_ type: SnowballIcon) -> Image {
    SnowballImage(type.assetName)
}
