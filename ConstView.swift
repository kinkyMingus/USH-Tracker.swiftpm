//
//  SwiftUIView.swift
//  USH Tracker
//
//  Created by DAVID SHOW on 11/7/25.
//

import SwiftUI

struct ConstView: View {
    @Environment(\.modelContext) var context
    @State var const = Data()
    @State var randomKey = ""
    @State var randomVal = ""
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

            Text("What amendment does this belong to?")
                .font(.custom("Papyrus", size: 24))
                .multilineTextAlignment(.center)

            Spacer()

            Text(randomVal)
                .font(.custom("Times New Roman", size: 24))
                .multilineTextAlignment(.center)

            Spacer()

            HStack {
                Text("Right: \(String(correct))")
                    .font(.custom("Papyrus", size: 24))
                Text("Wrong: \(String(incorrect))")
                    .font(.custom("Papyrus", size: 24))
            }

            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                spacing: 8
            ) {

                ForEach(0..<4) { i in
                    AnswerButtonView(text: text[i]) {
                        checkAns(selection: text[i])
                    }
                }
            }

        }

        .navigationDestination(for: Int.self) { val in
            CongratsView(path: $path)
        }
        .onAppear {
            if let pair = const.const.randomElement() {
                randomKey = pair.key
                randomVal = pair.value
            }
            randomButtonSelector = Int.random(in: 1...4)
            changeText()
        }
        .onDisappear() {
            do {
                let stats2 = Stats2(pCorrect: correct, pIncorrect: incorrect)
                context.insert(stats2)
                try context.save()
                print("sucessfully saved")
            } catch {
                print("didnt save")
            }
        }
    }

    func changeText() {

        for i in 0...3 {
            if randomButtonSelector == i + 1 {
                text[i] = randomKey
            } else {
                if let pair = const.const.randomElement() {
                    text[i] = pair.key
                }
            }
        }
    }

    func checkAns(selection: String) {

        if const.mutableConst.count <= 1 {
            path.append(.congrats)
            setCongrats = true
            return
        }

        if randomKey == selection {
            check = "Correct!"
            correct += 1
            const.mutableConst.removeValue(forKey: randomKey)
            if let pair = const.mutableConst.randomElement() {
                randomKey = pair.key
                randomVal = pair.value
            }
            randomButtonSelector = Int.random(in: 1...4)
            changeText()
        } else {
            check = "Incorrect"
            incorrect += 1
        }
    }

}

#Preview {
    //ConstView()
}
