//
//  TransitionView.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/18/23.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var isFull = false
    @State private var isSheet = false
    
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack(spacing: 20) {
                    Button {
                        isFull = true
                    } label: {
                        Text("isFull toggle")
                    }
                    
                    Button {
                        isSheet = true
                    } label: {
                        Text("isSheet toggle")
                    }
                }
                
                HStack(spacing: 20) {
                    NavigationLink("push") {
                        // 추후 NavigationLazyView로 한 번 감싸기
                        MenuView()
                    }
                }
            }
            .sheet(isPresented: $isSheet) {
                MenuView()
            }
            .fullScreenCover(isPresented: $isFull) {
                MenuView()
            }
        }
    }
}

#Preview {
    TransitionView()
}
