//
//  DateButton.swift
//  TaskApp-CoreData
//
//  Created by Siddharth Mittal on 19/07/22.
//

import SwiftUI

struct DateButton: View {
    var title: String
    @EnvironmentObject var vm: HomeViewModel
    
    var body: some View {
        Button {
            vm.updateDate(value: title)
        } label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(vm.checkDate() == title ? .white : .gray)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    vm.checkDate() == title ?
                    LinearGradient(colors: [.orange, .pink], startPoint: .leading, endPoint: .trailing)
                    :
                        LinearGradient(colors: [.white], startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
        }
    }
}

struct DateButton_Previews: PreviewProvider {
    static var previews: some View {
        DateButton(title: "Today")
            .environmentObject(HomeViewModel())
    }
}
