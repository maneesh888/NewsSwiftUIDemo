//
//  NewsRowView.swift
//  NewsSwiftUIDemo
//
//  Created by Maneesh on 15/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI
import DEWASecrets

struct NewsRowView: View {
    
    
    let newsItem: News
    
    var body: some View {
        GeometryReader { geometry in
            let imageWidth:CGFloat = 80
            
            let padding:CGFloat = 10.0
            let imageView = WebImage(url: URL(string: newsItem.largeimage))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(Color.primaryBg)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .aspectRatio( contentMode: .fill)
                .frame(width: imageWidth)
                .padding(.all, padding)
                .padding(.leading, -padding)
            HStack () {
                
                
                imageView
                
                
                VStack (alignment: .leading, spacing: 5) {
                    Text(newsItem.title )
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .layoutPriority(1)
                        .lineLimit(3)
                        .truncationMode(.tail)
                    
                    
                    
                    
                    Text(newsItem.pubdate )
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .layoutPriority(1)
                    
                    
                    
                }
                Spacer()
                
            }
        }
    }
    
}


#Preview {
    VStack {
        NewsRowView(newsItem: DewaSecrets().sampleNews.randomElement()!)
            .padding()
            .frame(height: 100)
    }
    
}
