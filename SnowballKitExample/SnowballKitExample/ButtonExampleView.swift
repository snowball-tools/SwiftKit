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
            }, style: .filled(.blue))
            
            SnowballButton(leftIcon: "star.fill", text: "Button", rightIcon: "chevron.right", action: {
                print("Tinted Button tapped!")
            }, style: .tinted(.green))
            
            SnowballButton(leftIcon: "star.fill", text: "Button", rightIcon: "chevron.right", action: {
                print("Plain Button tapped!")
            }, style: .plain)
            
            SnowballButton(leftIcon: "star.fill", text: "Button", rightIcon: "chevron.right", action: {
                print("Danger Button tapped!")
            }, style: .danger)
        }
        .padding()
    }
}

struct ButtonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExampleView()
    }
}
