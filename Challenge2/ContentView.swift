//
//  ContentView.swift
//  Challenge2
//
//  Created by Sabesh Bharathi on 26/06/20.
//  Copyright © 2020 Sabesh Bharathi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let items = ["Rock", "Paper", "Scissors"]
    let outcomes = ["Win", "Lose"]
    @State private var score = 0
    @State private var turn = 0
    @State private var cpuChoice = 0
    @State private var outcome = 0
    @State private var showingAlert = false
    @State private var message = ""
    
    var body: some View {
        VStack {
            if turn < 10 {
                Spacer()
                Spacer()
                VStack(spacing: 25) {
                    Text("CPU Chooses :")
                    
                    Text("\(items[cpuChoice])")
                    .foregroundColor(.blue)
                    .bold()
                    
                    Text("What would you choose to :")

                    Text("\(outcomes[outcome])")
                        .foregroundColor(.red)
                        .bold()
                        
                }
                    .font(.title)
                    .multilineTextAlignment(.center)
                    
                .padding()
                Spacer()
                VStack(spacing: 30) {
                    Button("Rock") {
                        switch self.outcome {
                        case 0:
                            if self.cpuChoice == 2 {
                                self.message = "You win! 🥳"
                                self.score += 1
                            } else {
                                self.message = "You don't win 😔"
                            }
                            break
                        case 1:
                            if self.cpuChoice == 1 {
                                self.message = "You lose! 🥳"
                                self.score += 1
                            } else {
                                self.message = "You don't win 😔"
                            }
                            break
                        default:
                            break
                        }
                        self.showingAlert = true
                    }
                    Button("Paper") {
                        switch self.outcome {
                        case 0:
                            if self.cpuChoice == 0 {
                                self.message = "You win! 🥳"
                                self.score += 1
                            } else {
                                self.message = "You don't win 😔"
                            }
                            break
                        case 1:
                            if self.cpuChoice == 2 {
                                self.message = "You lose! 🥳"
                                self.score += 1
                            } else {
                                self.message = "You don't win 😔"
                            }
                            break
                        default:
                            break
                        }
                        self.showingAlert = true
                    }
                    Button("Scissors") {
                        switch self.outcome {
                        case 0:
                            if self.cpuChoice == 1 {
                                self.message = "You win! 🥳"
                                self.score += 1
                            } else {
                                self.message = "You don't win 😔"
                            }
                            break
                        case 1:
                            if self.cpuChoice == 0 {
                                self.message = "You lose! 🥳"
                                self.score += 1
                            } else {
                                self.message = "You don't win 😔"
                            }
                            break
                        default:
                            break
                        }
                        self.showingAlert = true
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Note"), message: Text(self.message), dismissButton: .default(Text("Next Turn")) {
                            self.newTurn()
                            })
                    }
                }
                Spacer()
                Spacer()
                HStack {
                    Text("Number of turns : \(turn)")
                    Text("Score : \(score)")
                }
                Spacer()
            } else {
                Spacer()
                Text("Game Over")
                Text("Final Score : \(score)")
                Spacer()
            }
            
        }
    }
    
    func newTurn() {
        cpuChoice = Int.random(in: 0...2)
        outcome = Int.random(in: 0...1)
        turn += 1
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
