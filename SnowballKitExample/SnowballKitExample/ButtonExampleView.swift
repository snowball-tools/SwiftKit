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
        HStack {
            VStack {
                Text("reg")
                Button("Hello") {}
                    .buttonStyle(.borderedProminent)
                Button("Hello") {}
                    .buttonStyle(.bordered)
                Button("Hello") {}
                    .buttonStyle(.plain)
                Button("Hello", role: .destructive) {}
                    .buttonStyle(.borderedProminent)
                Button("Hello", role: .destructive) {}
                    .buttonStyle(.bordered)
            }
            VStack {
                Text("disabled")
                Button("Hello") {}
                    .buttonStyle(.borderedProminent)
                    .disabled(true)
                Button("Hello") {}
                    .buttonStyle(.bordered)
                    .disabled(true)
                Button("Hello") {}
                    .buttonStyle(.plain)
                    .disabled(true)
                Button("Hello", role: .destructive) {}
                    .disabled(true)
                    .buttonStyle(.borderedProminent)
                Button("Hello", role: .destructive) {}
                    .buttonStyle(.bordered)
                    .disabled(true)
            }
        }
    }
}

struct ButtonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExampleView()
    }
}
