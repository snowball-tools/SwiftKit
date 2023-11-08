//
//  SnowballNFTListView.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

// todo: snowball settings
public struct SnowballNFTListView: View {
    @StateObject private var viewModel = AlchemyViewModel<AlchemyNFTListModel>()
    @State private var listId = UUID()
    let ethAddress: String
    let chain: SnowballChain

    // todo: snowball settings with api key
    var alchemyKey: String

    public init(ethAddress: String, alchemyKey: String, chain: SnowballChain = .eth_mainnet) {
        self.ethAddress = ethAddress
        self.alchemyKey = alchemyKey
        self.chain = chain
    }

    public var body: some View {
        List(viewModel.models?.nfts ?? []) { nft in
            VStack {
                VStack {
                    makeImage(url: URL(string: nft.media.first?.thumbnail ?? "https://en.wikipedia.org/wiki/File:Lynx_kitten.jpg")!)
                    Text(nft.title)
                        .font(.caption)
                        .lineLimit(1)
                }.padding()
            }
            .listRowInsets(.init())
        }
        .id(listId)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    self.listId = UUID()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.fetch(type: .nfts(key: alchemyKey, address: ethAddress), chain: self.chain)
        }
    }

    func makeImage(url: URL) -> some View {
        AsyncImage(url: url) { state in
            if let image = state.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Color.gray.opacity(0.2)
            }
        }
    }
}
