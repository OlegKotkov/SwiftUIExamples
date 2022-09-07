//
//  ContentView.swift
//  NavigationView
//
//  Created by mac on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = ["Вася", "Коля", "Маша", "Даша"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }.onMove(perform: move)
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
    func move (from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
        }
                        }
                                    














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
