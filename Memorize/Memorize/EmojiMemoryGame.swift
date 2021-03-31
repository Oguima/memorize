//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by rafael.guimaraes on 30/03/21.
//  Copyright © 2021 guimagames. All rights reserved.
//

import SwiftUI

/*func createCardContent(pairIndex: Int) -> String {
    return "😄"
}*/

class EmojiMemoryGame {
    
    //WOW: Todos os comentados funcionariam ...
    //private(set) var model: MemoryGame<String> =
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGane()
       //MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: createCardContent)  //Apenas ve fora... não edita..., createCard é uma funcao
        //MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { (pairIndex: Int) -> String  in //Clousure, completa, mas ela é inferenciada
        /*MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { pairIndex in //Clousure (UAU)
            //return "😄" //Nem o return precisa :O
            let emojis: Array<String> = ["👻", "🎃"]
            return emojis[pairIndex]
        })*/
    //FUNCTIONAL Programing...
    //Outra sintaxe, mais limpa ainda... MemoryGame<String>(numberOfPairsOfCards: 2) {pairIndex in "😄"}
    //Outra sintaxe ..., mais limpa ainda... MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "😄"} //pois nem usou o pairIndex
    
    static func createMemoryGane() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
