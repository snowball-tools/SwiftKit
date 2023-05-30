//
//  SnowballRemoteAvatarStack.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI

public struct SnowballAvatarRemoteStack: View {
    @StateObject var viewModel = SnowballAvatarRemoteViewModel()
    let avatars: [SnowballAvatarRemoteModel]
    let number: Int

    public init(_ avatars: [SnowballAvatarRemoteModel]) {
        self.number = avatars.count - 4
        self.avatars = Array(avatars.prefix(4))
    }

    public var body: some View {
        HStack(spacing: -20) {
            ForEach(Array(zip(viewModel.avatars.indices, viewModel.avatars)), id: \.0) { index, _ in
                if viewModel.images.count > 0 {
                    SnowballAvatar(viewModel.images[index])
                } else {
                    SnowballAvatar()
                }
            }
            if self.number > 0 {
                SnowballAvatar(self.number)
            }
        }
        .onAppear {
            viewModel.fetchAvatars(avatars: avatars)
        }
    }
}

struct SnowballAvatarRemoteStack_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SnowballAvatarRemoteStack([SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])
            SnowballAvatarRemoteStack([SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg")])

            SnowballAvatarRemoteStack([SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg")])

            SnowballAvatarRemoteStack([SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])

            SnowballAvatarRemoteStack([SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])
        }
    }
}
