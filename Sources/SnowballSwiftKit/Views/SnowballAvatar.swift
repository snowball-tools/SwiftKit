//
//  SnowballAvatar.swift
//  
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI

public struct SnowballAvatar: View {
    let image: Image

    public init(image: Image) {
        self.image = image
    }

    public var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
    }
}

struct SnowballAvatar_Previews: PreviewProvider {
    static var previews: some View {
        SnowballAvatar(image: Image(systemName: "figure.fall.circle.fill"))
    }
}
