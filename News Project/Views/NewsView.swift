//
//  NewsView.swift
//  News Project
//
//  Created by Omodolapo on 13/11/2025.
//

import SwiftUI

struct NewsView: View{
    let article: Article
    
    var body: some View{
        VStack(alignment: .leading){
            Text(article.content ?? "-")
                .frame(maxHeight: .infinity)
                
        }
            .navigationTitle(article.title)
            .padding(16)
            .frame(alignment: .leading)
    }

    
}
