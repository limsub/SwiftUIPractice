//
//  MenuView.swift
//  SwiftUIReview&Practice
//
//  Created by 임승섭 on 12/18/23.
//

import SwiftUI

// 1. List 사용
// 2. Custom View 만들기 (1). struct  (2).computed property
// 3. Custom Modifier 만들기 (1). struct  (2). func



struct MenuView: View {
    var body: some View {
        // 1. List 사용
        List {
            Section("1번 섹션 - 이것저것 넣어보기") {
                Text("1번 텍스트")
                DatePicker(selection: .constant(Date())) {
                    Text("DatePicker 넣어보기")
                    
                    
                }
                ColorPicker("ColorPicker 넣어보기", selection: .constant(.yellow))
            }
            Section("2번 섹션") {
                Text("hi")
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    MenuView()
}
