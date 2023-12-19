//
//  TestInitView.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/19/23.
//

import SwiftUI

struct TestInitView: View {
    
    @State var randomNumber = 0
    
    init(randomNumber: Int = 0) {
        self.randomNumber = randomNumber
        print("TestInitView Init!")
    }
    
    // 2. property
    var secondView: some View {
        Text("Second View - \(randomNumber)")
            .padding(20)
            .background(Color.random())
        
    }
    
    // 3. func
    func thirdView () -> some View {
        Text("Third View - \(randomNumber)")
            .padding(20)
            .background(Color.random())
    }
    
    
    
    var body: some View {
        VStack {
            // 1. struct
            FirstView(number: Int.random(in: 1...10))
            
            // 2. property
            secondView
            
            // 3. func
            thirdView()
            
            // 4. 직접
            Text("Fourth View - \(randomNumber)")
                .padding(20)
                .background(Color.random())
            
            // 버튼
            Button("Select") {
                randomNumber = Int.random(in: 1...100)
            }
        }
    }
}

// 1. struct
struct FirstView: View {
//    let number: Int
    
    init(number: Int) {
        print("First View Init!\(number)")
//        self.number = number
    }
    
    var body: some View {
        Text("First View")
            .padding(20)
            .background(Color.random())
    }
}

// 내부 데이터가 바뀔 때만 body 재호출 - SwiftUI의 View의 특성이라고 생각하자
// init은 재호출 되지만, body는 재호출되지 않는다. 데이터의 변화가 없으면, 새로 인스턴스를 찍어내도 둘의 차이가 없기 때문에 새로 draw, 즉 렌더링할 필요가 없다.
// 즉, 두 struct 인스턴스의 차이가 없으면 draw를 하지 않는다.
// 네트워크 콜을 init 안에 써두면, 굳이 필요도 없는 네트워크 통신을 계속 하게 됨.
// 뷰가 새로 그려지지 않는다는 건, 네트워크 통신을 새로 할 필요가 없는 앤데, 그걸 네트워크 콜 계속 쏘고 있으면 리소스에 상당한 낭비

#Preview {
    TestInitView()
}
