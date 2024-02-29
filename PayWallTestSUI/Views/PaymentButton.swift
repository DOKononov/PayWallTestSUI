//
//  PaymentButton.swift
//  PayWallTestSUI
//
//  Created by Dmitry Kononov on 28.02.24.
//

import SwiftUI

struct PaymentButton: View {
    var paymentItem: PaymentItem
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(paymentItem.isSelected ? Color.appSelectedBorder : Color.clear, lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.btnBackground)
                )
                .frame( height: 60)
                .overlay(alignment: .leading) {
                    HStack(alignment: .lastTextBaseline) {
                        VStack {
                            Text(paymentItem.title)
                                .foregroundStyle(Color.fontColor)
                            Text(paymentItem.value)
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        if let valuePerWeek = paymentItem.valuePerWeek {
                            Text(valuePerWeek)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding()
                }
        }
    }
}


struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentButton(paymentItem: PaymentItem(isSelected: true, title: "Test", value: "$0"))
    }
}

