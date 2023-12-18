//
//  VerticalScrollHomeView.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/18/23.
//

import SwiftUI

struct VerticalScrollHomeView: View {
    var body: some View {
        
        ScrollView {
            VStack(spacing: 40) {
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                    }
                }
            }
        }
    }
}

#Preview {
    VerticalScrollHomeView()
}
