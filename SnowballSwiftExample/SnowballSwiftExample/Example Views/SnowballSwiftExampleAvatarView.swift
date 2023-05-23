//
//  SnowballSwiftExampleAvatarView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleAvatarView: View {
    var body: some View {
        SnowballAvatarStack([SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg"), SnowballAvatarModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/1/15/Cat_August_2010-4.jpg")])
    }
}

struct SnowballSwiftExampleAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleAvatarView()
    }
}
