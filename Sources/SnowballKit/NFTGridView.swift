//
//  File.swift
//  
//
//  Created by Vivian Phung on 5/1/23.
//

import Foundation
import SwiftUI

struct NFTGridView: View {
    @EnvironmentObject var settings: SnowballSettings
    @StateObject private var viewModel: NFTViewModel = NFTViewModel()
    
    private var gridLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: gridLayout, spacing: 10) {
                        ForEach(viewModel.nfts) { nft in
                            VStack(alignment: .leading) {
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
                            .padding(5)
                            .background(Color(.systemGroupedBackground))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        }
                    }
                    .padding(10)
                }
            }
            .navigationTitle("NFTs")
            .onAppear {
                viewModel.fetchNFTs(forAddress: settings.ethAddress)
            }
        }
    }
}

//struct NFTGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            NFTGridView()
//        }
//        .background(Color.gray)
//        .ignoresSafeArea(.all)
//        .environmentObject(SnowballSettings(alchemyApiKey: ALCHEMY_API_KEY, address: "vivianphung.eth"))
//    }
//}
//
