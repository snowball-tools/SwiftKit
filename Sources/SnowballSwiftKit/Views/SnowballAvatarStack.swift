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
            ForEach(Array(zip(avatars.indices, avatars)), id: \.0) { _, item in
                AsyncImage(url: item.image) { image in
                    SnowballAvatar(image: image)
                } placeholder: {
                    SnowballAvatar(image: Image(systemName: "person.crop.circle"))
                }
            }
        }
    }
}

struct SnowballAvatarStack_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SnowballAvatarStack([SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])

            SnowballAvatarStack([SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])

            SnowballAvatarStack([SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])

        }
    }
}
