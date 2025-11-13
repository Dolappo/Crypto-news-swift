//
//  HomeView.swift
//  News Project
//
//  Created by Omodolapo on 11/11/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .foregroundColor(Color.indigo)
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.2))
                    .rotationEffect(Angle(degrees: 45))
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Good morning,")
                        .padding(.horizontal)
                    Text("Dolapo").font(.system(size: 40))
                        .padding(.horizontal)
                    
                    TextField("Search news", text: $viewModel.searchText).padding(.vertical)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .scaleEffect(2)
                        Spacer()
                    }
                    else if let error = viewModel.errorMessage{
                        Text("Error: \(error)")
                    }
                    else{
                        if viewModel.filteredArticles.isEmpty{
                            Text("No match found")
                                .padding(2)
                                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
                            
                            Spacer()
                        }
                        else{
                            ScrollView(showsIndicators: false ){
                                LazyVStack{
                                    ForEach(viewModel.filteredArticles){item in
                                        NavigationLink(destination: NewsView(article: item)){
                                            NewsCard(item: item)
                                        }
                                        .foregroundStyle(.primary)
                                    }
                                    
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .onAppear{
                    viewModel.loadData()
                }
            }
        }
    }
}
