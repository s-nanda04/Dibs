//
//  BuyingPageView.swift
//  Dibs
//
//  Created by minesh sumair on 3/15/25.
//

import SwiftUI

struct BuyingPageView: View {
    var body: some View {
        VStack {
            Text("Welcome to Dibs!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Start buying and selling now.")
                .font(.title2)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .background(Color(red: 0.81, green: 0.94, blue: 0.99).ignoresSafeArea()) // Pastel Blue Background
        .navigationBarBackButtonHidden(true) // Hides the back button
    }
}

#Preview {
    BuyingPageView()
}
