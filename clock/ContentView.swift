//
//  ContentView.swift
//  clock
//
//  Created by 김동현 on 3/13/25.
//

import SwiftUI
import SwiftData

import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()
    @Environment(\.colorScheme) var colorScheme
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // 컬러 스킴에 따라 배경색 변경
            (colorScheme == .dark ? Color.black : Color.white)
                .edgesIgnoringSafeArea(.all)
            
            // 시계 표시
            VStack {
                Text(timeString())
                    .font(.system(size: 190, weight: .thin))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                
                Text(dateString())
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
            }
        }
        .onReceive(timer) { _ in
            self.currentTime = Date()
        }
    }
    
    // 시간 포맷팅 (시:분:초)
    private func timeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: currentTime)
    }
    
    // 날짜 포맷팅
    private func dateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: currentTime)
    }
}

#Preview {
    ContentView()
}
