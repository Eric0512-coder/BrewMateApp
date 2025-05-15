import SwiftUI

struct Question3View: View {
    @ObservedObject var vm: AppViewModel
    var back: () -> Void
    var next: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Do you want milk?")
            Button("Yes") {
                vm.likesMilk = true
            }
            Button("No") {
                vm.likesMilk = false
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
        .navigationTitle("Step 3")
    }
}
