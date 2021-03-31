//
//  MemoryGame.swift
//  Memorize
//
//  Created by rafael.guimaraes on 30/03/21.
//  Copyright © 2021 guimagames. All rights reserved.
//

import Foundation

//Usando Generics: pode passar qualquer tipo ali... String / int ....

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>() //Vazio ... empty , só pra inicializar
        for pairIndex in 0..<numberOfPairsOfCards {
            
            let content = cardContentFactory(pairIndex)  //WOW recebe uma função de parametro Int, e retorno CardContent
            //Par de cartas
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex*2))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex*2+1))
        }
    }
    
    //Single card (Identifiable, para poder usar no ForEach
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int //Precisa do identifiable
    }
}
