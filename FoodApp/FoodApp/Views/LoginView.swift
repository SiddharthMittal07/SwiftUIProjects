//
//  LoginView.swift
//  FoodApp
//
//  Created by Siddharth Mittal on 03/07/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSecuredPassword: Bool = true
    
    var body: some View {
        VStack(spacing: 5) {
            header
            inputFields
            NavigationLink {
                ForgotPassword()
            } label: {
                Text("Forgot Password?")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            NavigationLink {
                RegisterContactView()
            } label: {
                Text("Sign In")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.green)
            .cornerRadius(10)
            .padding()
            
            Text("OR")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom)
            
            VStack {
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Don't have account? Create new account")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
                
                SocialButton(image: "facebook", title: "Facebook", color: Color(hue: 0.677, saturation: 0.857, brightness: 0.847))
                SocialButton(image: "google", title: "Google", color: Color(hue: 0.615, saturation: 0.814, brightness: 0.9))
            }
            Spacer()
            
        }
        .navigationTitle("Sign In")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.gray.opacity(0.15).ignoresSafeArea())
    }
}


extension LoginView {
    private var header: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Welcome To")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("Enter your Phone number of Email\naddress to Sign In. Enjoy your food :)")
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var inputFields: some View {
        VStack(spacing: -15) {
            TextField("Email Address", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding()
            
            if isSecuredPassword {
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "eye.slash")
                            .font(.headline)
                            .padding()
                            .onTapGesture {
                                isSecuredPassword.toggle()
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
                                isSecuredPassword.toggle()
                            }
                    }
                    .padding()
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
