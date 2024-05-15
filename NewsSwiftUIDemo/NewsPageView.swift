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
        Text(newsItem.title).padding()
    }
}
#Preview {
    NewsPageView(newsItem: DewaSecrets().sampleNews.randomElement()!)
}
