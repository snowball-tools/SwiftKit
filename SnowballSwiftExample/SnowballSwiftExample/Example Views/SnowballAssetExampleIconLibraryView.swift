//
//  SnowballAssetExampleIconLibraryView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/24/23.
//

import SwiftUI
import SnowballAssetKit

struct SnowballAssetExampleIconLibraryView: View {
    private var gridLayout: [GridItem] = [
        GridItem(.adaptive(minimum: 30), alignment: .center)
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(SnowballIcon.allCases) { type in
                    SnowballImage(type)
                }
            }
            Divider()
            VStack(alignment: .leading) {
                ForEach(SnowballIcon.allCases) { type in
                    HStack {
                        SnowballImage(type)
                        Divider().frame(height: 20)
                        Text("SnowballImage(.\(type.rawValue))")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SnowballAssetExampleIconLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballAssetExampleIconLibraryView()
    }
}
