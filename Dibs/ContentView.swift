//
//  ContentView.swift
//  Dibs
//
//  Created by Minesh Sumair on 3/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("DibsLogo")
                .scaledToFit()
                
            Text("Dibs!")
                .font(.system(size: 80, design: .rounded))
                .bold(true)
                .foregroundColor(.purple)
            Text("Thrift on Campus")
            
            Text("Sign In")
                .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.horizontal, 95.0)
            
            NavigationLink(destination: SignUpView()) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.horizontal, 95.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
