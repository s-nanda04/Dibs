//
//  SignUpView.swift
//  Dibs
//
//  Created by minesh sumair on 3/15/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var selectedCampus: String = ""
    @State private var showThankYou = false
    @State private var navigateToBuyingPage = false

    let campuses = ["", "Northeastern University - Oakland", "Northeastern University - Boston", "Northeastern University - London"]

    var body: some View {
        NavigationStack {
            VStack {
                if showThankYou {
                    ThankYouView(username: username) // Pass username
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showThankYou = false
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    navigateToBuyingPage = true
                                }
                            }
                        }
                } else {
                    Form {
                        TextField("Enter your username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.words)
                        
                        TextField("Enter your email", text: $email)
                            .keyboardType(.emailAddress)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)

                        SecureField("Enter your password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .textContentType(.newPassword)

                        Picker("Select Campus", selection: $selectedCampus) {
                            ForEach(campuses, id: \.self) { campus in
                                Text(campus).tag(campus)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Button(action: {
                            withAnimation {
                                showThankYou = true
                            }
                        }) {
                            Text("Sign Up")
                                .foregroundColor(.black)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 0.941, green: 0.627, blue: 0.965))
                                .cornerRadius(10)
                                .padding(.horizontal, 95.0)
                        }
                    }
                    .navigationDestination(isPresented: $navigateToBuyingPage) {
                        BuyingPageView()  // Navigates to the new SwiftUI file
                    }
                }
            }
            .navigationTitle("Sign Up")
            .padding()
        }
    }
}

struct ThankYouView: View {
    var username: String

    var body: some View {
        VStack {
            Text("Thank you, \(username)! for signing up")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Redirecting to the marketplace...")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .opacity(1)
    }
}

#Preview {
    SignUpView()
}
