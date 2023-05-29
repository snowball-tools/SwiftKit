//
//  SnowballAvatarStack.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI

public struct SnowballAvatarStack: View {
    var avatars: [SnowballAvatarModel]
    var number: Int

    public init(_ avatars: [SnowballAvatarModel]) {
        self.number = avatars.count - 4
        self.avatars = Array(avatars.prefix(4))
    }

    public var body: some View {
        HStack(spacing: -20) {
            ForEach(avatars, id: \.id) { avatar in
                AsyncImage(url: avatar.image) { image in
                    SnowballAvatar(image)
                } placeholder: {
                    SnowballAvatar()
                }
            }

            if self.number > 0 {
                SnowballAvatar(number: self.number)
            }
        }
        .padding(10)
    }
}

struct SnowballAvatarStack_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SnowballAvatarStack([SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])
            SnowballAvatarStack([SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg")])

            SnowballAvatarStack([SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg")])

            SnowballAvatarStack([SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])

            SnowballAvatarStack([SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])
        }
    }
}
