//
//  ContentView.swift
//  NewsSwiftUIDemo
//
//  Created by Maneesh on 15/05/2024.
//

import SwiftUI
import DEWASecrets

struct ContentView: View {
    var body: some View {
        VStack {
            NewsListView(newsItems: DewaSecrets().sampleNews)
        }
    }
}

#Preview {
    ContentView()
}
