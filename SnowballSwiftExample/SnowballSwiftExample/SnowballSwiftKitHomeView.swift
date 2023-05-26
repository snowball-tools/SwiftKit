//
//  SnowballSwiftKitHomeView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI
import SnowballSwiftKit
import SnowballAssetKit

struct SnowballSwiftKitHomeView: View {
    // todo: Snowball Settings for app wide settings
    let alchemyKey: String = Bundle.main.infoDictionary?["ALCHEMY_NFT_KEY"] as? String ?? ""
    @State var switchStateIsOn: Bool = false

    var body: some View {
        NavigationView {
            List {
                Group {
                    NavigationLink("Text") {
                        SnowballSwiftExampleText()
                            .navigationTitle("Text")
                    }

                    NavigationLink("Buttons") {
                        SnowballSwiftExampleButtonsView()
                            .navigationTitle("Buttons")
                    }

                    NavigationLink("Title Label") {
                        SnowballSwiftExampleTitleLabelView()
                            .navigationTitle("Title Label")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                    }

                    NavigationLink("NFT Grid View") {
                        SnowballSwiftExampleNFTView(alchemyKey: alchemyKey)
                            .navigationTitle("NFT Grid")
                    }
                    .disabled(alchemyKey == "" || alchemyKey == "PasteNFTKeyHere")

                    NavigationLink("NFT List View") {
                        SnowballSwiftExampleNFTView(alchemyKey: alchemyKey, type: .list)
                            .navigationTitle("NFT List")
                    }
                    .disabled(alchemyKey == "" || alchemyKey == "PasteNFTKeyHere")

                    NavigationLink("Avatar View (needs a lot of work)") {
                        SnowballSwiftExampleAvatarStackView()
                            .navigationTitle("Avatars")
                            .padding(.horizontal)
                    }

                    SnowballSwitch(isOn: $switchStateIsOn, title: "Switch Text Label", subtitle: "Provide additional context or helpful information.")

                    NavigationLink("Input View") {
                        SnowballSwiftExampleTextInputView()
                            .navigationTitle("Inputs")
                            .padding(.horizontal)
                    }

                    NavigationLink("Toast View") {
                        SnowballSwiftExampleToastView()
                            .navigationTitle("Toasts")
                            .padding(.horizontal)
                    }

                    NavigationLink("Search Bar") {
                        SnowballSwiftExampleSearchBarView()
                            .navigationTitle("Search Bar")
                    }
                }

                NavigationLink("SnowballAssetKit Library") {
                    SnowballAssetExampleIconLibraryView()
                        .navigationTitle("Icons")
                        .padding(.horizontal)
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
