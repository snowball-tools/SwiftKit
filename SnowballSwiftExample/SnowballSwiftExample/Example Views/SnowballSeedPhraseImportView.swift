//
//  SnowballSeedPhraseImportView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 6/7/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSeedPhraseImportView: View {
    @State var seedPhrase = [String](repeating: "", count: 12)

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SnowballTitleLabel(title: "Type your secret phrase")
                    .padding(.leading, 2)
                ForEach(0...5, id: \.self) { row in
                    HStack {
                        SnowballTextInput($seedPhrase[row], placeholder: "\(row + 1)")
                        SnowballTextInput($seedPhrase[row + 6], placeholder: "\(row + 7)")
                    }
                }
                Spacer()
                Button {
                    // import action
                } label: {
                    Text("Import")
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .buttonStyle(.snowballFilled(buttonSize: .large))
                .disabled(seedPhrase.contains(""))
            }
            .padding(.horizontal)
            .navigationTitle("Import Wallet")
        }
    }
}

struct SnowballLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSeedPhraseImportView()
    }
}
