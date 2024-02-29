//
//  ContentView.swift
//  PayWallTestSUI
//
//  Created by Dmitry Kononov on 27.02.24.
//

import SwiftUI

struct PayWallView: View {
    
    @State private var selectedSubscription: Subscription?
    @State private var isShowingAlert = false
    @State private var isShowingConfirmation = false
    
    var body: some View {
        
        ZStack(alignment:.bottom) {
            BackgroundView()
            VStack {
                Text("Unlock all templates")
                    .font(.title)
                    .foregroundStyle(.white)
                
                PaymentButton(subscription: .weekly, isSelected: selectedSubscription)
                    .onTapGesture {
                        selectedSubscription = .weekly
                    }
                
                PaymentButton(subscription: .yearly, isSelected: selectedSubscription)
                    .onTapGesture {
                        selectedSubscription = .yearly
                    }
                
                Button {
                    guard selectedSubscription != nil else { return }
                    isShowingConfirmation = true
                    
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.continueButton)
                        .frame( height: 60)
                }
                .overlay {
                    Text("Continue")
                        .foregroundStyle(.white)
                }
                .fullScreenCover(isPresented: $isShowingConfirmation) {
                    if let selectedSubscription {
                        ConfirmationView(selectedSubscription: selectedSubscription,
                                         isShowingConfirmation: $isShowingConfirmation)
                    }
                }
                
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
        .overlay(Button(action: {},
                        label: { DissmisButton()}),
                 alignment: .topTrailing)
        
        .alert("Coming soon...", isPresented: $isShowingAlert) {
            Button("OK") {}
        }
    }
}

#Preview {
    PayWallView()
}


