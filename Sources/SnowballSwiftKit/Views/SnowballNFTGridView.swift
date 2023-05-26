//
//  SnowballNFTGridView.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI
import Nuke
import NukeUI

// todo: snowball settings
public struct SnowballNFTGridView: View {
    @State private var listId = UUID()
    @StateObject private var viewModel = AlchemyNFTViewModel()
    var ethAddress: String

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

    private let pipeline = ImagePipeline {
        $0.dataLoader = {
            let config = URLSessionConfiguration.default
            config.urlCache = nil
            return DataLoader(configuration: config)
        }()
    }

    public var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: gridLayout, spacing: 10) {
                    ForEach(viewModel.nfts) { nft in
                            VStack(alignment: .leading) {
                                VStack {
                                    Spacer()
                                    makeImage(url: URL(string: nft.media.first?.thumbnail ?? "https://en.wikipedia.org/wiki/File:Lynx_kitten.jpg")!)
                                    Spacer()
                                }
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
                .navigationBarItems(trailing: Button(action: {
                    ImagePipeline.shared.cache.removeAll()
                    self.listId = UUID()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                }))
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.fetchNFTs(forAddress: self.ethAddress, key: alchemyKey)
            }
        }
    }

    func makeImage(url: URL) -> some View {
        LazyImage(url: url) { state in
            if let container = state.imageContainer, container.type ==  .gif, let data = container.data {
                GIFImage(data: data)
            } else if let image = state.image {
                image
                    .resizable()
                    .scaledToFit()
            } else {
                Color.gray.opacity(0.2)
            }
        }
        .pipeline(pipeline)
    }
}
