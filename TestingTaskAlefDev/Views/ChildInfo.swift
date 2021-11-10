//
//  ChildInfoView.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 09.11.2021.
//

import SwiftUI

struct ChildInfo: View {
    @Binding var person: Person
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 40) {
            PersonInfo(person: $person)
            Button(action: action) {
                Text("Удалить").foregroundColor(.cyan)
            }
        }
    }
}

struct ChildInfo_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person(name: "Jhon Snow", age: "33")
        ChildInfo(person: .constant(person)) {
            print("Delete buttom will tapped")
        }
    }
}
