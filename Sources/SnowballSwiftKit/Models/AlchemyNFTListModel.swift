//
//  AlchemyNFTListModel.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import Foundation

public struct AlchemyNFTListModel: Codable {
    let nfts: [AlchemyNFT]
    
    enum CodingKeys: String, CodingKey {
        case nfts = "ownedNfts"
    }
}

public struct AlchemyNFT: Codable, Identifiable {
    let contract: AlchemyNFTContract
    let nftId: AlchemyNFTID
    let balance: String
    let title: String
    let description: String
    let tokenUri: AlchemyNFTTokenUri
    let media: [AlchemyNFTMedia]
    let timeLastUpdated: String
    let contractMetadata: AlchemyNFTContractMetadata
    
    public var id: UUID = UUID()
    var imageUrl: String? { media.first?.raw }
    
    enum CodingKeys: String, CodingKey {
        case contract, balance, title, description, tokenUri, media, timeLastUpdated, contractMetadata
        case nftId = "id"
    }
}

public struct AlchemyNFTContract: Codable {
    let address: String
}

public struct AlchemyNFTID: Codable {
    let tokenId: String
    let tokenMetadata: AlchemyNFTTokenMetadata
}

public struct AlchemyNFTTokenMetadata: Codable {
    let tokenType: String
}

public struct AlchemyNFTTokenUri: Codable {
    let gateway: String
    let raw: String
}

public struct AlchemyNFTMedia: Codable {
    let gateway: String
    let thumbnail: String?
    let raw: String
    let format: String?
}

public struct AlchemyNFTContractMetadata: Codable {
    let name: String?
    let symbol: String?
    let totalSupply: String?
    let tokenType: String?
    let contractDeployer: String?
    let deployedBlockNumber: Int?
    let openSea: AlchemyNFTOpenSea?
}

public struct AlchemyNFTOpenSea: Codable {
    let floorPrice: Double?
    let collectionName: String?
    let safelistRequestStatus: String?
    let imageUrl: String?
    let description: String?
    let externalUrl: String?
    let lastIngestedAt: String?
}
