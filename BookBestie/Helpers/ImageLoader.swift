//
//  ImageLoader.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/9/22.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    @State var image = UIImage()
    
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .frame(width: 100, height: 200)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}
