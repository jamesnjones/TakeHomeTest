//
//  DetailViewModal.swift
//  TakeHomeTest
//
//  Created by james Jones on 17/07/2022.
//

import Foundation

final class DetailViewModal: ObservableObject {
    @Published var comments = [Item]()
    // Network call to obtain the comments 
    func loadComments(videoId: String) {
        let apiKey = "AIzaSyDydJ-5nPXR5Ywe4Oa71Rs0PnzYDJ1SXJ4"
        // swiftlint:disable:next line_length
        let endpoint = "https://www.googleapis.com/youtube/v3/commentThreads?part=snippet&maxResults=500&order=relevance&videoId=\(videoId)&key=\(apiKey)"
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, _ in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Results.self, from: data) {
//                    print(decodedResponse.items[0].snippet.topLevelComment?.snippet.authorDisplayName)
                    DispatchQueue.main.async {
                        self.comments.append(contentsOf: decodedResponse.items)
                    }
                }
            }
        }.resume()
    }

}
