//
//  SnowballNFTGridView.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import Foundation
import SwiftUI

// todo: snowball settings
public struct SnowballNFTGridView: View {
    @StateObject private var viewModel = AlchemyNFTViewModel()
    @State var ethAddress: String

    // todo: snowball settings with api key
    var alchemyKey: String

    private var gridLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    public init(ethAddress: String, alchemyKey: String) {
        self.ethAddress = ethAddress
        self.alchemyKey = alchemyKey
    }

    public var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: gridLayout, spacing: 10) {
                    ForEach(viewModel.nfts) { nft in
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: nft.media.first?.thumbnail ?? "https://en.wikipedia.org/wiki/File:Lynx_kitten.jpg"))
                                Text(nft.title)
                                    .font(.caption)
                                    .lineLimit(1)
                                    .padding(.top, 5)
                            }
                            .padding(5)
                            .background(Color(.systemGroupedBackground))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        }
                }
                .padding(10)
            }
            .onAppear {
                viewModel.fetchNFTs(forAddress: self.ethAddress, key: alchemyKey)
            }
        }
    }
}
