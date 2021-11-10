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
    
    init(selfInfo: Person, children: [Person])
}

class ViewModel: ViewModelProtocol, ObservableObject {
    var selfInfo: Person
    var children: [Person]
    
    required init(selfInfo: Person, children: [Person]) {
        self.selfInfo = selfInfo
        self.children = children
    }
}
