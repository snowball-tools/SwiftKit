//
//  SnowballSwiftExampleTextInputView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleTextInputView: View {
    @State var textInput: String = ""
    @State var nonEmptyTextInput: String = "Hello World"

    var body: some View {
        VStack(alignment: .leading) {
            TextInput($textInput, title: "Label", subtitle: "Provide additional context or helpful information.")

            TextInput($textInput, title: "Label")

            TextInput($textInput)

            TextInput($nonEmptyTextInput)

            TextInput($textInput, rightSystemIcon: "clipboard")

            TextInput($textInput, leftSystemIcon: "clipboard")

            TextInput($textInput, placeholder: "placeholder")
        }
    }
}

struct SnowballSwiftExampleTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleTextInputView()
            .padding()
    }
}
