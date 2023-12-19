//
//  NavigationLazyView.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/19/23.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    
    let build: () -> T
    
    init(build: @autoclosure @escaping () -> T) {
        self.build = build
        print("NavigationLazyView init!")
    }
    
    var body: some View {
        build()
    }
}

//#Preview {
//    NavigationLazyView()
//}
