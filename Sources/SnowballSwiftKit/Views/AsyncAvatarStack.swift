//
//  AsyncAvatarStack.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI

public struct AsyncAvatarStack: View {
    @StateObject var viewModel = AvatarRemoteViewModel()
    let avatars: [AvatarRemoteModel]
    let number: Int

    public init(_ avatars: [AvatarRemoteModel]) {
        self.number = avatars.count - 4
        self.avatars = Array(avatars.prefix(4))
    }

    public var body: some View {
        HStack(spacing: -20) {
            ForEach(Array(zip(viewModel.avatars.indices, viewModel.avatars)), id: \.0) { index, _ in
                if viewModel.images.count > 0 {
                    AvatarView(viewModel.images[index])
                } else {
                    AvatarView()
                }
            }
            if self.number > 0 {
                AvatarView(self.number)
            }
        }
        .onAppear {
            viewModel.fetchAvatars(avatars: avatars)
        }
    }
}

struct AsyncAvatarStack_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AsyncAvatarStack([AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])
            AsyncAvatarStack([AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg")])

            AsyncAvatarStack([AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg")])

            AsyncAvatarStack([AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])

            AsyncAvatarStack([AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/68/Orange_tabby_cat_sitting_on_fallen_leaves-Hisashi-01A.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), AvatarRemoteModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])
        }
    }
}
