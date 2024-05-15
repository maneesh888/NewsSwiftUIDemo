//
//  NewsTabView.swift
//  NewsSwiftUIDemo
//
//  Created by Maneesh on 15/05/2024.
//

import SwiftUI
import DEWASecrets

struct NewsTabView: View {
    let newsItems: [News]
    let selectedNewsItem: News
    @State var currentIndex: Int = 0

    var body: some View {
        TabView(selection:$currentIndex) {
            ForEach(newsItems.indices, id: \.self) { index in
                NewsPageView(newsItem: newsItems[index])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .navigationBarTitle("News Details", displayMode: .inline)
        .onAppear {
            
            if let selectedIndex = newsItems.firstIndex(where: { $0.id == selectedNewsItem.id }) {
                currentIndex = selectedIndex
                print(currentIndex)
            }
        }
        .onChange(of: currentIndex) { newIndex in
           // guard let newIndex = newIndex else { return }
            currentIndex = newIndex
        }
        
    }
}
#Preview {
    NewsTabView(newsItems: DewaSecrets().sampleNews, selectedNewsItem: DewaSecrets().sampleNews.first!)
}