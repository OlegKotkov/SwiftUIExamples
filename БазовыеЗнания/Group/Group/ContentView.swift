//
//  ContentView.swift
//  Group
//
//  Created by mac on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            //Группы снимают ограничение(10) на количество вью в стэке
            Group{
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            }
            Group{
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            }
            Group{
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
