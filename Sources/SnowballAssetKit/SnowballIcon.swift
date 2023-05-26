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
    
    public var type: SnowballIconType {
        switch self {
        case .metamask, .phantom, .walletConnect, .brave, .ledger, .coinbaseWallet, .trezor, .trust, .argent:
            return .wallet
        default:
            return .asset
        }
    }
    
    public var assetName: String {
        self.type == .wallet ? self.rawValue + "_circle" : self.rawValue.uppercased()
    }
    
    
}
