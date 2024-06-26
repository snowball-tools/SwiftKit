//
//  SnowballAvatarStack.swift
//  SwiftKit
//
//  Created by Vivian Phung on 5/29/23.
//

import SwiftUI

struct AvatarStack: View {
    let avatars: [URL?]
    let size: CGFloat
    let spacing: CGFloat
    let maxDisplayed: Int
    
    init(avatars: [URL?], size: CGFloat = 40, spacing: CGFloat = -15, maxDisplayed: Int = 4) {
        self.avatars = avatars
        self.size = size
        self.spacing = spacing
        self.maxDisplayed = maxDisplayed
    }
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<min(avatars.count, maxDisplayed), id: \.self) { index in
                Avatar(imageURL: avatars[index], size: size, showPlaceholder: avatars[index] == nil)
            }
            if avatars.count > maxDisplayed {
                Avatar(size: size)
            }
        }
    }
}

struct AvatarStack_Previews: PreviewProvider {
    static let sampleAvatars: [URL?] = [
        URL(string: avatarImageUrlString),
        URL(string: avatarImageUrlString),
        nil,
        URL(string: avatarImageUrlString),
        URL(string: avatarImageUrlString),
        URL(string: avatarImageUrlString)
    ]
    
    static var previews: some View {
        Group {
            // Default configuration
            AvatarStack(avatars: sampleAvatars)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Default Group")
            
            // Larger size and different spacing
            AvatarStack(avatars: sampleAvatars, size: 60, spacing: -20)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Large Avatars")
            
            // Fewer avatars
            AvatarStack(avatars: Array(sampleAvatars.prefix(3)))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Few Avatars")
            
            // Dark mode
            AvatarStack(avatars: sampleAvatars)
                .previewLayout(.sizeThatFits)
                .padding()
                .background(Color.black)
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode Group")
        }
    }
}
