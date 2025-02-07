//
//  Model.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI

struct ResponseModel: Codable {
    let title: String?
    let link: String?
    let description: String?
    let modified: String?
    let generator: String?
    let items: [Item]?
}

struct Item: Codable {
    let title: String?
    let link: String?
    let media: Media?
    let dateTaken: String?
    let description: String?
    let published: String?
    let author, authorID, tags: String?

    enum CodingKeys: String, CodingKey {
        case title, link, media
        case dateTaken = "date_taken"
        case description, published, author
        case authorID = "author_id"
        case tags
    }
}

struct Media: Codable {
    let m: String?
}
