import SwiftUI

struct Question2View: View {
    @ObservedObject var vm: AppViewModel
    var back: () -> Void
    var next: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("What flavor do you prefer?")
            Button("Sweet") { vm.flavor = "sweet" }
            Button("Bitter") { vm.flavor = "bitter" }
            Button("Balanced") { vm.flavor = "balanced" }

            HStack {
                Button("Back", action: back)
                Spacer()
                Button("Next", action: next)
                    .buttonStyle(.borderedProminent)
            }
            .padding(.top)
        }
        .padding()
        .navigationTitle("Step 2")
    }
}
