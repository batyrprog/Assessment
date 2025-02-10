//
//  Helpers.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import Foundation
import SwiftSoup

func formatDate(date: String) -> String {
    let isoFormatter = ISO8601DateFormatter()
    guard let date = isoFormatter.date(from: date) else { return "Invalid Date" }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm, MM.dd.yy"
    
    return formatter.string(from: date)
}

func extractText(_ html: String) -> String {
    do {
        let document = try SwiftSoup.parse(html)
        return try document.text()
    } catch {
        print("Error parsing HTML: \(error)")
        return ""
    }
}

func getDimensions(_ html: String) -> (width: String, height: String) {
    do {
        let document = try SwiftSoup.parse(html)
        let element = try document.select("img").first()
        let width = try String(element?.attr("width") ?? "")
        let height = try String(element?.attr("height") ?? "")
        
        return (width, height)
    } catch {
        return ("0","0")
    }
}


struct Developer {
    static let json = """
    {
        "title": "DSC_5017",
        "link": "https://www.flickr.com/photos/199176567@N06/54314930941/",
        "media": {
            "m": "https://live.staticflickr.com/65535/54314930941_7ce575373c_m.jpg"
        },
        "date_taken": "2025-01-17T12:35:49-08:00",
        "description": " <p><a href=\\"https://www.flickr.com/people/199176567@N06/\\">kdonaldson217</a> posted a photo:</p> <p><a href=\\"https://www.flickr.com/photos/199176567@N06/54314930941/\\" title=\\"DSC_5017\\"><img src=\\"https://live.staticflickr.com/65535/54314930941_7ce575373c_m.jpg\\" width=\\"240\\" height=\\"185\\" alt=\\"DSC_5017\\" /></a></p> ",
        "published": "2025-02-08T21:01:08Z",
        "author": "nobody@flickr.com (\\\"kdonaldson217\\\")",
        "author_id": "199176567@N06",
        "tags": "rose city pats 18u aa na3hl"
    }
    """.data(using: .utf8)!
    
    static func getItem() -> Item? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Item.self, from: json)
        } catch {
            print("cannot parse json")
            return nil
        }
    }
}
