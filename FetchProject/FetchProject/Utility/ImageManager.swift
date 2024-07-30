//
//  ImageManager.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation

import UIKit


enum ImageError: Error {
    case invalidURL
    case invalidData
}

public class ImageManager {
    
    private let cache = NSCache<NSString, UIImage>()
    
    /// Fetches an image from a remote source.
    ///
    /// - Parameters:
    ///   - url: The URL of the image.
    ///   - completionHandler: The result of the fetch.
    ///
    public func fetchImage(for url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        let cacheKey = url.absoluteString as NSString
        
        if let cacheImage = cache.object(forKey: cacheKey) {
            completionHandler(.success(cacheImage))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                completionHandler(.failure(ImageError.invalidURL))
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                completionHandler(.failure(ImageError.invalidData))
                return
            }
            self?.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                completionHandler(.success(image))
            }
        }
        
        task.resume()
    }
}
