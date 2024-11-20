import SwiftUI

struct ContentView: View {
    @State private var allColors: [(name: String, color: Color)] = [
        ("Red", .red), ("Green", .green), ("Blue", .blue), ("Yellow", .yellow),
        ("Purple", .purple), ("Orange", .orange), ("Pink", .pink), ("Cyan", .cyan),
        ("Gray", .gray), ("Brown", .brown), ("Mint", .mint), ("Teal", .teal),
        ("Indigo", .indigo), ("Lavender", Color(hue: 0.75, saturation: 0.3, brightness: 0.8)),
        ("Beige", Color(hue: 0.1, saturation: 0.2, brightness: 0.9)),
        ("Maroon", Color(hue: 0, saturation: 0.8, brightness: 0.5)),
        ("Navy", Color(hue: 0.67, saturation: 1, brightness: 0.3)),
        ("Olive", Color(hue: 0.17, saturation: 0.6, brightness: 0.5)),
        ("Crimson", Color(hue: 0, saturation: 0.9, brightness: 0.8)),
        ("Chartreuse", Color(hue: 0.25, saturation: 1, brightness: 0.8)),
        ("Turquoise", Color(hue: 0.5, saturation: 0.7, brightness: 0.9)),
        ("Amethyst", Color(hue: 0.83, saturation: 0.5, brightness: 0.7)),
        ("Coral", Color(hue: 0.03, saturation: 0.8, brightness: 0.9)),
        ("Peach", Color(hue: 0.05, saturation: 0.6, brightness: 1)),
        ("Seafoam", Color(hue: 0.45, saturation: 0.3, brightness: 0.9)),
        ("Saffron", Color(hue: 0.1, saturation: 0.9, brightness: 0.9)),
        ("Periwinkle", Color(hue: 0.66, saturation: 0.4, brightness: 0.9)),
        ("Magenta", Color(hue: 0.9, saturation: 1, brightness: 1)),
        ("Emerald", Color(hue: 0.33, saturation: 1, brightness: 0.8)),
        ("Ruby", Color(hue: 0, saturation: 1, brightness: 0.7)),
        ("Fuchsia", Color(hue: 0.91, saturation: 1, brightness: 0.9)),
        ("Ochre", Color(hue: 0.08, saturation: 0.8, brightness: 0.6)),
        ("Aqua", Color(hue: 0.5, saturation: 1, brightness: 1)),
        ("Bronze", Color(hue: 0.1, saturation: 0.8, brightness: 0.5)),
        ("Vermilion", Color(hue: 0.02, saturation: 1, brightness: 0.8)),
        ("Charcoal", Color(hue: 0, saturation: 0, brightness: 0.2)),
        ("Ivory", Color(hue: 0.1, saturation: 0.05, brightness: 1)),
        ("Gold", Color(hue: 0.15, saturation: 1, brightness: 0.8)),
        ("Silver", Color(hue: 0.67, saturation: 0.03, brightness: 0.9))
    ]
    @State private var currentColor: String = ""
    @State private var displayedColors: [(name: String, color: Color)] = []
    @State private var score: Int = 0
    @State private var timeRemaining: Int = 10
    @State private var gameActive: Bool = true
    @State private var timer: Timer?
    
    var body: some View {
        VStack(spacing: 20) {
            if gameActive {
                Text("Match the Color!")
                    .font(.largeTitle)
                    .bold()
                
                Text(currentColor)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                Text("Time Left: \(timeRemaining)")
                    .font(.headline)
                
                Text("Score: \(score)")
                    .font(.headline)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(displayedColors, id: \.name) { colorItem in
                        Button(action: {
                            self.checkAnswer(selectedColor: colorItem.name)
                        }) {
                            Circle()
                                .fill(colorItem.color)
                                .frame(width: 70, height: 70)
                        }
                    }
                }
            } else {
                Text("Game Over!")
                    .font(.largeTitle)
                    .bold()
                
                Text("Final Score: \(score)")
                    .font(.title)
                
                Button(action: restartGame) {
                    Text("Play Again")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .onAppear(perform: startGame)
    }
    
    func startGame() {
        resetTimer()
        pickRandomColors()
        gameActive = true
    }
    
    func pickRandomColors() {
        guard let correctColor = allColors.randomElement() else { return }
        currentColor = correctColor.name
        
        var selectedColors = [correctColor]
        while selectedColors.count < 4 {
            if let randomColor = allColors.randomElement(),
               !selectedColors.contains(where: { $0.name == randomColor.name }) {
                selectedColors.append(randomColor)
            }
        }
        displayedColors = selectedColors.shuffled()
    }
    
    func checkAnswer(selectedColor: String) {
        if selectedColor == currentColor {
            score += 1
            pickRandomColors()
            resetTimer()
        } else {
            endGame()
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timeRemaining = 10
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            timeRemaining -= 1
            if timeRemaining <= 0 {
                endGame()
            }
        }
    }
    
    func endGame() {
        timer?.invalidate()
        gameActive = false
    }
    
    func restartGame() {
        score = 0
        startGame()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

