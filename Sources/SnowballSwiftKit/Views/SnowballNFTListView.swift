//
//  SnowballNFTListView.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct SnowballNFTListView: View {
    @StateObject private var viewModel = AlchemyNFTViewModel()
    let ethAddress: String
    
    public var body: some View {
        List(viewModel.nfts) { nft in
                HStack {
                    AsyncImage(url: URL(string: nft.media.first?.thumbnail ?? "https://en.wikipedia.org/wiki/File:Lynx_kitten.jpg")!)
                    
                    Text(nft.title)
                        .font(.caption)
                        .lineLimit(1)
                        .padding(.top, 5)
                }
        }
        
        .onAppear {
            viewModel.fetchNFTs(forAddress: ethAddress, key: "")
        }
    }
}

struct NFTListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SnowballNFTListView(ethAddress: "vivianphung.eth")
        }
    }
}
