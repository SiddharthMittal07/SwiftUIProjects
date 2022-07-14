//
//  ForgotPassword.swift
//  FoodApp
//
//  Created by Siddharth Mittal on 03/07/22.
//

import SwiftUI

struct ForgotPassword: View {
    
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Forgot Password")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Enter your email address and we will\nsend you reset instructions.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
                
            
            TextField("Email Address", text: $email)
                .padding()
                .background(.white)
                .cornerRadius(10)
                
            Button {
                
            } label: {
                Text("RESET PASSWORD")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.green)
            .cornerRadius(10)
            
            
            Spacer()
        }
        .padding()
        .navigationTitle("Forgot Password")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.gray.opacity(0.15).ignoresSafeArea())
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForgotPassword()
        }
    }
}
