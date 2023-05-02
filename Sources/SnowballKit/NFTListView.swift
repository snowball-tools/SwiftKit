//
//  File.swift
//  
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI
import Alamofire

class NFTViewModel: ObservableObject {
    @EnvironmentObject var settings: SnowballSettings
    @Published var nfts = [NFT]()
    
    func fetchNFTs(forAddress address: String, query: String = "") {
        let url = "https://eth-mainnet.g.alchemy.com/nft/v2/\(settings.alchemyApiKey)/getNFTs?owner=\(address)&orderBy=transferTime&excludeFilters%5B%5D=SPAM&excludeFilters%5B%5D=AIRDROPS&spamConfidenceLevel=LOW"
        let searchQuery = query.isEmpty ? "" : "&search=\(query)"
        let urlString = url + searchQuery

        AF.request(urlString).responseDecodable(of: NFTList.self) { response in
            switch response.result {
            case .success(let nftList):
                self.nfts = nftList.nfts
            case .failure(let error):
                print("Error fetching NFTs: \(error)")
            }
        }
    }
}

struct NFTListView: View {
    @StateObject private var viewModel = NFTViewModel()
    let ethAddress: String

    var body: some View {
        NavigationView {
            List(viewModel.nfts) { nft in
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
            
            .navigationTitle("NFTs")
            .onAppear {
                viewModel.fetchNFTs(forAddress: ethAddress)
            }
        }
    }
}

//struct NFTListView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            NFTListView(ethAddress: "vivianphung.eth")
//        }
//        .background(Color.gray)
//        .ignoresSafeArea(.all)
//        .environmentObject(SnowballSettings(alchemyApiKey: ALCHEMY_API_KEY, address: "vivianphung.eth"))
//    }
//}
//
