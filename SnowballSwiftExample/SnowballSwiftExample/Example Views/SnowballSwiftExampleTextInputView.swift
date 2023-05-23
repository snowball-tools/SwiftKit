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
            Text("SnowballTextInput")
            SnowballTextInput(text: $textInput)

            SnowballTextInput(text: $nonEmptyTextInput)

            SnowballTextInput(text: $textInput, rightSystemIcon: "clipboard")

            SnowballTextInput(leftSystemIcon: "clipboard", text: $textInput)

            SnowballTextInput(text: $textInput, emptyStateText: "Empty state text changed")

            Text("Apple's TextField")
            TextField("DefaultTextFieldStyle", text: $textInput)
                .textFieldStyle(DefaultTextFieldStyle())

            TextField("PlainTextFieldStyle", text: $textInput)
                .textFieldStyle(PlainTextFieldStyle())

            TextField("RoundedBorderTextFieldStyle", text: $textInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct SnowballSwiftExampleTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleTextInputView()
            .padding()
    }
}
