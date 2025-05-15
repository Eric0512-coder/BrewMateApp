import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var vm: AppViewModel
    var back: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Recommendation History")
                .font(.title2)
                .bold()

            if vm.history.isEmpty {
                Text("No recommendations yet.")
                    .foregroundColor(.secondary)
            } else {
                List(vm.history.reversed()) { record in
                    VStack(alignment: .leading) {
                        Text(record.result)
                            .font(.headline)
                        Text(record.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }

            Button("Back to Welcome", action: back)
                .padding(.top)
                .buttonStyle(.bordered)
        }
        .padding()
    }
}
