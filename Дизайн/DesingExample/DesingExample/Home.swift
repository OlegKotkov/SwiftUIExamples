
import SwiftUI
struct Home: View {
    @State var showProfile = false
    //для перетягивания картинки вручную
    @State var viewState = CGSize.zero
    //Для нажатия на область с кольцами
    @State var showContent = false
    
    
    var body: some View {
        
        ZStack {
            Color("ColorGrayBack")
                .edgesIgnoringSafeArea(.all)
            HomeView(showProfile: $showProfile, showContent: $showContent)
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle(degrees: Double (showProfile ? (viewState.height / 10) - 10 : 0)), axis: (x: 10, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                        self.viewState = value.translation
                            if self.viewState.height > 50 {
                                self.showProfile = false
                            }
                    }
                        .onEnded{ value in
                            self.viewState = .zero
                        }
                )
            if showContent {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                ContentView()
                //делаем возможность выхода из этого
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.white)
                            .background(Color.black)
                        .clipShape(Circle())
                    }
                    Spacer()
                }
                .offset(x: -16, y: 16)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                .onTapGesture {
                    self.showContent = false
                }
            }
           
            
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
struct AvatarView: View {
    //Связываем свойство showProfile с этой структурой
    @Binding var showProfile: Bool
    var body: some View {
        Button(action: {
            self.showProfile.toggle()
        }
        ){
            Image("avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}
//Создаем свойство для того чтобы спользовать его в оффсете, который убирает карточку за пределы экрана
let screen = UIScreen.main.bounds
