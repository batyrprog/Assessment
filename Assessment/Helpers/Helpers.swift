//
//  Helpers.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import Foundation

func formatDate(date: String) -> String {
    let isoFormatter = ISO8601DateFormatter()
    guard let date = isoFormatter.date(from: date) else { return "Invalid Date" }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm, MM.dd.yy"
    
    return formatter.string(from: date)
}

func attributedString(_ html: String) -> AttributedString? {
    guard let data = html.data(using: .utf8) else { return nil }
    
    do {
        let nsAttributedString = try NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil)
        
        return AttributedString(nsAttributedString)
    } catch {
        return nil
    }
}
