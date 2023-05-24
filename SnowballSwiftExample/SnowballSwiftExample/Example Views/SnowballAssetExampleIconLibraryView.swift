//
//  SnowballAssetExampleIconLibraryView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/24/23.
//

import SwiftUI
import SnowballAssetKit

struct SnowballAssetExampleIconLibraryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                SnowballImage(.sol)
                Divider().frame(height: 20)
                Text("SnowballImage(.sol)")
            }
            HStack {
                SnowballImage("SOL")
                Divider().frame(height: 20)
                Text("SnowballImage(\"SOL\")")
            }
        }
    }
}

struct SnowballAssetExampleIconLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballAssetExampleIconLibraryView()
    }
}
