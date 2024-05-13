//
//  ContentView.swift
//  NoticeableSquareApp
//
//  Created by Nikolay Pochekuev on 13.05.2024.
//

import SwiftUI

struct ContentView: View {
    private let colors: [Color] = [.white, .pink, .yellow, .black]
    @State private var startPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    
    var body: some View {
        ZStack {
            VStack(spacing: .zero) {
                ForEach(colors, id: \.self) { color in
                    color
                }
            }.ignoresSafeArea()
            
            let rectangle = RoundedRectangle(cornerRadius: 15)
                .frame(width: 100, height: 100)
                .position(startPosition)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.startPosition = gesture.location
                        }
                )
            
            rectangle.foregroundColor(.white)
                .blendMode(.difference)
                .overlay(rectangle.blendMode(.hue))
                .overlay(rectangle.foregroundColor(.white).blendMode(.overlay))
                .overlay(rectangle.foregroundColor(.black).blendMode(.overlay))
        }
    }
}

#Preview {
    ContentView()
}
