//
//  ContentView.swift
//  DevRush_1_TheFlag
//
//  Created by Sergey on 16.07.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    var correctAnswer = Int.random(in: 0...2)
    
    var textCorrect = String.LocalizationValue(stringLiteral: "textCorrect")
    var textWrong = String.LocalizationValue(stringLiteral: "textWrong")
    
    var body: some View {
        
        ZStack {
            
            Color.gray
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text(LocalizedStringKey("text_tapTheFlag"))
                        .foregroundStyle(.white)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { number in
                    
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        
        if number == correctAnswer {
            scoreTitle = String(localized: textCorrect)
        } else {
            scoreTitle = String(localized: textWrong)
        }
        
        showingScore = true
        
    }
    
    
    
}

#Preview {
    ContentView()
}
