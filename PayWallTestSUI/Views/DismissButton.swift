//
//  DismissButton.swift
//  PayWallTestSUI
//
//  Created by Dmitry Kononov on 29.02.24.
//

import SwiftUI

struct DissmisButton: View {
    var body: some View {
        ZStack {
            Image(systemName: "xmark")
                .imageScale(.large)
                .frame(width: 44, height: 44)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    DissmisButton()
}

