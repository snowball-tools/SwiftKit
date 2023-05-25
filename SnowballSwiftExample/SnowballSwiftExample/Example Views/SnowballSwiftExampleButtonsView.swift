//
//  SnowballSwiftExampleButtonsView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI
import SnowballSwiftKit
import SnowballAssetKit

struct SnowballSwiftExampleButtonsView: View {
    @State var tappedButtonString: String = ""

    var body: some View {
        VStack(spacing: 15) {
            Text("SnowballButton is just a convenient view! You can use buttons ButtonStyle (.danger, .plain, etc) on it to style")

            Text("Tapped Button: \(tappedButtonString)")

            SnowballButton(leftSystemIcon: "clipboard") {
                self.tappedButtonString = "clipboard icon only"
            }

            SnowballButton(leftSystemIcon: "clipboard", "clipboard") {
                self.tappedButtonString = "clipboard with *left* icon and text"
            }
            .buttonStyle(.snowballDanger)

            SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                self.tappedButtonString = "clipboard with *right* icon and text"
            }

            SnowballButton("clipboard") {
                self.tappedButtonString = "clipboard text only"
            }
            .buttonStyle(.snowballTinted)

            SnowballButton(leftSystemIcon: "clipboard", "clipboard", rightSystemIcon: "clipboard") {
                self.tappedButtonString = "clipboard with *left and right* icon and text"
            }
            .buttonStyle(.snowballFilled)

        }
    }
}

struct SnowballSwiftExampleButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleButtonsView()
    }
}
