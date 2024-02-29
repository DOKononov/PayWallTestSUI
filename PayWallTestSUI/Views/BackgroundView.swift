//
//  BackgroundView.swift
//  PayWallTestSUI
//
//  Created by Dmitry Kononov on 28.02.24.
//

import SwiftUI

struct BackgroundView: View {
    @State var yOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ZStack {
                    Image("image_5_1")
                        .resizable()
                        .ignoresSafeArea()
                    Image("backgroundImage")
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: yOffset)
                        .clipped()
                        .onAppear {
                            withAnimation(
                                .easeInOut(duration: 6)
                                .repeatForever()) {
                                yOffset -= geometry.size.height
                            }
                        }
                }
            }
            
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .clear, location: 0),
                    .init(color: .black, location: 0.7),
                ]),
                startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView(yOffset: 0)
}
