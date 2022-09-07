//
//  ContentView.swift
//  Button
//
//  Created by mac on 29.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetail = false
    
    
    
    
    var body: some View {
        // Для отображения необходимо чтобы вернулась какая- то вью, поэтому кнопку необходимо обернуть в другую вью - СТЭК
        VStack {
        
        Button {
            self.showDetail.toggle()
        } label: {
            Text("Show details")
        }.padding()
                .background(Color.blue)
                .foregroundColor(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                           
        if showDetail {
            Text("Poshel na huy")
                .font(.largeTitle)
        }
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
