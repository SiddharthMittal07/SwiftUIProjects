//
//  UploadView.swift
//  majorproject
//
//  Created by Siddharth Mittal on 12/07/22.
//

import SwiftUI

struct UploadView: View {
    
    @StateObject private var vm = UploadViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var showImagePicker = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Text("UPLOAD")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                    
                    Text(vm.uploadDef)
                        .font(.subheadline)
                        .padding()
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    
                    VStack {
                        if let image = vm.image {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(15)
                        }
                        
                        Button {
                            vm.showImagePicker = true
                        } label: {
                            Text("Choose Image")
                                .foregroundColor(.white)
                                .padding()
                        }
                        .background(.blue)
                        .cornerRadius(10)
                        
                        
                        Button {
                            vm.uploadImage()
                        } label: {
                            Text("Upload Image")
                                .foregroundColor(.white)
                                .padding()
                        }
                        .background(.green)
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                }
            }
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.primary)
            }
            .padding()
        }
        .sheet(isPresented: $vm.showImagePicker, content: {
            ImagePicker(selectedImage: $vm.image)
        })
        .background(Color("background").ignoresSafeArea())
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
