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
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingShareSheet = false
    
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
        .navigationBarTitle("Detail", displayMode: .inline)
                    .navigationBarBackButtonHidden(true)
                    .addLeadingBackButton {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .addTrailingShareButton {
                        self.isShowingShareSheet = true
                    }

                    .sheet(isPresented: $isShowingShareSheet) {
                        let shareText = "\(selectedNewsItem.title)\n\nCheck this out: \(selectedNewsItem.link)"
                        ShareSheet(items: [shareText])
                    }
    }
}
#Preview {
    //NewsTabView(newsItems: DewaSecrets().sampleNews, selectedNewsItem: DewaSecrets().sampleNews.first!)
    NewsListView(newsItems: DewaSecrets().sampleNews)
}
