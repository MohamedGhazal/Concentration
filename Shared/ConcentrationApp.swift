//
//  ConcentrationApp.swift
//  Shared
//
//  Created by Mohamed on 2020-11-15.
//

import SwiftUI

@main
struct ConcentrationApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
