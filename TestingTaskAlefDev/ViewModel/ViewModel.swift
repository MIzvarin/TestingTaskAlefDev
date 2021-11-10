//
//  ViewModel.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 10.11.2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var selfInfo: Person = Person(name: "", age: "")
    @Published var children: [Person] = []
    
    func addChild() {
        let child = Person(name: "", age: "")
        children.append(child)
    }
}
