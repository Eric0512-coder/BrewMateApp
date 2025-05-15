import SwiftUI

struct Question1View: View {
    @ObservedObject var vm: AppViewModel
    var back: () -> Void
    var next: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Do you prefer hot or cold coffee?")
            Button("Cold") {
                vm.isCold = true
            }
            Button("Hot") {
                vm.isCold = false
            }

            HStack {
                Button("Back", action: back)
                Spacer()
                Button("Next", action: next)
                    .buttonStyle(.borderedProminent)
            }
            .padding(.top)
        }
        .padding()
        .navigationTitle("Step 1")
    }
}
