//
//  ImageLoader.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    private var cancellables = Set<AnyCancellable>()
    private let imageManager = ImageManager()

    func loadImage(from url: URL) {
        imageManager.fetchImage(for: url) { [weak self] result in
            switch result {
            case .success(let fetchedImage):
                self?.image = fetchedImage
            case .failure(let error):
                print("Error fetching image: \(error)")
                self?.image = nil
            }
        }
    }
}
