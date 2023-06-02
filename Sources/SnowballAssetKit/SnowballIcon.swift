//
//  SnowballIconTypes.swift
//  SnowballAssetKit
//
//  Created by Vivian Phung on 5/23/23.
//

import Foundation

public enum SnowballIcon: String, CaseIterable, Identifiable {
    public var id: Self { return self }

    public enum SnowballIconType: String {
        case asset, wallet
    }

    // assets
    case sol, btc, eth, luna, avax, bnb, matic, atom, dot, ada, algo, ftt, msol, ltc, xrp, yifi, eos, ar, sec, fil, trx, xtz, sushi, ape, near, doge, srm, gmt, crv, ftm, jewel, usdc

    // external wallets
    case metamask, phantom, walletConnect, brave, ledger, coinbaseWallet, trezor, trust, argent

    case snowball

    public var type: SnowballIconType {
        switch self {
        case .metamask, .phantom, .walletConnect, .brave, .ledger, .coinbaseWallet, .trezor, .trust, .argent, .snowball:
            return .wallet
        default:
            return .asset
        }
    }

    public var assetName: String {
        switch self.type {
        case .asset:
            return self.rawValue.uppercased()
        case .wallet:
            return self.rawValue + "_circle"
        }
    }
    
    public var sfSymbol: String {
        self.assetName + "_sf_symbol"
    }
    
    public func string(for assetType: SnowballIconAssetType) -> String {
        switch assetType {
        case .image:
            return self.assetName
        case .sfSymbol:
            return self.sfSymbol
        }
    }
}

public enum SnowballIconAssetType {
    case image, sfSymbol
}
