//
//  PersonDetailsView.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 08.11.2021.
//

import SwiftUI

struct PersonDetails: View {
    @Binding var person: Person
    var title:  DetailTitle
    
    private let padding: CGFloat = 8
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title.rawValue)
                .foregroundColor(.gray)
                .padding([.leading, .trailing, .top], padding)
            TextField("", text: title == .name ? $person.name : $person.age)
                .padding([.leading, .trailing, .bottom], padding)
        }.overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 0.3))
    }
}

enum DetailTitle: String {
    case name = "Имя"
    case age = "Возраст"
}

struct PersonDetails_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person(name: "Eddard Stark", age: "55")
        PersonDetails(person: .constant(person), title: .age)
    }
}
