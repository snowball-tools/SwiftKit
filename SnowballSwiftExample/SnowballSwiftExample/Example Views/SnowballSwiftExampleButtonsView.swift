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
            Text("SnowballButton is just a convenient button with icons on either side. Use ButtonStyle (.danger, .plain, etc) to style")

            Text("Tapped Button: \(tappedButtonString)")
            
            Spacer()
            
            VStack {
                SnowballButton(leftSystemIcon: "clipboard") {
                    self.tappedButtonString = "clipboard icon only"
                }
                
                SnowballButton("clipboard", leftSystemIcon: "clipboard") {
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
                
                SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                    self.tappedButtonString = "clipboard with *left and right* icon and text"
                }
                .buttonStyle(.snowballFilled)
            }
        }
    }
}

struct SnowballSwiftExampleButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleButtonsView()
    }
}
