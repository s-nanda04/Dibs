//
//  LandingView.swift
//  Dibs
//
//  Created by Minesh Sumair on 3/15/25.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image(.dibslogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity)

                
                Text("Sign In")
                    .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.941, green: 0.627, blue: 0.965))
                        .cornerRadius(10)
                        .padding(.horizontal, 95.0)
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color(red: 0.941, green: 0.627, blue: 0.965))
                        .cornerRadius(10)
                        .padding(.horizontal, 95.0)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.812, green: 0.937, blue: 0.988))
        }
        }
}

#Preview {
    LandingView()
}
