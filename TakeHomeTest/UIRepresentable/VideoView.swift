//
//  VideoView.swift
//  TakeHomeTest
//
//  Created by james Jones on 17/07/2022.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    let videoId: String
    // This will create a video player that is capable of playing youtube videos 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else {
                   return
               }
               uiView.scrollView.isScrollEnabled = true
               uiView.load(URLRequest(url: youtubeURL))
    }
}
