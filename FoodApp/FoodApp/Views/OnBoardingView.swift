//
//  OnBoardingView.swift
//  FoodApp
//
//  Created by Siddharth Mittal on 03/07/22.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State private var selectedPageTab: Int = 1
    
    var body: some View {
        VStack {
            Spacer()
            onboardingTabs
            Spacer()
            Spacer()
            navigationButton
        }
        .background(Color.gray.opacity(0.15).ignoresSafeArea())
        .navigationBarHidden(true)
    }
}

extension OnBoardingView {
    
    private var onboardingTabs: some View {
        Group {
            TabView(selection: $selectedPageTab) {
                pageView(imageName: "Illustrations_1", title: "All your favorites", body: "Order from the best local restaurants with easy, on-demand delivery")
                    .tag(1)
                
                pageView(imageName: "Illustrations_2", title: "Free delivery offers", body: "Free delivery for new customers via Apple Pay and other payment methods")
                    .tag(2)
                
                pageView(imageName: "Illustrations_3", title: "Choose your food", body: "Easily find your type of food craving and you'll get delivery in wide range")
                    .tag(3)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: UIScreen.main.bounds.height * 0.5)
            
            HStack {
                ForEach(1..<4, id: \.self) { index in
                    Ellipse()
                        .frame(width: 10, height: 7)
                        .foregroundColor(selectedPageTab == index ? .green : .white)
                }
            }
        }
    }
    
    private var navigationButton: some View {
        NavigationLink {
            LoginView()
        } label: {
            Text("GET STARTED")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.heavy)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.green)
        .cornerRadius(15)
        .padding()
    }
    
    private func pageView(imageName: String, title: String, body: String) -> some View{
        VStack(spacing: 15) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.55)
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            Text(body)
                .font(.body)
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width * 0.9)
        .multilineTextAlignment(.center)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
         NavigationView {
            OnBoardingView()
        }
    }
}
