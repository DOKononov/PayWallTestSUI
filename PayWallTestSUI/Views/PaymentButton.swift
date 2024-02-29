//
//  PaymentButton.swift
//  PayWallTestSUI
//
//  Created by Dmitry Kononov on 28.02.24.
//

import SwiftUI

struct PaymentButton: View {
    
    var subscription: Subscription
    var isSelected: Subscription?
    
    private var scrokeColor : Color {
        if let isSelected, isSelected == subscription {
            Color.appSelectedBorder
        } else {
            Color.clear
        }
    }
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(scrokeColor, lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.btnBackground)
                )
                .frame( height: 60)
                .overlay(alignment: .leading) {
                    HStack(alignment: .lastTextBaseline) {
                        VStack(alignment: .leading) {
                            Text(subscription.title)
                                .foregroundStyle(Color.btnTitle)
                            Text(subscription.subTitle)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        Spacer()
                        if let costPerWeek = subscription.costPerWeekTitle {
                            Text(costPerWeek)
                                .foregroundStyle(.white)
                                .padding(.trailing)
                        }
                    }
                }
        }
    }
}


struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentButton(subscription: .yearly)
    }
}

