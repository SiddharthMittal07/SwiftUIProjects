//
//  VerifyContactView.swift
//  FoodApp
//
//  Created by Siddharth Mittal on 04/07/22.
//

import SwiftUI

struct VerifyContactView: View {
    
    let contactNumber: String
    @State private var textFieldOTP: [String] = ["","","",""]
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Verify phone number")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Enter the 4-digit code sent to you at\n+1\(contactNumber)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            HStack(spacing: 25) {
                ForEach(0..<4) { index in
                    TextField("", text: $textFieldOTP[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .frame(width: 30, height: 30)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 7).stroke(lineWidth: 1).foregroundColor(.secondary))
                }
            }
            .padding()
            
            NavigationLink {
                
            } label: {
                Text("CONTINUE")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.green)
            .cornerRadius(15)
            .padding()
            
            VStack(spacing: 10) {
                Text("Didn't receive code? Resend Again")
                
                Text("By Signing up you agree to our Terms, Conditions and Privacy Policy")
                    .padding(.horizontal, 40)
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.8, alignment: .center)
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .font(.subheadline)
            
            Spacer()
        }
        .navigationTitle("Login to Foodly")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VerifyContactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VerifyContactView(contactNumber: "8130158001")
        }
    }
}
