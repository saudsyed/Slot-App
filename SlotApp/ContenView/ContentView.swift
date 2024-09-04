//
//  ContentView.swift
//  SlotApp
//
//  Created by Saud Syed on 09/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "cherry", "star"]
    private var betAmount = 5
    
    @State private var number = [0, 0, 0]
    @State private var credit = 1000
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            // View Containing Stacl
            VStack {
                Spacer()
                
                // Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots")
                        .foregroundColor(.white)
                        .bold()
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                Spacer()
                
                // Score
                Text("Score: \(credit)")
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                
                // Items Cards
                HStack {
                    Spacer()
                    Image(symbols[number[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[number[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[number[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()
                }
                Spacer()
                
                // Button
                Button(role: .none) {
                    // Change Images
                    number[0] = Int.random(in: 0...symbols.count - 1)
                    number[1] = Int.random(in: 0...symbols.count - 1)
                    number[2] = Int.random(in: 0...symbols.count - 1)
                    
                    //Check winning
                    if number[0] == number[1] && number[1] == number[2] {
                        // Won
                        credit += betAmount * 10
                    } else {
                        // Loss
                        credit -= betAmount
                    }
                    
                } label: {
                    Text("Spin")
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(.pink)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
