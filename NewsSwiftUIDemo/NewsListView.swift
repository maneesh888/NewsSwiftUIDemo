//
//  NewsListView.swift
//  NewsSwiftUIDemo
//
//  Created by Maneesh on 15/05/2024.
//

import SwiftUI
import DEWASecrets

struct NewsListView: View {
    let newsItems: [News]
    var dismiss: (() -> Void)?

    var body: some View {
        NavigationView {
            
           
                VStack {
                    ScrollViewReader { scrollView in
                        List(newsItems, id: \.id) { newsItem in
                            NavigationLink(destination: NewsTabView(newsItems:newsItems, selectedNewsItem: newsItem)) {
                                Text(newsItem.title)
                            }
                        }
                        
                        .listStyle(.plain)
                        .navigationBarTitle("Dewa News")
                        .addLeadingCloseButton {
                            
                        }
                    }
                    
                    
                    
                }
            
           
        }
        .navigationViewStyle(StackNavigationViewStyle())
      
    }
}

#Preview {
    NewsListView(newsItems: DewaSecrets().sampleNews)
}
