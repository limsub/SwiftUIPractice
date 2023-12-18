//
//  GridView.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/18/23.
//

import SwiftUI

struct GridView: View {
    
    @Binding var movie: [Movie]
    
    @State var dummy = Array(1...100).map { "오늘의 영화 순위 \($0)" }
    
    // 1.
//    private let layout = [
//        GridItem(.fixed(120)),
//        GridItem(.fixed(120)),
//        GridItem(.fixed(120)),
//        GridItem(.fixed(120)),
//    ]
    
    // 2.
//    private let layout = [
//        GridItem(.flexible(minimum: 100, maximum: 250)),
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100))
//    ]
    
    // 3.
    private let layout = [
        GridItem(.flexible(), spacing: 20),  // 여백에 대한 보장 + 1/n
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(dummy, id: \.self) { value in
                    ZStack {
                        Color.random()
                        Text(value)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    GridView(movie: .constant([ // .constant : 실질적인 값을 한 번 감싸서 Binding의 형태로 넣어주는 걸 도와준다
        Movie(name: "인터스텔라"),
        Movie(name: "포레스트 검프"),
        Movie(name: "인셉션"),
        Movie(name: "오펜하이머"),
        Movie(name: "위대한 쇼맨")
    ]))
}
