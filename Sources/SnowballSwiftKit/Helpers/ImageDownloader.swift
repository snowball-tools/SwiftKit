//
//  ImageDownloader.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/29/23.
//

import UIKit

class ImageDownloader {
    func downloadImages(for urls: [URL], completion: @escaping (Result<[UIImage], Error>) -> Void) {
        let dispatchGroup = DispatchGroup()
        var errors = [Error]()
        var imageCache = [UIImage]()

        for url in urls {
            dispatchGroup.enter()
            URLSession.shared.dataTask(with: url) { data, _, error in
                defer { dispatchGroup.leave() }
                if let error = error {
                    errors.append(error)
                } else if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.append(image)
                    }
                }
            }.resume()
        }

        dispatchGroup.notify(queue: .main) {
            if errors.isEmpty {
                completion(.success(imageCache))
            } else {
                // Here, we return the first error, but you could return all errors if you wanted to.
                completion(.failure(errors.first!))
            }
        }
    }
}
