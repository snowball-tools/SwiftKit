//
//  AlchemyNFTViewModel.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public class AlchemyViewModel<T: Codable>: ObservableObject {
    let apiManager = APIManagerImpl()
    @Published var models: T?

    func fetch(type endpoint: AlchemyEndpoints,
               chain: SnowballChain = .eth_mainnet) {
        let networkRequest = apiManager.networkRequest(baseURL: chain.alchemyBaseURL,
                                                       endpoint: endpoint)

        apiManager.networkTask(request: networkRequest) { [weak self] (response: Result<T, Error>) in
            switch response {
            case .success(let models):
                DispatchQueue.main.async {
                    self?.models = models
                }
            case .failure(let error):
                print("Error fetching: \(error)")
            }
        }
    }
}

extension SnowballChain {
    var alchemyBaseURL: String {
        switch self {
        case .eth_mainnet:
            return "https://eth-mainnet.g.alchemy.com"
        case .eth_goerli:
            return "https://eth-goerli.g.alchemy.com"
        case .eth_sepolia:
            return "https://eth-sepolia.g.alchemy.com"
        }
    }
}

enum AlchemyEndpoints: Endpoint {
    case nfts(key: String, address: String)

    var path: String {
        switch self {
        case .nfts(let key, let address):
            return "/nft/v2/\(key)/getNFTs?owner=\(address)&orderBy=transferTime&excludeFilters%5B%5D=SPAM&excludeFilters%5B%5D=AIRDROPS&spamConfidenceLevel=LOW"
        }
    }

    var method: Method {
        return .GET
    }
}
