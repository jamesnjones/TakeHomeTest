//
//  DetailView.swift
//  TakeHomeTest
//
//  Created by james Jones on 17/07/2022.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModal: DetailViewModal
    let items: Items
    let comments: Items?
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors:
                                                    [.red, .gray]),
                               startPoint: .top,
                               endPoint: .bottom).ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text(items.snippet.title ?? "" )
                        .foregroundColor(.black)
                        .font(.headline)
                        .bold()
                        .padding()
                    VideoView(videoId: items.id.videoId )
                        .frame( height: 220)
                    Text(items.snippet.publishTime?.convertToDisplayFormat() ?? "" )
                        .font(.caption)
                        .padding()
                    Text(items.snippet.description ?? "" )
                        .font(.body)
                        .minimumScaleFactor(0.7)
                        .lineLimit(3)
                        .padding()
                    Spacer()
                    ScrollView {
                            VStack(alignment: .leading) {
                                ForEach(viewModal.comments, id: \.self) { comment in
                                    VStack(alignment: .leading, spacing: 5.0) {
                                        // swiftlint:disable:all line_length
                                    CommentsNameViewCell(name: comment.snippet.topLevelComment?.snippet.authorDisplayName ?? "No Name")
                                    CommentsViewCell(bodyText: (comment.snippet.topLevelComment?.snippet.textOriginal) ?? "No comment")
                                    }
                                }
                            }
                        }
                    .padding()
                }
            }
        .onAppear {
            // Here we do another network call in order to get the comments
            // use the video id that is passed across 
            viewModal.loadComments(videoId: items.id.videoId)
        }
    }
}
