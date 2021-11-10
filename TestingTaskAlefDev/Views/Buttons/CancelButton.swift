//
//  CancelButton.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 09.11.2021.
//

import SwiftUI

struct CancelButton: View {
    var width: CGFloat
    var height: CGFloat
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Очистить").foregroundColor(.red).bold()
        }.frame(width: width, height: height)
            .modifier(buttonBorder(color: .red))
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(width: 100, height: 20) {
            print("Cancel button will be tapped")
        }
    }
}
