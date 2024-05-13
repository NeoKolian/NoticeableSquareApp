//
//  ContentView.swift
//  NoticeableSquareApp
//
//  Created by Nikolay Pochekuev on 13.05.2024.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.white, .pink, .yellow, .black]
    let colorHeight = UIScreen.main.bounds.height / 4
    @GestureState var position: CGPoint = .zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(colors, id: \.self) { color in
                    color.frame(height: colorHeight)
                }
            }
            .overlay {
                ZStack {
                    VStack(spacing: 0) {
                        ForEach(0..<4) { index in
                            let color = index % 2 == 0 ? Color.black : Color.white
                            color.frame(height: colorHeight)
                        }
                    }
                    .frame(width: 100, height: 100)
                    .offset(x: position.x, y: position.y)
                    .gesture(
                        DragGesture()
                            .updating($position, body: { current, state, transaction in
                                state = .init(x: current.translation.width, y: current.translation.height)
                                transaction.isContinuous = true
                            })
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
