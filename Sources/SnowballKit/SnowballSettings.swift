//
//  SnowballSettings.swift
//  SnowballKit
//
//  Created by Vivian Phung on 5/1/23.
//

import Foundation

public class SnowballSettings: ObservableObject {
    @Published public var ethAddress: String
    public var alchemyApiKey: String
    
    public init(alchemyApiKey: String, address: String) {
        self.alchemyApiKey = alchemyApiKey
        self.ethAddress = address
    }
}
