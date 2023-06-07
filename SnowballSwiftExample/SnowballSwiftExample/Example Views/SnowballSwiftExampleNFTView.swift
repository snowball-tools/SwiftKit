//
//  SnowballSwiftExampleNFTGridView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import Combine
import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleNFTView: View {
    @State private var chain: SnowballChain = .eth_mainnet
    var type: NFTViewType = .grid

    var body: some View {
        Group {
            switch type {
            case .grid:
                SnowballNFTGridView(ethAddress: "vivianphung.eth", alchemyKey: alchemyKey(for: chain), chain: chain)
            case .list:
                SnowballNFTListView(ethAddress: "vivianphung.eth", alchemyKey: alchemyKey(for: chain), chain: chain)
            }
        }

        // to do: set bindings
//        .navigationBarItems(trailing:
//            Picker("chain", selection: $chain) {
//                ForEach(SnowballChain.allCases, id: \.self) {
//                    Text($0.rawValue).tag($0)
//                }
//            }
//            .pickerStyle(.menu)
//        )
    }

    func alchemyKey(for chain: SnowballChain = .eth_mainnet) -> String {
        return Bundle.main.infoDictionary?["ALCHEMY_\(chain.rawValue.uppercased())_KEY"] as? String ?? ""
    }
}

enum NFTViewType: String {
    case grid = "grid"
    case list = "list"
}
