//
//  File.swift
//  
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        load(url: url)
    }
    
    private func load(url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { self.image = $0 })
    }
    
    deinit {
        cancellable?.cancel()
    }
}

struct SnowballImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: () -> Placeholder
    private let image: (UIImage) -> Image

    init(url: URL, @ViewBuilder placeholder: @escaping () -> Placeholder, @ViewBuilder image: @escaping (UIImage) -> Image) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
        self.placeholder = placeholder
        self.image = image
    }

    var body: some View {
        Group {
            if let uiImage = loader.image {
                image(uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } else {
                placeholder()
            }
        }
    }
}
