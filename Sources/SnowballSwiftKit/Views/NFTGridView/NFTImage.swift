//
//  NFTImage.swift
//  SwiftKit
//
//  Created by Vivian Phung on 6/26/24.
//

import SwiftUI

/// A view that asynchronously loads and displays an NFT image.
///
/// `NFTImage` is designed to handle the loading and presentation of NFT images,
/// providing appropriate placeholder and error states during the loading process.
///
/// Example usage:
///
///     NFTImage(url: "https://example.com/nft.jpg")
///         .frame(width: 200, height: 200)
///
/// This view uses `AsyncImage` internally to manage image loading and provides
/// a consistent appearance for NFT images throughout your app.
///
/// - Note: If the provided URL is invalid or the image fails to load, a gray placeholder will be displayed.
///
/// - Important: Ensure that the app has the necessary permissions to load images from the network.
public struct NFTImage: View {
    let url: String?
    
    /// Creates a new instance of NFTImage.
    ///
    /// - Parameter url: An optional string representing the URL of the NFT image.
    ///   If `nil` or an invalid URL is provided, a placeholder will be shown.
    public var body: some View {
        AsyncImage(url: URL(string: url ?? avatarImageUrlString)) { phase in
            switch phase {
            case .empty, .failure:
                Color.gray.opacity(0.2)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            @unknown default:
                EmptyView()
            }
        }
        .aspectRatio(contentMode: .fit)
    }
}
