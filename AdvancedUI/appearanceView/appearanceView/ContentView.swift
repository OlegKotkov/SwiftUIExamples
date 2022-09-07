//
//  ContentView.swift
//  appearanceView
//
//  Created by mac on 15.08.2022.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        
    Image("Swift")
        //Заливка
            //.colorMultiply(.blue)
        //Насыщенность
          //  .saturation(0.5)
        //Контраст
            .contrast(0.5)
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
