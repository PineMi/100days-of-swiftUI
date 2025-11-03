import SwiftUI

struct CardItem: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
}

let cardData: [CardItem] = [
    .init(title: "Card 1", color: .blue),
    .init(title: "Card 2", color: .red),
    .init(title: "Card 3", color: .green),
    .init(title: "Card 4", color: .orange),
    .init(title: "Card 5", color: .yellow),
    .init(title: "Card 6", color: .purple)
]

struct CardTricks: View {
    
    @State private var isListLayout: Bool = false
    @Namespace private var cardNamespace

    var body: some View {
        VStack {
            Text("Card Layouts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)

            Button("Toggle Layout") {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.75)) {
                    isListLayout.toggle()
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)

            ScrollView {
                
                VStack(spacing: isListLayout ? 20 : -130) {
                    
                    ForEach(Array(cardData.enumerated()), id: \.element.id) { index, item in
                        
                        CardView(item: item, namespace: cardNamespace, isListLayout: isListLayout)
                            
                            
                            .scaleEffect(isListLayout ? 1 : 1 - (CGFloat(index) * 0.05))
                            
                            
                            .zIndex(Double(cardData.count - index))
                    }
                }
                .padding()
                .padding(.top, isListLayout ? 0 : 50)
                
                
            }
            
            Text("Footer Content")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CardView: View {
    let item: CardItem
    let namespace: Namespace.ID
    let isListLayout: Bool
    
    var body: some View {
        Text(item.title)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: isListLayout ? 320 : 320,
                   height: isListLayout ? 100 : 150)
            .background(item.color)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.3), radius: 5, y: 3)
            .matchedGeometryEffect(id: item.id, in: namespace)
    }
}

#Preview {
    CardTricks()
}
