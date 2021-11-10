//
//  ContentView.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 08.11.2021.
//

import SwiftUI

struct ContentView: View {
    //MARK: - State properies
    @State private var children: [Person] = []
    @State private var selfInfo = Person(name: "", age: "")
    @State private var showAlert = false
    
    //MARK: - Private properties
    private let alertMessage = "Вы уверены что хотите сбросить данные?"
    private let buttonsWidth: CGFloat = 200
    private let buttonsHeight: CGFloat = 25
    
    //MARK: - View
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Персональные данные").bold()
                PersonInfo(person: $selfInfo)
                
                HStack {
                    Text("Дети (макс. 5)").bold()
                    Spacer()
                    if children.count < 5 {
                        AddChildButton(width: buttonsWidth, height: buttonsHeight) {
                            addChild()
                        }
                    }
                }
                
                List($children, id: \.id) { child in
                    ChildInfo(person: child) {
                        removeChild(child: child.wrappedValue)
                    }
                }.listStyle(.inset)
            }
            
            VStack {
                CancelButton(width: buttonsWidth, height: buttonsHeight) {
                    showAlert = true
                }.alert(alertMessage, isPresented: $showAlert) {
                    Button("Отмена", role: .cancel) { }
                    Button("Сбросить данные", role: .destructive) { clearData() }
                }
            }
        }.padding([.leading, .trailing], 15)
    }
    
    //MARK: - Private functions
    private func addChild() {
        let child = Person(name: "", age: "")
        children.append(child)
    }
    
    private func removeChild(child: Person) {
        if let index = children.firstIndex(where: { $0.id == child.id }) {
            children.remove(at: index)
        }
    }
    
    private func clearData() {
        children.removeAll()
        selfInfo.age = ""
        selfInfo.name = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
