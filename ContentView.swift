import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) var context
    @State var path: [Route] = []
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack {
                RoundedRectangle(cornerRadius: 20).foregroundStyle(.gray)
                    .opacity(0.5)
                    .overlay(Text("USH Tracker")
                        .font(.custom("Papyrus", size: 60, relativeTo: .largeTitle)))
                
                Button {
                    path.append(.presidents)
                } label: {
                    ZStack {
                        Image("georgeWashingtonTitle")
                            .resizable()
                            .blur(radius: 3)
                            .clipShape(Capsule())
                        Text("Presidents")
                            .font(.custom("Papyrus", size: 81))
                            .foregroundStyle(.yellow)
                    }
                }
                
                Button {
                    path.append(.consitution)
                } label: {
                    ZStack {
                        Image("consitutionTitle")
                            .resizable()
                            .clipShape(Capsule())
                            .blur(radius: 3)
                        Text("Consitution")
                            .font(.custom("Papyrus", size: 75))
                            .foregroundStyle(.black)
                    }
                }
                
                Button {
                    path.append(.stats)
                } label: {
                    ZStack {
                        Image(systemName: "chart.bar.fill")
                            .resizable()
                            .clipShape(Capsule())
                            .blur(radius: 3)
                        Text("Stats")
                            .font(.custom("Papyrus", size: 75))
                            .foregroundStyle(.black)
                    }
                }
                
            }
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
    
    func cases () {
        
    }
    
}

enum Route: Hashable {
    case menu
    case presidents
    case consitution
    case stats
    case congrats
}
