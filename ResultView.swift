import SwiftUI

struct ResultView: View {
    @ObservedObject var vm: AppViewModel
    var back: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Your recommended coffee:")
                .font(.headline)

            Button("Generate Recommendation") {
                vm.makeRecommendation()
            }
            .buttonStyle(.borderedProminent)
            
            if !vm.recommended.isEmpty {
                Text(vm.recommended)
                    .font(.largeTitle)
                    .bold()
                Text(vm.instructions)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }

            Button("Back", action: back)
                .padding(.top)
        }
        .padding()
        .navigationTitle("Result")
    }
}
