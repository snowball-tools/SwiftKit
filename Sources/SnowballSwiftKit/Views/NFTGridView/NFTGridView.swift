//
//  NFTGridView.swift
//  SwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

/// A view that displays a grid of NFTs associated with an Ethereum address.
///
/// Use `NFTGridView` to present a collection of NFTs in a scrollable grid layout.
/// This view fetches NFT data using the Alchemy API and displays each NFT as a thumbnail
/// with its title.
///
/// Example usage:
///
///     NFTGridView(
///         ethAddress: "0x1234...5678",
///         alchemyKey: "your_alchemy_key",
///         chain: .eth_mainnet
///     )
///
/// The view includes a refresh button in the navigation bar to update the NFT list.
///
/// - Note: Ensure you have a valid Alchemy API key to fetch NFT data.
///
/// - Important: This view requires an active internet connection to fetch NFT data.
public struct NFTGridView: View {
    @State private var listId = UUID()
    @StateObject private var viewModel = AlchemyViewModel<AlchemyNFTListModel>()
    
    let ethAddress: String
    let chain: SnowballChain
    let alchemyKey: String
    
    private let gridLayout = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    /// Creates a new instance of the NFT grid view.
    ///
    /// - Parameters:
    ///   - ethAddress: The Ethereum address for which to fetch NFTs.
    ///   - alchemyKey: The API key for Alchemy services.
    ///   - chain: The blockchain network to use. Defaults to Ethereum mainnet.
    public init(ethAddress: String, alchemyKey: String, chain: SnowballChain = .eth_mainnet) {
        self.ethAddress = ethAddress
        self.alchemyKey = alchemyKey
        self.chain = chain
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 10) {
                if let nfts = viewModel.models?.nfts {
                    ForEach(nfts) { nft in
                        NFTGridItem(nft: nft)
                    }
                } else {
                    ProgressView()
                }
            }
            .padding(10)
        }
        .navigationBarItems(trailing: refreshButton)
        .onAppear(perform: fetchNFTs)
    }
    
    private var refreshButton: some View {
        Button(action: refreshList) {
            Image(systemName: "arrow.clockwise")
        }
    }
    
    private func refreshList() {
        listId = UUID()
        fetchNFTs()
    }
    
    private func fetchNFTs() {
        viewModel.fetch(type: .nfts(key: alchemyKey, address: ethAddress), chain: chain)
    }
}

struct NFTGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NFTGridView(
                ethAddress: ethTestingAddress,
                alchemyKey: alchemyApiKey,
                chain: .eth_mainnet
            )
            .navigationTitle("NFT Collection")
        }
    }
}
