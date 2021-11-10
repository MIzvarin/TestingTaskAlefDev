//
//  AddChildButton.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 10.11.2021.
//

import SwiftUI

struct AddChildButton: View {
    var width: CGFloat
    var height: CGFloat
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "plus").foregroundColor(.cyan)
                Text("Добавить ребенка").foregroundColor(.cyan).bold()
            }
        }.frame(width: width, height: height)
            .modifier(buttonBorder(color: .cyan))
    }
}

struct AddChildButton_Previews: PreviewProvider {
    static var previews: some View {
        AddChildButton(width: 200, height: 20) {
            print("Add child buttom will be tapped")
        }
    }
}
