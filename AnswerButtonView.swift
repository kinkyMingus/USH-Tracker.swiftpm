//
//  SwiftUIView.swift
//  USH Tracker
//
//  Created by DAVID SHOW on 11/14/25.
//

import SwiftUI

struct AnswerButtonView: View {
    let text: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.blue)
                    .aspectRatio(2, contentMode: .fit)

                Text(text)
                    .foregroundColor(.white)
                    .font(.title2)
                    .minimumScaleFactor(0.5)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    //AnswerButtonView(text: .constant("hi"))
}
