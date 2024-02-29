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
            Image("image_5_1")
                .resizable()
                .scaledToFit()
                .offset(y: -150)

            GeometryReader { geometry in
                Image("backgroundImage")
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(y: yOffset)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 6).repeatForever()) {
                            yOffset -= geometry.size.height * 0.8
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
