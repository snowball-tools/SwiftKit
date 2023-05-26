//
//  SnowballNFTListView.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI
import Nuke
import NukeUI

// todo: snowball settings
public struct SnowballNFTListView: View {
    @StateObject private var viewModel = AlchemyNFTViewModel()
    @State private var listId = UUID()
    let ethAddress: String

    // todo: snowball settings with api key
    var alchemyKey: String

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
        List(viewModel.nfts) { nft in
            let view = VStack {
                VStack {
                    makeImage(url: URL(string: nft.media.first?.thumbnail ?? "https://en.wikipedia.org/wiki/File:Lynx_kitten.jpg")!)
                    Text(nft.title)
                        .font(.caption)
                        .lineLimit(1)
                }.padding()
            }.listRowInsets(EdgeInsets(.zero))
            if #available(iOS 15, *) {
                view.listRowSeparator(.hidden)
            } else {
                view
            }
        }
        .id(listId)
        .navigationBarItems(trailing: Button(action: {
            ImagePipeline.shared.cache.removeAll()
            self.listId = UUID()
        }, label: {
            Image(systemName: "arrow.clockwise")
        }))
        .listStyle(.plain)
        .onAppear {
            viewModel.fetchNFTs(forAddress: ethAddress, key: alchemyKey)
        }
    }

    func makeImage(url: URL) -> some View {
        LazyImage(url: url) { state in
            if let container = state.imageContainer, container.type ==  .gif, let data = container.data {
                GIFImage(data: data)
            } else if let image = state.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Color.gray.opacity(0.2)
            }
        }
        .pipeline(pipeline)
    }
}
