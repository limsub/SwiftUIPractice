//
//  MenuView.swift
//  SwiftUIReview&Practice
//
//  Created by 임승섭 on 12/18/23.
//

import SwiftUI

// 1. List 사용
// 2. Custom View 만들기 (1). struct  (2).computed property
// 3. Custom Modifier 만들기 (1). struct  (2). extension으로 묶어서 사용



struct MenuView: View {
    
    // 2. Custom View 만들기 - (2). computed property
    var cardProperty: some View {
        VStack(alignment: .center, spacing: 50) {
            Image(systemName: "pencil")
            Text("연필!!")
        }
        .padding(8)
        .background(.yellow)
    }
    
    
    var body: some View {
        
        VStack {
            Spacer()
            
            // 2. Custom View
            HStack {
                CardView(image: "star", text: "별 모양")
                cardProperty
            }
            
            
            // 1. List 사용
            List {
                Section("1번 섹션 - 이것저것 넣어보기") {
                    Text("1번 텍스트")
                    DatePicker(selection: .constant(Date())) {
                        Text("DatePicker 넣어보기")
                    }
                    ColorPicker("ColorPicker 넣어보기", selection: .constant(.yellow))
                    Text("취소선 만들기")
                        .strikethrough()
                }
                Section("2번 섹션 - Modifier 만들어보기") {
                    Text("struct로 만든 modifier")
                        .modifier(PointBorderText())
                    Text("extension으로 묶어서 사용")
                        .asPointBorderText()
                }
            }
            .listStyle(.insetGrouped)
        }
        
    }
}

// 2. Custom View 만들기 - (1). struct
struct CardView: View {
    
    let image: String
    let text: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Image(systemName: image)
            Text(text)
        }
        .padding(8)
        .background(.yellow)
    }
}


// 3. Custom Modifier 만들기
// (1). struct
struct PointBorderText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(10)
            .foregroundStyle(.black)
            .background(.yellow)
    }
}

// (2). extension View func
extension View {
    func asPointBorderText() -> some View {
        modifier(PointBorderText())
    }
}

#Preview {
    MenuView()
}
