//
//  ContentView.swift
//  PayWallTestSUI
//
//  Created by Dmitry Kononov on 27.02.24.
//

import SwiftUI

struct PayWallView: View {
    

    
    @State private var base = PaymentItem(isSelected: false,
                                          title: "First 3 days free",
                                          value: "Weekly - $9.99",
                                          valuePerWeek: nil)
    @State private var pro = PaymentItem(isSelected: false,
                                         title: "Special Offer",
                                         value: "Yearly - $49.99",
                                         valuePerWeek: "$4.99 / week")
    
    
    var body: some View {
        
        ZStack(alignment:.bottom) {
            BackgroundView()
            VStack {
                Text("Unlock all templates")
                    .font(.title)
                    .foregroundStyle(.white)

                PaymentButton(paymentItem: base)
                    .onTapGesture {
                        base.isSelected.toggle()
                        pro.isSelected = false
                    }
                
                PaymentButton(paymentItem: pro)
                    .onTapGesture {
                        pro.isSelected.toggle()
                        base.isSelected = false
                    }
                
                Button {
                    print("Tap")
                } label: {
              RoundedRectangle(cornerRadius: 20)
                        .fill(Color.continueButton)
                        .frame( height: 60)
                }
                .overlay {
                    Text("Continue")
                        .foregroundStyle(.white)
                }
                
                HStack {
                    Button(action: {}, label: {
                        Text("Terms")
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Text("Privacy Policy")
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Text("Restore")
                    })
                }
                .foregroundStyle(.gray)
                .padding()

            }
            .padding()
        }
    }
}

#Preview {
    PayWallView()
}


