//
//  ContentView.swift
//  TakeHomeTest
//
//  Created by james Jones on 15/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModal: ContentViewModal
    @State private var user = [Items]()
    @State private var show = false
    var body: some View {
        // this will allow the list to have same background
        UITableView.appearance().backgroundColor = .clear
        return NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors:
                                                    [.red, .gray]),
                                                    startPoint: .top,
                                                    endPoint: .bottom)
                                                    .ignoresSafeArea()
                VStack {
                    List {
                        ForEach(viewModal.items, id: \.self) { user in
                            NavigationLink(destination: DetailView(viewModal: DetailViewModal(),
                                                                   items: user, comments: nil)) {
                                HStack {
                                    // Using this to load the Json Image
                                    VideoRemoteImage(urlString: user.snippet.thumbnails?.medium.url ?? "" )
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 120, height: 100)
                                        .cornerRadius(8.0)
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 10.0) {
                                        Text(user.snippet.title ?? "" )
                                            .font(.system(size: 12, weight: .medium, design: .monospaced))
                                            .fontWeight(.bold)
                                        Text((user.snippet.publishTime?.prefix(10))!)
                                            .font(.caption)
                                    }
                                    .padding()
                                }
                            }
                        }
                    }.listStyle(.insetGrouped)
                }
                // There seems to an issue with Swiftui calling onAppear repeatedly so this is a workaround that issue
                // when on appear is called the inital data will load
                .onAppear(perform: show ? nil : viewModal.loadData)
                .onAppear {
                    show = true
                }
                .navigationTitle("GMBM")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModal: ContentViewModal())
    }
}
