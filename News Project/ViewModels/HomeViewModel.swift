//
//  NewsViewModel.swift
//  News Project
//
//  Created by Omodolapo on 11/11/2025.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var articles: [Article] = []
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    
    init(){
        loadData()
    }
    
    func loadData(){
        self.isLoading = true
        Task{
            do{
                let res = try await NetworkManager.shared.fetchNews()
                print("Fetched news: \(res.articles.count)")
                articles = res.articles
                self.isLoading = false
            }
            catch{
                print("Error fetching news: \(error)")
                print("Error fetching news: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    var filteredArticles: [Article] {
           if searchText.isEmpty {
               return articles
           } else {
               return articles.filter { article in
                   article.title.localizedCaseInsensitiveContains(searchText)
               }
           }
       }
    
}


//4dd15ebc86fe4fc88c10cf995bfc18d3
