//
//  RegisterView.swift
//  FoodApp
//
//  Created by Siddharth Mittal on 04/07/22.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSecurePassword: Bool = true
    @State private var isSecureConfirmPassword: Bool = true
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10){
                Text("Create Account")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Enter your Name, Email and Password\nto Sign Up")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack(spacing: -15) {
                TextField("Full Name", text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                
                TextField("Email Address", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                
                if isSecurePassword {
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "eye.slash")
                                .font(.headline)
                                .padding()
                                .onTapGesture {
                                    isSecurePassword.toggle()
                                }
                        }
                        .padding()
                } else {
                    TextField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "eye")
                                .font(.headline)
                                .padding()
                                .onTapGesture {
                                    isSecurePassword.toggle()
                                }
                        }
                        .padding()
                }
                
                if isSecureConfirmPassword {
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "eye.slash")
                                .font(.headline)
                                .padding()
                                .onTapGesture {
                                    isSecureConfirmPassword.toggle()
                                }
                        }
                        .padding()
                } else {
                    TextField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "eye")
                                .font(.headline)
                                .padding()
                                .onTapGesture {
                                    isSecureConfirmPassword.toggle()
                                }
                        }
                        .padding()
                }
            }
            
            Button {
                
            } label: {
                Text("SIGN UP")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.green)
            .cornerRadius(10)
            .padding()
            
            VStack(spacing: 10) {
                NavigationLink {
                    
                } label: {
                    Text("Already have an account? Sign-In")
                }
                
                Text("By Signing Up you agree to our Terms, Conditions and Privacy Policy")
                
                Text("OR")
            }
            .foregroundColor(.secondary)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.7)
            .multilineTextAlignment(.center)
            
            VStack(spacing: -5) {
                SocialButton(image: "facebook", title: "Facebook", color: Color(hue: 0.677, saturation: 0.857, brightness: 0.847))
                SocialButton(image: "google", title: "Google", color: Color(hue: 0.615, saturation: 0.814, brightness: 0.9))
            }
            
            Spacer()
        }
        .navigationTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.gray.opacity(0.15).ignoresSafeArea())
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
    }
}
