//
//  buttonBorder.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 10.11.2021.
//

import SwiftUI

struct buttonBorder: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content.padding(.all, 10)
            .overlay(Capsule()
                        .stroke(color, lineWidth: 3))
    }
}
