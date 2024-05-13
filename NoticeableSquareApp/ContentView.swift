//
//  ContentView.swift
//  NoticeableSquareApp
//
//  Created by Nikolay Pochekuev on 13.05.2024.
//

import SwiftUI

struct ContentView: View {
    let height = UIScreen.main.bounds.height / 4
    @GestureState var position: CGPoint = .zero

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color(UIColor(.white))
                    .frame(height: height)
                Color(UIColor(.pink))
                    .frame(height: height)
                Color(UIColor(.yellow))
                    .frame(height: height)
                Color(UIColor(.black))
                    .frame(height: height)
            }
            VStack(spacing: 0) {
                Color(UIColor(.black))
                    .frame(height: height)
                Color(UIColor(.white))
                    .frame(height: height)
                Color(UIColor(.black))
                    .frame(height: height)
                Color(UIColor(.white))
                    .frame(height: height)
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

#Preview {
    ContentView()
}
