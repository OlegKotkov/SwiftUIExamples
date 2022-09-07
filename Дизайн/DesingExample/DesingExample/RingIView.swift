

import SwiftUI

struct RingIView: View {
    var color1 = "Circle1"
    var color2 = "Circle2"
    var width: CGFloat = 44
    var height: CGFloat = 44
    var percent: CGFloat = 78
    
    @Binding var show: Bool
    
    var body: some View {
        //Создаем свойствa для того чтобы происходило пропорциональное изменение параметров
        let multiplier = width / 44
        // Чтобы кольцо показывало прогресс в процентах
        let progress = 1 - (percent / 100)
       return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1),style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
            //модификатор для вырезки сегмента
           //Когда будет показана карточка прогресс колечка заполнится
               .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors:  [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5 * multiplier, lineJoin: .round))
            //Меняем место выреза путем поворота
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingIView_Previews: PreviewProvider {
    static var previews: some View {
        // Далее это пишем тк мы перенесли сюда байндинг свойство шоу
        RingIView(show: .constant(true))
    }
}
