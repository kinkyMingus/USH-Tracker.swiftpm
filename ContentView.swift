import SwiftUI

struct ContentView: View {
    @State var tog = true
    var body: some View {

        NavigationStack {
            VStack {
                RoundedRectangle(cornerRadius: 20).foregroundStyle(.gray)
                    .opacity(0.5)
                    .overlay(Text("USH Tracker")
                        .font(.title))
                
                Spacer()
                
                NavigationLink {
                    MCQView()
                } label: {
                    ZStack {
                        Image("georgeWashington")
                            .resizable()
                            .blur(radius: 5)
                            .clipShape(Capsule())
                        Text("Presidents")
                            .font(.custom("Papyrus", size: 81))
                            .foregroundStyle(.yellow)
                    }
                }
                
                NavigationLink {
                    MCQView()
                } label: {
                    ZStack {
                        Image("consitutionTitle")
                            .resizable()
                            .clipShape(Capsule())
                            .blur(radius: 5)
                        Text("Consitution")
                            .font(.custom("Papyrus", size: 75))
                            .foregroundStyle(.black)
                    }
                }
                
            }
        }
    }
}
