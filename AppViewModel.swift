import Foundation

struct BrewRecord: Identifiable {
    var id = UUID()
    var result: String
    var date: Date
}

class AppViewModel: ObservableObject {
    @Published var isCold = true
    @Published var flavor = ""
    @Published var likesMilk = true
    @Published var recommended = ""
    @Published var instructions = ""
    @Published var history: [BrewRecord] = []

    func makeRecommendation() {
        var rec = ""

        if isCold {
            if flavor == "Sweet" && likesMilk {
                rec = "Mocha"
            } else if flavor == "Bitter" && !likesMilk {
                rec = "Cold Brew"
            } else if likesMilk {
                rec = "Iced Latte"
            } else {
                rec = "Affogato Americano"
            }
        } else {
            if flavor == "Sweet" && likesMilk {
                rec = "Caramel Macchiato"
            } else if flavor == "Bitter" && !likesMilk {
                rec = "Americano"
            } else if likesMilk {
                rec = "Latte"
            } else {
                rec = "Espresso"
            }
        }

        let instructionMap: [String: String] = [
            "Latte": """
            1. Steam milk until hot and frothy.
            2. Brew a shot of espresso.
            3. Pour milk over espresso.
            4. Serve hot.
            """,
            "Americano": """
            1. Brew a shot of espresso.
            2. Add hot water (ratio 1:2).
            3. Stir and enjoy.
            """,
            "Cappuccino": """
            1. Brew a shot of espresso.
            2. Steam and froth milk.
            3. Combine: 1/3 espresso, 1/3 steamed milk, 1/3 foam.
            """,
            "Cold Brew": """
            1. Coarsely grind coffee beans.
            2. Steep in cold water for 12–24 hours.
            3. Strain and serve over ice.
            """,
            "Mocha": """
            1. Mix chocolate syrup with espresso.
            2. Steam and froth milk.
            3. Pour milk over espresso.
            4. Optionally top with whipped cream.
            """,
            "Caramel Macchiato": """
            1. Brew espresso and steam milk.
            2. Pour milk into cup, then espresso.
            3. Drizzle caramel sauce on top.
            """,
            "Dirty": """
            1. Pour cold milk into a small glass.
            2. Brew hot espresso over it.
            3. Serve immediately.
            """,
            "Espresso": """
            1. Grind beans finely.
            2. Brew a single or double shot.
            3. Serve immediately without milk.
            """,
            "Iced Latte": """
            1. Brew a shot of espresso.
            2. Fill glass with ice and cold milk.
            3. Pour espresso over milk and stir.
            """,
            "Affogato Americano": """
            1. Brew espresso.
            2. Pour over vanilla ice cream or iced Americano.
            3. Optional: add a bit of sugar.
            """
        ]

        recommended = rec
        instructions = instructionMap[rec] ?? "No instructions available."
        history.append(BrewRecord(result: rec, date: Date()))
    }
}

