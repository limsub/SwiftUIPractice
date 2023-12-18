//
//  TamagochiView.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/18/23.
//

import SwiftUI

struct TamagochiView: View {
    
    @State private var nickname = "고래밥" // Source of Truth
    // @State : 뷰에 대한 상태를 관리하기 위해 존재. "상태 프로퍼티"
    
    @State private var mul = 0
    @State private var bob = 0
    
    @State private var textFieldText = ""
    @State private var isOn = false
    
    
    var body: some View {
        VStack {
            HStack {
                CntView(title: "물", cnt: $mul)
                CntView(title: "밥", cnt: $bob)
            }
            
            // 결과적으로 같은 데이터를 공유하는 꼴이 된다(?)
            // @State를 통해 하나의 Signle Source of Truth가 생성된다
            Button {
                bob += 1
            } label: {
                Text("밥 늘려")
                    .padding(50)
                    .background(.yellow)
            }

            
            
            // Toggle이나 TextField 역시 하위 뷰이기 때문에 원하는 데이터를 $를 통해 주입한다.
            Toggle("스위치", isOn: $isOn)
                .padding(50)
                .background(.gray)
            
            TextField("이름을 입력하세요", text: $textFieldText)
                .padding(50)
                .background(.gray)
        }
    }
}

struct CntView: View {
    
    let title: String
    @Binding var cnt: Int
    // @Binding : 파생된 값. Derived Value
    
    var body: some View {
        
        Text("\(title) : \(cnt)")
            .background(.black)
            .foregroundStyle(.white)
            .font(.title)
        
        Button("카운트 올려") {
            cnt += 1
        }
        .background(.yellow)
    }
}

#Preview {
    TamagochiView()
}
