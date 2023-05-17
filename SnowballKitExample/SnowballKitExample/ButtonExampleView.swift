//
//  ButtonExampleView.swift
//  SnowballKitExample
//
//  Created by Vivian Phung on 5/16/23.
//

import SwiftUI
import SnowballKit

struct ButtonExampleView: View {
    var body: some View {
        VStack {
            SnowballButton(leftIcon: "star.fill", text: "Button", rightIcon: "chevron.right", action: {
                print("Filled Button tapped!")
            }, isEnabled: true)
            
            SnowballButton(leftIcon: "star.fill", text: "Button", rightIcon: "chevron.right", action: {
                print("Tinted Button tapped!")
            }, isEnabled: true)
            
            SnowballButton(leftIcon: "star.fill", text: "Button", rightIcon: "chevron.right", action: {
                print("Plain Button tapped!")
            }, isEnabled: true)
            
            SnowballButton(leftIcon: "star.fill", text: "Button", rightIcon: "chevron.right", action: {
                print("Danger Button tapped!")
            }, isEnabled: true)
        }
        .padding()
    }
}

struct ButtonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExampleView()
    }
}
