//
//  NFTListView.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct NFTListView: View {
    @StateObject private var viewModel: AlchemyViewModel<AlchemyNFTListModel>
    @State private var listId = UUID()
    
    private let ethAddress: String
    private let chain: SnowballChain
    private let alchemyKey: String

    public init(ethAddress: String, alchemyKey: String, chain: SnowballChain = .eth_mainnet) {
        self.ethAddress = ethAddress
        self.alchemyKey = alchemyKey
        self.chain = chain
        _viewModel = StateObject(wrappedValue: AlchemyViewModel<AlchemyNFTListModel>())
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
                ForEach(viewModel.models?.nfts ?? [], id: \.id) { nft in
                    NFTItemView(nft: nft)
                }
            }
            .padding()
        }
        .id(listId)
        .refreshable {
            await fetchNFTsAsync()
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: refreshList) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .onAppear(perform: fetchNFTs)
    }

    private func fetchNFTs() {
        viewModel.fetch(type: .nfts(key: alchemyKey, address: ethAddress), chain: chain)
    }

    private func fetchNFTsAsync() async {
        await MainActor.run {
            fetchNFTs()
        }
    }

    private func refreshList() {
        listId = UUID()
        fetchNFTs()
    }
}

private struct NFTItemView: View {
    let nft: AlchemyNFT
    
    var body: some View {
        VStack {
            makeImage(url: URL(string: nft.media.first?.thumbnail ?? avatarImageUrlString)!)
            Text(nft.title)
                .font(.caption)
                .lineLimit(1)
                .padding(.horizontal, 4)
        }
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
    }
    
    private func makeImage(url: URL) -> some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure:
                Image(systemName: "photo")
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
        .frame(height: 150)
        .clipped()
    }
}

struct NFTListView_Previews: PreviewProvider {
    static var previews: some View {
            NFTListView(
                ethAddress: ethTestingAddress,
                alchemyKey: alchemyApiKey
            )
        
    }
}
