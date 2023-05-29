//
//  SnowballAvatar.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI

public struct SnowballAvatar: View {
    let image: Image?
    let number: Int?

    public init(_ image: Image? = nil, number: Int? = nil) {
        self.image = image
        self.number = number
    }

    public var body: some View {
        Color(image != nil ? .clear : UIColor.secondarySystemFill)
            .aspectRatio(1, contentMode: .fit)
            .background(SnowballAvatarBackgroundView(image, number: number))
            .overlay(Circle()
                .stroke(Color.white, lineWidth: 8))
            .clipShape(Circle())
            .background(Circle().fill(Color.white))
    }
}

public struct SnowballAvatarBackgroundView: View {
    let image: Image?
    let number: Int?

    public init(_ image: Image? = nil, number: Int? = nil) {
        self.image = image
        self.number = number
    }

    public var body: some View {
        if let image = image {
            image
                .resizable()
                .scaledToFill()
        } else if let number = number {
            Text("+\(number)")
                .font(.title)
                .foregroundColor(Color(UIColor.secondaryLabel))
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.01)
        } else {
            Circle()
                .fill(Color.white)
        }
    }
}

struct SnowballAvatar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SnowballAvatar(Image(systemName: "person.circle"))
            SnowballAvatar(number: 67)
                .frame(height: 200)

        }
    }
}
