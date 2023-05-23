//
//  SnowballSwiftExampleNFTGridView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleNFTView: View {
    // todo: Snowball Settings for app wide settings
    var alchemyKey: String
    var type: NFTViewType = .grid

    var body: some View {
        switch type {
        case .grid:
            SnowballNFTGridView(ethAddress: "vivianphung.eth", alchemyKey: alchemyKey)
        case .list:
            SnowballNFTListView(ethAddress: "vivianphung.eth", alchemyKey: alchemyKey)
        }
    }
}

enum NFTViewType: String {
    case grid = "grid"
    case list = "list"
}
