//
//  RegisterContactView.swift
//  FoodApp
//
//  Created by Siddharth Mittal on 04/07/22.
//

import SwiftUI

struct RegisterContactView: View {
    
    @State private var contactNumber: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("Get Started with\nFoodly")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Enter your phone number to use foodly\nand enjoy your food :)")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text("🇺🇸")
                    .font(.largeTitle)
                Text("+1")
                    .font(.title3)
                TextField("Phone Number", text: $contactNumber)
                    .padding()
                    .textContentType(.telephoneNumber)
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2.0).foregroundColor(Color.gray.opacity(0.5)))
            .padding(.horizontal)
            
            Spacer()
            
            NavigationLink {
                VerifyContactView(contactNumber: "123123124")
            } label: {
                Text("SIGN UP")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.green)
            .cornerRadius(15)
            .padding()
            
        }
        .navigationTitle("Login to Foodly")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.gray.opacity(0.15).ignoresSafeArea())
    }
}

struct RegisterContactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterContactView()
        }
    }
}
