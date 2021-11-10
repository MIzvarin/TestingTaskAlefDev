//
//  PersonInfo.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 08.11.2021.
//

import SwiftUI

struct PersonInfo: View {
    @Binding var person: Person
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            PersonDetails(person: $person, title: .name)
            PersonDetails(person: $person, title: .age)
                .keyboardType(.decimalPad)
        }
    }
}

struct PersonInfo_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person(name: "Jhon Snow", age: "30")
        PersonInfo(person: .constant(person))
    }
}
