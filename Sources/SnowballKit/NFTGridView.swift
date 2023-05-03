//
//  File.swift
//  
//
//  Created by Vivian Phung on 5/1/23.
//

import Foundation
import SwiftUI

struct NFTGridView: View {
    @StateObject private var viewModel = NFTViewModel()
        
    let ethAddress: String
    
    private var gridLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    init(ethAddress: String) {
        self.ethAddress = ethAddress
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: gridLayout, spacing: 10) {
                        ForEach(viewModel.nfts) { nft in
                            if nft.title != "" {
                                VStack(alignment: .leading) {
                                    SnowballImage(url: URL(string: nft.media.first?.thumbnail ?? "https://en.wikipedia.org/wiki/File:Lynx_kitten.jpg")!) {
                                        ProgressView()
                                    } image: { image in
                                        Image(uiImage: image)
                                    }
                                    
                                    .onTapGesture {
                                        print(nft.title)
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
                    }
                    .padding(10)
                }
            }
            .navigationTitle("NFTs")
            .onAppear {
                viewModel.fetchNFTs(forAddress: ethAddress)
            }
        }
    }
}

struct NFTGridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NFTGridView(ethAddress: "vivianphung.eth")
        }
        .background(Color.gray)
        .ignoresSafeArea(.all)
    }
}

