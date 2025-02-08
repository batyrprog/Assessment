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
