//
//  File.swift
//  
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct NFTListView: View {
    @StateObject private var viewModel = NFTViewModel()
    let ethAddress: String
    
    public var body: some View {
        List(viewModel.nfts) { nft in
                HStack {
                    SnowballImage(url: URL(string: nft.media.first?.thumbnail ?? "https://en.wikipedia.org/wiki/File:Lynx_kitten.jpg")!) {
                        ProgressView()
                    } image: { image in
                        Image(uiImage: image)
                    }
                    Text(nft.title)
                        .font(.caption)
                        .lineLimit(1)
                        .padding(.top, 5)
                }
        }
        
        .onAppear {
            viewModel.fetchNFTs(forAddress: ethAddress, key: ALCHEMY_API_KEY)
        }
    }
}

struct NFTListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NFTListView(ethAddress: "vivianphung.eth")
        }
    }
}
