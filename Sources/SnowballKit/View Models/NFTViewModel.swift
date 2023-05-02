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
