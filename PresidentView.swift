//
//  SwiftUIView.swift
//  USH Tracker
//
//  Created by DAVID SHOW on 11/6/25.
//
import SwiftUI

struct PresidentView: View {
    @Environment(\.modelContext) var context
    @State var people = Data()
    @State var randomAns = ""
    @State var randomButtonSelector = 0
    @State var text: [String] = ["", "", "", ""]
    @State var check = ""
    @State var correct = 0
    @State var incorrect = 0
    @State var randomIndex = 0
    @State var setCongrats = false
    
    @Binding var path: [Route]
    
    var body: some View {
            VStack {

                Text("Who is this President?")
                    .font(.custom("Papyrus", size: 24))
                
                HStack {
                    Text("Right: \(String(correct))")
                        .font(.custom("Papyrus", size: 24))
                    Text("Wrong: \(String(incorrect))")
                        .font(.custom("Papyrus", size: 24))
                }

                Image(randomAns)
                    .resizable()
                    .scaledToFit()

                LazyVGrid( columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {

                    ForEach(0..<4) { i in
                        AnswerButtonView(text: text[i]) {
                            checkAns(selection: text[i])
                        }
                    }
                }
                .padding()
            }
        .navigationDestination(for: Route.self) { val in
            CongratsView(path: $path)
        }
        .onAppear {
            randomIndex = Int.random(in: 0..<people.presidents.count)
            randomAns = people.presidents[randomIndex]
            randomButtonSelector = Int.random(in: 1...4)
            changeText()
        }
        .onDisappear {
            let stats = Stats(pCorrect: correct, pIncorrect: incorrect)
            context.insert(stats)
            try? context.save()
            print(stats.pAvg)
        }
    }

    func changeText() {
        for i in 0...3 {
            if randomButtonSelector == i + 1 {
                text[i] = randomAns
            } else {
                text[i] = people.presidents.randomElement() ?? "err"
            }
        }
    }

    func checkAns(selection: String) {

        if people.mutablePresidents.count <= 1 {
            path.append(.congrats)
            setCongrats = true
            return
        }

        if randomAns == selection && people.mutablePresidents.count > 1 {
            check = "Correct!"
            correct += 1
            people.mutablePresidents.remove(at: randomIndex)
            randomIndex = Int.random(in: 0..<people.mutablePresidents.count)
            randomAns = people.mutablePresidents[randomIndex]
            randomButtonSelector = Int.random(in: 1...4)
            changeText()
            print(people.mutablePresidents)
        } else {
            check = "Incorrect"
            incorrect += 1
        }
    }

}
#Preview {
    //PresidentView()
}
