//
//  ContentViewModal.swift
//  TakeHomeTest
//
//  Created by james Jones on 16/07/2022.
//

import SwiftUI

final class ContentViewModal: ObservableObject {
    @Published var items = [Items]()
    // Network call to populate the videos on the content view screen 
    func loadData() {
        let apiKey = "AIzaSyDydJ-5nPXR5Ywe4Oa71Rs0PnzYDJ1SXJ4"
        let channelID = "UC_A--fhX5gea0i4UtpD99Gg"
        // swiftlint:disable:next line_length
        guard let url = URL(string: "https://www.googleapis.com/youtube/v3/search?order=date&part=snippet&maxResults=25&channelId=\(channelID)&maxResults=25&key=\(apiKey)") else {
            print("incorrect url")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, _ in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("status code ")
                return }
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async { self.items.append(contentsOf: decodedResponse.items) }
                }
            }
        }.resume()
    }
}
