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
                .keyboardType(.emailAddress)
                .padding()
            
            SecureField("Enter your password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)  // Disable automatic capitalization
                .disableAutocorrection(true)  // Disable autocorrection
                .textContentType(.password)
                .padding()
            
            SecureField("Confirm your password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                print("Sign Up pressed")
            }) {
                Text("Sign Up")
                    .foregroundColor(Color.black)
                    .bold()
                    .padding()
                    .frame(maxWidth: 200)
                    .background(Color(red: 0.941, green: 0.627, blue: 0.965))
                    .cornerRadius(10)
                    .padding(.horizontal, 95.0)
            }
        }
    }
}

#Preview {
    SignUpView()
}
