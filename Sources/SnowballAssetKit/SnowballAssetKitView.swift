//
//  SnowballAssetKitView.swift
//  SnowballAssetKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

struct SnowballAssetKitView: View {
    var body: some View {
        VStack {
            Image("SOL", bundle: Bundle.module)
            Image(uiImage: SnowballUIImage("SOL"))
            SnowballImage("SOL")
        }
    }
}

struct SnowballAssetKitView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballAssetKitView()
    }
}
