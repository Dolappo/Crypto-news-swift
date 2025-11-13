//
//  NewsCard.swift
//  News Project
//
//  Created by Omodolapo on 11/11/2025.
//

import SwiftUICore
import SwiftUI



struct NewsCard: View {
    var item: Article

    var body: some View {
    
        HStack(alignment: .top, spacing: 12) {
                AsyncImage(url: item.urlToImage) { phase in
                                if let image = phase.image {
                                    // Success: Display the loaded image
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(alignment: .leading)
                                
                                } else if phase.error != nil {
                                    // Error: Display an error placeholder
                                    Image(systemName: "photo.on.rectangle.angled.badge.xmark")
                                        .foregroundColor(.red)
                                } else {
                                    // Placeholder: Display a loading indicator while fetching
                                    ProgressView()
                                }
                            }
                .frame(width: 100, height: 100, alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                
            VStack(alignment: .leading, spacing: 5){
                    Text(item.title )
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .padding(.bottom, 10)
                        .lineLimit(2)
                        .frame(alignment: .leading)
                   
                HStack(alignment: .top){
                        Text(item.author ?? "-")
                            .font(.system(size: 12))
                    }
                    
                }
                
            
            }
        .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.white.opacity(0.7))
            .cornerRadius(8)
            .frame(minHeight: 120)
            .padding(.horizontal)
            
        }
    
        
}
