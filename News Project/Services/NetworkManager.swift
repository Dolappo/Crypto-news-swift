//
//  NetworkManager.swift
//  News Project
//
//  Created by Omodolapo on 11/11/2025.
//
import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    
    func fetchNews() async throws -> NewsResponse{
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=4dd15ebc86fe4fc88c10cf995bfc18d3")
        else{
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode)
        else {
            throw NSError(domain: "Invalid Response", code: 0, userInfo: nil)
            
        }
        do {
                    let decoder = JSONDecoder()
            return try decoder.decode(NewsResponse.self, from: data)
                } catch {
                    throw error // Handle decoding errors
                }
        
    }
}
