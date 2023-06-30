//
//  AvatarModel.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import Foundation
import UIKit
import SnowballAssetKit

public struct AvatarRemoteModel: Codable, Identifiable {
    public var id = UUID()
    var imageURL: URL

    public init(imageURL: String) {
        self.imageURL = URL(string: imageURL) ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")!
    }
}
