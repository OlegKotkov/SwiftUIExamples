
import SwiftUI

struct ContentView: View {
    @State private var show = false
    @State private var viewState = CGSize.zero
    @State private var showCards = false
    @State private var bottomState = CGSize.zero
    @State private var showFull = false
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCards ? 0.4 : 1)
                .offset(x: 0, y: showCards ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
//                        .speed(2)
//                        .repeatCount(5)
                )
            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("myColor1") : Color("myColor2"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCards ? -180 : 0)
                .scaleEffect(showCards ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCards ? 0 : 10))
                .rotation3DEffect(.degrees(showCards ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            BackCardView()
                .frame(width: showCards ? 300 : 340, height: 220)
                .background(show ? Color("myColor2") : Color("myColor1"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCards ? -140 : 0)
                .scaleEffect(showCards ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCards ? 5 : 0))
                .rotation3DEffect(.degrees(showCards ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            CardView()
                .frame(width: showCards ? 375 : 340, height: 220)
                .background(Color.black)
                //.cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCards ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCards ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCards.toggle()
                }
                .gesture(
                    DragGesture().onChanged{ value in
                        self.viewState = value.translation
                        self.show = true
                    }
                        .onEnded({ value in
                            self.viewState = .zero
                            self.show = false
                        })
                )
//            Text("\(bottomState.height)")
//                .offset(y: -300)
            BottomCardView(show: $showCards)
                .offset(x: 0, y: showCards ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
            // Custom animation
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                        if self.showFull{
                            self.bottomState.height += -300
                        }
                        if self.bottomState.height < -300 {
                            self.bottomState.height = -300
                        }
                    }
                        .onEnded { value in
                            if self.bottomState.height > 50 {
                                self.showCards = false
                            }
                            if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < 250 && self.showFull) {
                                self.bottomState.height = -300
                                self.showFull = true
                            }else {
                                self.bottomState = .zero
                                self.showFull = false
                            }
                        }
                )
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Дизайн в swift")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Сертификат")
                        .foregroundColor(Color("Primary"))
                }
                Spacer()
                
                Image("Logo SwiftUI")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Image("2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}
struct BackCardView: View {
    var body: some View {
        VStack{
            Spacer()
        }
    }
}
struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Сертификаты")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Spacer()
        }
    }
}
struct BottomCardView: View {
    //Также добавляем это свойство для отображения кольца
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("Изучение особенностей адаптивного интерфейса в SWiftUI")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            HStack (spacing: 20) {
                RingIView(color1: "Circle1", color2: "Cirecle2", width: 88, height: 88, percent: 78, show: $show)
                    .animation(Animation.easeInOut.delay(0.4))
                VStack (alignment: .leading, spacing: 8 ){
                    Text("Дизайн в swiftUI")
                        .bold()
                    Text("39 из 50 уроков завершено")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            }
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color("Background 3"))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
