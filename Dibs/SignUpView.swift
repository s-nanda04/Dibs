//
//  SignUpView.swift
//  Dibs
//
//  Created by minesh sumair on 3/15/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var selectedCampus: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    let campuses = ["",
    "Northeastern University - Oakland",
    "Northeastern University - Boston",
    "Northeastern University - London"]
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Select Your Campus")
                .font(.headline)
                .padding()
            
            Picker("Campus", selection: $selectedCampus) {
                ForEach(campuses, id: \.self) {
                    campus in Text(campus).tag(campus)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .frame(maxWidth: 300)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
            
            TextField("Enter your email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Enter your password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Confirm your password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

#Preview {
    SignUpView()
}
