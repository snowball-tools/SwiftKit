//
//  SnowballAvatarStack.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI

public struct SnowballAvatarStack: View {
    let colors: [Color] = [.red, .blue, .purple]

    var avatars: [SnowballAvatarModel]

    public init(_ avatars: [SnowballAvatarModel]) {
        self.avatars = avatars
    }

    public var body: some View {
        HStack(spacing: -20) {
            ForEach(Array(zip(colors.indices, colors)), id: \.0) { _, item in
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .foregroundColor(item)
            }
        }
        .padding(10)
    }
}
