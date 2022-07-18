//
//  Network.swift
//  TakeHomeTest
//
//  Created by james Jones on 16/07/2022.
//
// swiftlint:disable: all

import Foundation
// Network structure, Matching the Json 
struct Response: Codable, Hashable {
    var items: [Items]
}

struct Results: Codable, Hashable {
    var items: [Item]
}

struct Item: Codable, Hashable {
    var snippet: Snippet
}

struct Items: Codable, Hashable {
    var id: Id
    var snippet: Snippet
}

struct Id: Codable, Hashable {
    var videoId: String
}

struct Snippet: Codable, Hashable {
    var title: String?
    var description: String?
    var thumbnails: Thumbnails?
    var publishTime: String?
    var topLevelComment: TopLevelComment?
}

struct Thumbnails: Codable, Hashable {
    var medium: Medium
}

struct Medium: Codable, Hashable {
    var url: String
}

struct TopLevelComment: Codable, Hashable {
    var snippet: Snip
}

struct Snip: Codable, Hashable {
    var textOriginal: String
    var authorDisplayName: String
}
