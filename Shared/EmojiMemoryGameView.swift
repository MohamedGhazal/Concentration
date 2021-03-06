//
//  EmojiMemoryGameView.swift
//  Shared
//
//  Created by Mohamed on 2020-11-15.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject  var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack(){
            ForEach(0..<4){ index in
                HStack(){
                    ForEach(viewModel.cards){ card in
                        CardView(card: card).onTapGesture{
                            viewModel.choose(card: card)
                            
                        }
                    }
                }
            }
                    .padding()
                    .foregroundColor(Color.orange)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaling))
        }
    }
    
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaling: CGFloat = 0.75
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
            
    }
}
