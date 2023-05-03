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
            if nft.title != "" {
                HStack {
                    SnowballImage(url: URL(string: nft.media.first?.thumbnail ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fsearch%3Fk%3Dcat&psig=AOvVaw2Njrhkm-eHhxkL2ygGDl3M&ust=1683068826258000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCMDw6I2e1f4CFQAAAAAdAAAAABAE")!) {
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
