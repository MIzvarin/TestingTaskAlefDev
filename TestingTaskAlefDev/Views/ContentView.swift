//
//  ContentView.swift
//  TestingTaskAlefDev
//
//  Created by Максим Изварин on 08.11.2021.
//

import SwiftUI

struct ContentView: View {
    //MARK: - State properies
    @StateObject private var viewModel = ViewModel()
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
                PersonInfo(person: $viewModel.selfInfo)
                
                HStack {
                    Text("Дети (макс. 5)").bold()
                    Spacer()
                    if viewModel.children.count < 5 {
                        AddChildButton(width: buttonsWidth, height: buttonsHeight) {
                            viewModel.addChild()
                        }
                    }
                }
                
                List($viewModel.children, id: \.id) { child in
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
    
    private func removeChild(child: Person) {
        if let index = viewModel.children.firstIndex(where: { $0.id == child.id }) {
            viewModel.children.remove(at: index)
        }
    }
    
    private func clearData() {
        viewModel.children.removeAll()
        viewModel.selfInfo.age = ""
        viewModel.selfInfo.name = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
