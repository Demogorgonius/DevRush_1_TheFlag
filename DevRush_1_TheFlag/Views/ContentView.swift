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
    
    @State private var score: Int = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var textCorrect = String.LocalizationValue(stringLiteral: "textCorrect")
    var textWrong = String.LocalizationValue(stringLiteral: "textWrong")
    
    var body: some View {
        
        ZStack {
            
            Color.teal
                .ignoresSafeArea()
            
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button(LocalizedStringKey("button_Continue"), action: askQuestions)
                } message: {
                    Text(String(localized: String.LocalizationValue(stringLiteral: "button_Continue_Text_1")) + String(score) + String(localized: String.LocalizationValue(stringLiteral: "button_Continue_Text_2")))
                }
            VStack(spacing: 15) {
                VStack {
                    Text(LocalizedStringKey("text_tapTheFlag"))
                        .foregroundStyle(.gray)
                        .fontWeight(.heavy)
                    Text(LocalizedStringKey(countries[correctAnswer]))
                        .foregroundStyle(.gray)
                        .fontWeight(.bold)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                ForEach(0..<3) { number in
                    
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .clipShape(.buttonBorder)
                            .shadow(color: .black, radius: 5)
                    }
                }
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        
        if number == correctAnswer {
            scoreTitle = String(localized: textCorrect)
            score += 1
        } else {
            scoreTitle = String(localized: textWrong)
        }
        
        showingScore = true
        
    }
    
    func askQuestions() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

#Preview {
    ContentView()
}
