import SwiftUI

struct ContentView: View {
    @StateObject var vm = AppViewModel()
    @State private var step: Int = 0

    var body: some View {
        NavigationView {
            VStack {
                switch step {
                case 0:
                    WelcomeView(
                        next: { step = 1 },
                        viewHistory: { step = 5 }
                    )
                case 1:
                    Question1View(vm: vm, back: { step -= 1 }, next: { step += 1 })
                case 2:
                    Question2View(vm: vm, back: { step -= 1 }, next: { step += 1 })
                case 3:
                    Question3View(vm: vm, back: { step -= 1 }, next: { step += 1 })
                case 4:
                    ResultView(vm: vm, back: { step -= 1 })
                case 5:
                    HistoryView(back: { step = 0 })
                        .environmentObject(vm)
                default:
                    Text("Done")
                }
            }
            .navigationTitle("BrewMate")
        }
    }
}

