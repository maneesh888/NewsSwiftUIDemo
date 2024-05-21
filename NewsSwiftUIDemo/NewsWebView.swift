//
//  NewsWebView.swift
//  NewsSwiftUIDemo
//
//  Created by Maneesh on 15/05/2024.
//

import SwiftUI
import WebKit
import DEWASecrets

struct WebView: UIViewRepresentable {
    let urlString: String
    

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

    }
}

#Preview {
    WebView(urlString: DewaSecrets().sampleNews.randomElement()!.link)
}
