//
//  ContentView.swift
//  List
//
//  Created by mac on 30.07.2022.
//

import SwiftUI
struct TaskRow: View {
    var body: some View {
        Text("Some task")
    }
}
struct ContentView: View {
    var body: some View {
        List {
            Section(header: Text ("imported tasks"))  {
                TaskRow()
                TaskRow()
                TaskRow()
            }.listRowBackground(Color.green)
            Section(header: Text ("Other tasks"))  {
                TaskRow()
                TaskRow()
                TaskRow()
            }.listRowBackground(Color.yellow)
            Section(header: Text ("Na huy tasks"))  {
                TaskRow()
                TaskRow()
                TaskRow()
            }.listRowBackground(Color.pink)
        }.listStyle(.sidebar)
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
