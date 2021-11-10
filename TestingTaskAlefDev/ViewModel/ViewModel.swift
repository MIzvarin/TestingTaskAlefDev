//
//  ViewModel.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 10.11.2021.
//

import Foundation

protocol ViewModelProtocol {
    var selfInfo: Person { get set }
    var children: [Person] { get set }
}

class ViewModel: ViewModelProtocol, ObservableObject {
    @Published var selfInfo: Person = Person(name: "", age: "")
    @Published var children: [Person] = []
}
