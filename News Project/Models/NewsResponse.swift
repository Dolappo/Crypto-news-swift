//
//  NewsResponse.swift
//  News Project
//
//  Created by Omodolapo on 11/11/2025.
//

import Foundation

struct NewsResponse:  Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Identifiable, Codable {
    var id: Int {
            return url?.hashValue ?? UUID().hashValue
        }
    let source: Source?
    let author: String?
    let title: String
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
