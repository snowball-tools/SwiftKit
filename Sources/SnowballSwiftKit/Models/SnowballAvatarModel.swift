//
//  SnowballAvatarModel.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import Foundation

public struct SnowballAvatarModel: Codable, Identifiable {
    public var id = UUID()
    var image: URL

    public init(imageURL: String) {
        self.image = URL(string: imageURL) ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")!
    }
}
