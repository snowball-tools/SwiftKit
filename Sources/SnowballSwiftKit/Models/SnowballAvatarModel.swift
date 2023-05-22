//
//  SnowballAvatarModel.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import Foundation

public struct SnowballAvatarModel: Codable, Identifiable {
    public var id: UUID = UUID()
    var image: URL
}
