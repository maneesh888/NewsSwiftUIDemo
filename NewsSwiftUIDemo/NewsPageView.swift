//
//  NewsPageView.swift
//  NewsSwiftUIDemo
//
//  Created by Maneesh on 15/05/2024.
//

import SwiftUI
import DEWASecrets

struct NewsPageView: View {
    let newsItem: News

    var body: some View {
        VStack {
            WebView(urlString: newsItem.link)
        }
        .navigationBarTitle(newsItem.title, displayMode: .inline)
    }
}

#Preview {
    NewsPageView(newsItem: DewaSecrets().sampleNews.randomElement()!)
}
