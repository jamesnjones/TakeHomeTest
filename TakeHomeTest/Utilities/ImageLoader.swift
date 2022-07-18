//
//  ImageLoader.swift
//  TakeHomeTest
//
//  Created by james Jones on 16/07/2022.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image?
    // to display image from JSON Data
    func load(fromURLString urlString: String) {
        NetworkManager.network.downloadImage(fromURLString: urlString) { (uiImage) in
            // turn image into a uiImage so we can display it
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image(systemName: "person")
    }
}

struct VideoRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}
