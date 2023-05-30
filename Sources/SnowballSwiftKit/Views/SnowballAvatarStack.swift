//
//  SnowballAvatarStack.swift
//  
//
//  Created by Vivian Phung on 5/29/23.
//

import UIKit
import SwiftUI
import SnowballAssetKit

public struct SnowballAvatarStack: View {
    var avatars: [Image]
    var number: Int

    public init(_ avatars: [Image]) {
        self.number = avatars.count - 4
        self.avatars = Array(avatars.prefix(4))
    }

    public var body: some View {
        HStack(spacing: -10) {
            ForEach(Array(zip(avatars.indices, avatars)), id: \.0) { _, avatar in
               SnowballAvatar(avatar)
            }
            if self.number > 0 {
                SnowballAvatar(self.number)
            }
        }
    }
}

struct SnowballAvatarStack_Previews: PreviewProvider {
    static var previews: some View {
        SnowballAvatarStack([SnowballImage(.sol),
                             SnowballImage(.metamask)])
            .frame(height: 32)
    }
}
