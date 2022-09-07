
import SwiftUI
struct HomeView: View {
    @Binding var showProfile: Bool
    @Binding var showContent: Bool
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    AvatarView(showProfile: $showProfile)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.leading,14)
                .padding(.top, 30)
            //Добавляем кольца рядом с автаром
            ScrollView(.horizontal,showsIndicators: false){
                RingsView()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                    .onTapGesture {
                        self.showContent = true
                    }
            }
            // !!!!! Создали карточку, вынесли ее в отдельную структуру. Потом размножили(левая кнопка с коммандом - REPEAT) - Автоматически заворачивается в ForEach
            // С помощь того же меню заворачиваем ForEach B VStack, который меняем на ScrollView. К скролу добавляем горизонтал, а цикл заворачиваем в HStack
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    // Изначальные 0..<5 Заменяем на sectionData
                    ForEach(sectionData) { item in
                        //Для анимации заворачиваем секцию в в эту штуку
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: geometry.frame(in: .global).minX - 30) / -20, axis: (x: 0, y: 10, z: 0))
                        }
                        //Обязтельно задаем ему размер как у стэка
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            .offset(y: -30)
            
            HStack {
                Text("Курсы")
                    .font(.title)
                .bold()
                Spacer()
            }
            .padding(.leading, 30)
            .offset(y: -60)
            
            SectionView(section: sectionData[1], width: screen.width - 60, height: 275)
                    .offset(y: - 60)
            
            Spacer()
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}
struct SectionView: View {
    //Для взаимодействия массива с карточками и вью создаем:
    var section: Section
    //После этого заменяем изначальные данные в первой карточке на структурные
    // Делаем динамический размер самой карточки
    var width: CGFloat = 275
    var height: CGFloat = 275
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}
//Создаем модель данных для отображения карточек
struct Section: Identifiable {
    var id = UUID()
    
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}
// Создаем массив карточек - экземпляров структуры Section
let sectionData = [Section(title: "Дизайн в SwiftUI", text: "50 уроков", logo: "Logo SwiftUI", image: Image("1"), color: Color ("ColorPurple")),
    Section(title: "Основы Swift", text: "30 Уроков", logo: "Logo SwiftUI", image: Image("2"), color: Color("ColorCard2")),
    Section(title: "Решение задач на языке Swift", text: "35 уроков", logo: "Logo SwiftUI", image: Image("4"), color: Color("ColorCard3"))
]

struct RingsView: View {
    var body: some View {
        HStack (spacing: 30){
            HStack(spacing: 12) {
                RingIView(color1: "Circle1", color2: "Circle2", width: 44, height: 44, percent: 68, show: .constant(true))
                VStack (alignment: .leading, spacing: 4.0){
                    Text("Осталось 7 минут")
                        .font(.subheadline)
                        .bold()
                    Text("Смотрел 15 минут сегодня")
                        .font(.caption)
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            
            HStack(spacing: 12) {
                RingIView(color1: "Circle5", color2: "Circle6", width: 32, height: 32, percent: 54, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 12)
            
            HStack(spacing: 12) {
                RingIView(color1: "Circle3", color2: "Circle4", width: 32, height: 32, percent: 32, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            
        }
    }
}
