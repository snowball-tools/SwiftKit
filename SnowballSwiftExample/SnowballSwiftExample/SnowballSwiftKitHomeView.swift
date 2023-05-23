//
//  SnowballSwiftKitHomeView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftKitHomeView: View {
    // todo: Snowball Settings for app wide settings
    let alchemyKey: String = Bundle.main.infoDictionary?["ALCHEMY_NFT_KEY"] as? String ?? ""

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Text") {
                    SnowballSwiftExampleText()
                        .navigationTitle("Text")
                }

                NavigationLink("Buttons") {
                    SnowballSwiftExampleButtonsView()
                        .navigationTitle("Buttons")
                }

                NavigationLink("NFT Grid View") {
                    SnowballSwiftExampleNFTView(alchemyKey: alchemyKey)
                        .navigationTitle("NFT Grid View")
                }
                .disabled(alchemyKey == "" || alchemyKey == "PasteNFTKeyHere")

                NavigationLink("NFT List View") {
                    SnowballSwiftExampleNFTView(alchemyKey: alchemyKey, type: .list)
                        .navigationTitle("NFT List View")
                }
                .disabled(alchemyKey == "" || alchemyKey == "PasteNFTKeyHere")

                NavigationLink("Avatar View") {
                    SnowballSwiftExampleAvatarView()
                        .navigationTitle("Avatar View")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Snowball Example")
        }
    }
}

struct SnowballSwiftKitHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftKitHomeView()
    }
}
