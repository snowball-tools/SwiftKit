//
//  SnowballAvatarViewModel.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/29/23.
//

import UIKit
import SwiftUI

public class SnowballAvatarRemoteViewModel: ObservableObject {
    @Published var avatars = [SnowballAvatarRemoteModel]()
    @Published var images = [UIImage]()

    public func fetchAvatars(avatars: [SnowballAvatarRemoteModel]) {
        self.avatars = avatars
        let imageDownloader = ImageDownloader()
        let urls = avatars.map { $0.imageURL }

        imageDownloader.downloadImages(for: urls) { result in
            switch result {
            case .success(let success):
                self.images = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
