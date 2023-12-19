//
//  TransitionWithNavigationLazyView.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/19/23.
//

import SwiftUI

struct TransitionWithNavigationLazyView: View {
    
    @State var randomNumber = Int.random(in: 1...100)
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("sample test1") {
                    SampleTestView()
                }
                .padding(20)
                
                 
                NavigationLink("sample test2") {
                    SampleTest2View()
                }
                .padding(20)
                
                
                NavigationLink("sample test3") {
                    NavigationLazyView(build: SampleTest3View())
                }
                .padding(20)
                
                // 버튼
                Button("Select - \(randomNumber)") {
                    randomNumber = Int.random(in: 1...100)
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    TransitionWithNavigationLazyView()
}
