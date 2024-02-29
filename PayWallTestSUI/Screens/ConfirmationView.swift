//
//  ConfirmationView.swift
//  PayWallTestSUI
//
//  Created by Dmitry Kononov on 29.02.24.
//

import SwiftUI

struct ConfirmationView: View {
    
    var selectedSubscription: Subscription
    @State private var isShowingAlert = false
    @Binding var isShowingConfirmation: Bool
    var body: some View {
        
        ZStack(alignment:.bottom) {
            BackgroundView()

            VStack {
                Text("All templates for free")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                Text("All templates will be available to you.")
                    .foregroundStyle(.white)
              
                Text("3-Day free trial, then $\(selectedSubscription.costPerWeek, specifier: "%.2f") / Week")
                    .foregroundStyle(.white)
                    .padding(.bottom)

                
                Button {
                    isShowingConfirmation = false
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.continueButton)
                        .frame( height: 60)
                }
                .overlay {
                    Text("Continue")
                        .foregroundStyle(.white)
                }
                .padding(.bottom)
                
                HStack {
                    Text("Terms")
                    Spacer()
                    Text("Privacy Policy")
                    Spacer()
                    Text("Restore")
                }
                .foregroundStyle(.gray)
                .padding()
                .onTapGesture {
                    isShowingAlert = true
                }
            }
            .padding()
        }
        .alert("Coming soon...", isPresented: $isShowingAlert) {
            Button("OK") {}
        }
        .overlay(Button(action: {
            isShowingConfirmation = false
        }, label: {
            DissmisButton()
        }), alignment: .topTrailing)
    }
}

#Preview {
    ConfirmationView(selectedSubscription: .yearly,
                     isShowingConfirmation: .constant(true))
}

