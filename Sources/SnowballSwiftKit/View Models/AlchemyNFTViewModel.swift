//
//  AlchemyNFTViewModel.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI
import Alamofire

// todo: make generic
public class AlchemyNFTViewModel: ObservableObject {
    @Published var nfts = [AlchemyNFT]()
    
    func fetchNFTs(forAddress address: String, query: String = "", key: String) {
        let url = "https://eth-mainnet.g.alchemy.com/nft/v2/\(key)/getNFTs?owner=\(address)&orderBy=transferTime&excludeFilters%5B%5D=SPAM&excludeFilters%5B%5D=AIRDROPS&spamConfidenceLevel=LOW"

        AF.request(url).responseDecodable(of: AlchemyNFTListModel.self) { response in
            switch response.result {
            case .success(let nftList):
                self.nfts = nftList.nfts.filter({ $0.title != "" })
            case .failure(let error):
                print("Error fetching NFTs: \(error)")
            }
        }
    }
}
