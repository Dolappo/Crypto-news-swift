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
        VStack(){
            AsyncImage(url: article.urlToImage) { phase in
                            if let image = phase.image {
                                
                                image
                                    .resizable()
                                    .scaledToFill()
                                    
                            
                            } else if phase.error != nil {
                                
                                Image(systemName: "photo.on.rectangle.angled.badge.xmark")
                                    .foregroundColor(.red)
                            } else {
                                
                                ProgressView()
                            }
                        }
            .frame(maxWidth: .infinity, maxHeight: 300)
            
            VStack(alignment:.leading, spacing: 5){
                Text(article.title)
                    .font(.system(size: 24) .bold())
                Text(article.content ?? "-")
                    
                    
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        
    }

    
}
