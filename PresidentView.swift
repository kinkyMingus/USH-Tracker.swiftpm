//
//  SwiftUIView.swift
//  USH Tracker
//
//  Created by DAVID SHOW on 11/6/25.
//

import SwiftUI

struct PresidentView: View {
    @State var people = Data.init()
    @State var randomAns = ""
    @State var selection = ""
    @State var randomButtonSelector = 0
    var body: some View {
        VStack {
            Text("Who is this President?")
                .font(.custom("Papyrus", size: 24))
            
            Spacer()
            
            Text(randomAns)
                .font(.custom("Papyrus", size: 24))
            
            Image(randomAns)
                .resizable()
                .scaledToFit()
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                
                Button {
                    
                } label: {
                    Rectangle()
                    Text(changeText(i: 0))
                }
                Button {
                    
                } label: {
                    Rectangle()
                    Text(changeText(i: 1))
                }
                Button {
                    
                } label: {
                    Rectangle()
                    Text(changeText(i: 2))
                }
                Button {
                    
                } label: {
                    Rectangle()
                    Text(changeText(i: 3))
                }
            }
            .padding()
            
        }
        .onAppear() {
            randomAns = people.presidents.randomElement() ?? "err"
            randomButtonSelector = Int.random(in: 1...4)
        }
    }
    
    func changeText(i: Int) -> String {
        var text = ""
        if(randomButtonSelector == i+1) {
            text = randomAns
        } else {
            text = people.presidents.randomElement() ?? "err"
        }
        return text
    }
    
}

#Preview {
    PresidentView()
}
