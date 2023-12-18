//
//  PosterView.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/18/23.
//

import SwiftUI

struct PosterView: View {
    
    @State private var isPresented = false
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {    
                // LazyVStack : 50개의 이미지가 한 번에 로드되지 않고, 뷰에 보여지는 정도만 로드된다
                ForEach(0..<50) { item in
                    AsyncImageView()
                        .frame(width: 100, height: 100)
                    // frame을 잡아주지 않으면, 과호출이 발생한다.
                    // frame을 잡아줌으로서 뷰에 뜨는 progressView 개수를 제한하고, AsyncImageView에서의 호출 수를 자연스럽게 줄일 수 있게 된다.
                        .onTapGesture {
                            isPresented = true
                        }
                }
            }
        }
        .sheet(isPresented: $isPresented, content: {
            MenuView()
        })
        .contentMargins(50, for: .scrollIndicators)
    }
}

struct AsyncImageView: View {
    // 이미지를 로드할 때 고려해야 할 사항은 뭐가 있을까? "이미지가 오지 않는 경우"
    
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView()
                
            case .success(let image):
                image
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            case .failure(_):
                Image(systemName: "star")
                
            @unknown default:
                Image(systemName: "pencil")
            }
            
        }
    }
}

#Preview {
    PosterView()
}
