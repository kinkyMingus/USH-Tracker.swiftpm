//
//  SwiftUIView.swift
//  USH Tracker 2
//
//  Created by DAVID SHOW on 11/10/25.
//
import SwiftUI
import Charts
import SwiftData
struct StatView: View {
    @Environment(\.modelContext) var context
    @Query var stats: [Stats]
    @Query var stats2: [Stats2]
    @Binding var path: [Route]
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.gray)
                .opacity(0.5)
                .overlay(
                    Text("Stats")
                        .font(.title)
                )
            
            Text("Presidents")
            
            Chart(Array(stats.enumerated()), id: \.element) { index, item in
                BarMark(
                    x: .value("Attempt", index + 1),
                    y: .value("Average", item.pAvg)
                )
            }
            Text("Consitution")
            
            Chart(Array(stats2.enumerated()), id: \.element) { index, item in
                BarMark(
                    x: .value("Attempt", index + 1),
                    y: .value("Average", item.pAvg)
                )
            }
            
            Button("show stats") {
                print(stats2)
            }
            
            Button {
                for stat in stats {
                    context.delete(stat)
                }
                try? context.save()
            } label: {
                ZStack {
                    Capsule()
                        .foregroundStyle(.red)
                    Text("Clear Data")
                }
            }
        }
        .onAppear() {
            print(stats2)
        }
    }
}
#Preview {
    //StatView()
}

