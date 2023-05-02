//
//  SnowballSettings.swift
//  SnowballKit
//
//  Created by Vivian Phung on 5/1/23.
//

import Foundation

class SnowballSettings: ObservableObject {
    @Published var alchemy_api_key: String
    
    init(alchemy_api_key: String) {
        self.alchemy_api_key = alchemy_api_key
    }
}
