//
//  Avatar.swift
//  SwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI

struct Avatar: View {
    let imageURL: URL?
    let size: CGFloat
    let showPlaceholder: Bool
    
    init(imageURL: URL? = nil, size: CGFloat = 40, showPlaceholder: Bool = false) {
        self.imageURL = imageURL
        self.size = size
        self.showPlaceholder = showPlaceholder
    }
    
    var body: some View {
        Group {
            if let imageURL = imageURL {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
            } else if showPlaceholder {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.secondary)
            } else {
                Text("+2")
                    .font(.system(size: size * 0.4, weight: .medium))
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .background(Color.secondary.opacity(0.2))
        .clipShape(Circle())
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Single avatar with image
            Avatar(imageURL: URL(string: avatarImageUrlString))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Single Avatar")
            
            // Placeholder avatar
            Avatar(showPlaceholder: true)
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Placeholder Avatar")
            
            // +2 indicator
            Avatar()
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("+2 Indicator")
            
            // Dark mode previews
            Avatar(imageURL: URL(string: avatarImageUrlString))
                .previewLayout(.sizeThatFits)
                .padding()
                .background(Color.black)
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode Avatar")
        }
    }
}
