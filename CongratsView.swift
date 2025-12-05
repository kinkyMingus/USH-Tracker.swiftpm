//
//  SwiftUIView.swift
//  USH Tracker
//
//  Created by DAVID SHOW on 11/11/25.
//

import SwiftUI

struct CongratsView: View {
    @Binding var path: [Route]
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Yo GG!")
                .font(.custom("Papyrus", size: 81))
            
            Button {
                path = []
            } label: {
                ZStack {
                    Capsule()
                        .foregroundStyle(.blue)
                        .frame(maxHeight: 150)
                    Text("Back")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(for: Route.self) { val in
            switch val {
            case .presidents:
                PresidentView(path: $path)
            case .consitution:
                ConstView(path: $path)
            case .stats:
                StatView(path: $path)
            case .congrats:
                CongratsView(path: $path)
            default:
                ContentView()
            }
        }
    }
}

#Preview {
    CongratsView(path: .constant([Route.congrats]))
}
