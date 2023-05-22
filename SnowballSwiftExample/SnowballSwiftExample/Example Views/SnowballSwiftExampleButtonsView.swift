//
//  SnowballSwiftExampleButtonsView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleButtonsView: View {
    @State var tappedButtonString: String = ""
    
    var body: some View {
        VStack(spacing: 15) {
            Text("SnowballButton is just a convenient view! You can use buttons ButtonStyle (.danger, .plain, etc) on it to style")
            
            Text("Tapped Button: \(tappedButtonString)")
            
            SnowballButton(leftSystemIcon: "clipboard") {
                self.tappedButtonString = "clipboard icon only"
            }
            
            SnowballButton(leftSystemIcon: "clipboard", text: "clipboard") {
                self.tappedButtonString = "clipboard with *left* icon and text"
            }
            
            SnowballButton(text: "clipboard", rightSystemIcon: "clipboard") {
                self.tappedButtonString = "clipboard with *right* icon and text"
            }
            
            SnowballButton(text: "clipboard") {
                self.tappedButtonString = "clipboard text only"
            }
            
            Spacer()
            VStack(alignment: .leading) {
                Text("ex. ButtonStyle")
                HStack {
                    Button("danger", action: {
                        self.tappedButtonString = "danger"
                    })
                    .buttonStyle(.danger)
                    
                    Button("plain", action: {
                        self.tappedButtonString = "plain"
                    })
                    .buttonStyle(.plain)
                    
                    Button("bordered", action: {
                        self.tappedButtonString = "bordered"
                    })
                    .buttonStyle(.bordered)
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("SwiftUI understands context")
                HStack {
                    Button("styled 'Button'", action: {
                        self.tappedButtonString = "styled button"
                    })
                    .buttonStyle(.danger)
                    
                    SnowballButton(text: "styled 'SnowballButton'") {
                        self.tappedButtonString = "styled snowball 'button'"
                    }
                    .buttonStyle(.danger)
                }
            }
        }
    }
}

struct SnowballSwiftExampleButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleButtonsView()
    }
}
