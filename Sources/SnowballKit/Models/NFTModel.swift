//
//  NFTModel.swift
//  SnowballKit
//
//  Created by Vivian Phung on 5/1/23.
//

import Foundation

struct NFTList: Codable {
    let nfts: [NFT]
    
    enum CodingKeys: String, CodingKey {
        case nfts = "ownedNfts"
    }
}

struct NFT: Codable, Identifiable {
    let contract: Contract
    let nftId: ID
    let balance: String
    let title: String
    let description: String
    let tokenUri: TokenUri
    let media: [Media]
    let timeLastUpdated: String
    let contractMetadata: ContractMetadata
    
    var id: UUID = UUID()
    var imageUrl: String? { media.first?.raw }
    
    enum CodingKeys: String, CodingKey {
        case contract, balance, title, description, tokenUri, media, timeLastUpdated, contractMetadata
        case nftId = "id"
    }
}

struct Contract: Codable {
    let address: String
}

struct ID: Codable {
    let tokenId: String
    let tokenMetadata: TokenMetadata
}

struct TokenMetadata: Codable {
    let tokenType: String
}

struct TokenUri: Codable {
    let gateway: String
    let raw: String
}

struct Media: Codable {
    let gateway: String
    let thumbnail: String?
    let raw: String
    let format: String?
}

struct ContractMetadata: Codable {
    let name: String?
    let symbol: String?
    let totalSupply: String?
    let tokenType: String?
    let contractDeployer: String?
    let deployedBlockNumber: Int?
    let openSea: OpenSea?
}

struct OpenSea: Codable {
    let floorPrice: Double?
    let collectionName: String?
    let safelistRequestStatus: String?
    let imageUrl: String?
    let description: String?
    let externalUrl: String?
    let lastIngestedAt: String?
}
