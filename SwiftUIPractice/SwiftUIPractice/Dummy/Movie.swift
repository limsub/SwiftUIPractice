//
//  Movie.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/18/23.
//

import SwiftUI

struct Movie: Hashable, Identifiable {
    // Hashable이 필요한 이유 : ForEach에 쓰려고
    // Identifiable이 필요한 이유 : id라는 고정된 값을 쓰려고
    
    var id = UUID()
    let name: String
    let color = Color.random()
    let count = Int.random(in: 1...100)
}

extension Color {
    static func random() -> Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
