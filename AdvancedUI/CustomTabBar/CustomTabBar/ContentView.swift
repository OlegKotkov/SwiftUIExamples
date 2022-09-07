

import SwiftUI

struct ContentView: View {
    //Для изменения цвета кнопок при нажатии
    @State private var selected = 0
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                HStack{
                    Button(action: {
                       //изменение цвета при нажатии
                        self.selected = 0
                    }) {
                      Image(systemName: "house")
                    }.foregroundColor(self.selected == 0 ? .black : .gray )
                    
                    Spacer(minLength: 12)
                    
                    Button(action: {
                        self.selected = 1
                    }) {
                        Image(systemName: "magnifyingglass")
                    }.foregroundColor(self.selected == 1 ? .black : .gray)
                    
                    Spacer().frame(width: 120)
                    
                    Button(action: {
                        self.selected = 2
                    }) {
                        Image(systemName: "person")
                    }.foregroundColor(self.selected == 2 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                    
                    Button(action: {
                        self.selected = 3
                    }) {
                        Image(systemName: "filemenu.and.selection")
                    }.foregroundColor(self.selected == 3 ? .black : .gray)
        
                }
                .padding()
                .padding(.horizontal, 22)
                .background(CurvedShape())
                
                Button(action: {
                    //
                }) {
                    Image(systemName: "heart")
                        .renderingMode(.original)
                        .padding(18)
                        .background(Color.yellow)
                        .clipShape(Circle())
                        .offset(y: -32)
                        .shadow(radius: 5)
                }
            }
        }.background(Color("Fone"))
        //Игнорим сейфЭриа
            .edgesIgnoringSafeArea(.top)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//Создаем структуру для создания формы нижней плашки
//Ее мы добавляем в качестве бэкграунда горизонтального стэка с кнопками
struct CurvedShape: View {
    var body: some View {
        
        Path { path in
            path .move(to: CGPoint(x: 0, y: 0))
            //Рисуем горизонтальную линию по всей ширине экрана
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            //Рисуем вторую линию, и это ширина прямоугольника
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
            //Рисуем дугу
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: 55) , radius: 30, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            //Рисуем линию для соединения начальной точки и нижней границы
            path.addLine(to: CGPoint(x: 0, y: 55))
    //Делаем заливку всей фигуры
        }.fill(Color.white)
            //Разворачиваем это все книзу головой
            .rotationEffect(.degrees(180))
    }
}
