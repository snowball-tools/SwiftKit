//
//  NFTGridItem.swift
//  SwiftKit
//
//  Created by Vivian Phung on 6/26/24.
//

import SwiftUI

/// A view that represents a single NFT item in a grid layout.
///
/// `NFTGridItem` displays an NFT's thumbnail image and title in a compact,
/// visually appealing format suitable for use within a grid or list.
///
/// Example usage:
///
///     NFTGridItem(nft: myNFTModel)
///         .frame(width: 150, height: 200)
///
/// This view encapsulates the presentation logic for an individual NFT,
/// including image loading, title display, and appropriate styling.
///
/// - Note: The view applies a shadow and corner radius for a card-like appearance.
///
/// - Important: Ensure that the `AlchemyNFTModel` contains valid data for the best visual result.
public struct NFTGridItem: View {
    /// Creates a new instance of NFTGridItem.
    ///
    /// - Parameter nft: An `AlchemyNFTModel` object containing the NFT data to be displayed.
    let nft: AlchemyNFT
    
    public var body: some View {
        VStack(alignment: .leading) {
            NFTImage(url: nft.media.first?.thumbnail)
            Text(nft.title)
                .font(.caption)
                .lineLimit(1)
                .padding(.top, 5)
        }
        .padding(5)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
