//
//  news_model.swift
//  news_app
//
//  Created by Omodolapo on 11/11/2025.
//
import Foundation

struct NewsModel: Identifiable, Codable{
    var id: UUID = UUID()				
    let title: String
    let niche: String
    let description: String
    let author: String
    let url: String
    let content: String
    let datePosted: String
    
    
}
