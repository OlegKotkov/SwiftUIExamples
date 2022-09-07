

import SwiftUI

struct ContentView: View {
    //создаем переменную, которая отвечает за переход между коричневыми вью
    @State private var index = 0

    var body: some View {
        //Родительское вью для того чтобы внутренние вью подстраивались под родительское
        GeometryReader{ _ in
            VStack{
                Image("marshall")
                    .resizable()
                    .frame(width: 70, height: 40)
                    .offset(y: 30)
                
                ZStack{
                    //Здесь размещаем обе наши структуры.Основное ядро логтки
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                    
                }
                HStack(spacing: 15){
                    Rectangle()
                        .fill(Color("Color2"))
                        .frame(height: 1)
                    Text("OR")
                    Rectangle()
                        .fill(Color("Color2"))
                        .frame(height: 1)
                }.padding(.horizontal, 30)
                    .padding(.top, 50 )
                HStack(spacing: 25){
                    Button(action: {
                        //
                    }){
                        Image("apple")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        //
                    }){
                        Image("facebook")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        //
                    }){
                        Image("twitter")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                    
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
        }
        .background(Color("Color1")).edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//Делаем кастомную фогуру
struct CShape1: Shape{
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}
//Делаем вторую фигуру зеркально противоположную
struct CShape2: Shape{
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width , y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}
//Создаем вью с логином сайнАп
struct Login: View{
  @State private var email = ""
    @State private var pass = ""
    // создаем переменную, которая отвечает за состояние переход между вью и связанную с индексом
    @Binding var index: Int
    
    var body: some View{
        ZStack(alignment: .bottom){
            VStack{
                HStack{
                    VStack(spacing: 10){
                        Text("Login")
                        //Делаем изменение цвета в зависимости от выбора вью (Индекс это  то, что привязано к переменной  Binding)
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        // Голубая полоска
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                        
                    }
                    
                Spacer()
                    
                }.padding(.top, 30)
                VStack{
                    HStack(spacing: 15 ){
                        Image(systemName: "envelop.fill")
                            .foregroundColor(Color("Color2"))
                        TextField("Email Address", text: self.$email)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 40)
                VStack{
                    HStack(spacing: 15 ){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color2"))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 30)
                HStack{
                    Spacer(minLength: 0)
                    Button(action: {
                        //
                    }) {
                        Text("Forget Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }.padding(.horizontal)
                    .padding(.top, 30)
                
            }.padding()
                .padding(.bottom, 65)
                .background(Color("Color3"))
            //Производим закругдуние по форме нашей кастомной фигуры
                .clipShape(CShape1())
                .contentShape(CShape1())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 0
                }
                .cornerRadius(35)
                .padding(.horizontal, 20)
            Button(action: {
                //
            }) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color2"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                 
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0)
            
        }
    }
}

// Строим второе вью Регистрация
struct SignUp: View {
    @State private var email = ""
      @State private var pass = ""
      @State private var repass = ""
      @Binding var index: Int
    var body: some View{
        ZStack(alignment: .bottom){
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    VStack(spacing: 10){
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)
                  
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color2"))
                        TextField("Email Address", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                
                VStack{
                    HStack(spacing: 15){
                       Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color2"))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color2"))
                        SecureField("Passwrd", text: self.$repass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color3"))
            .clipShape(CShape2())
            .contentShape(CShape2())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            
            Button(action: {
                //
            }){
                Text("SIGNUP")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color2"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5 , x: 0, y: -5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
