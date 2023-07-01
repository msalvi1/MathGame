//
//  ContentView.swift
//  LearningXCodeSwift
//
//  Created by Megha Salvi on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Color.pink.opacity(0.19)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack {
                        HStack {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.pink)
                                .padding()
                            Image(systemName: "minus")
                                .resizable()
                                .frame(width: 100, height: 10, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.pink)
                                .padding()
                        }
                        
                        Text("Math Game")
                            .font(.system(size: 48, weight: .ultraLight, design: .default))
                            .foregroundColor(Color.pink.opacity(2))
                        
                        HStack {
                            Image(systemName: "divide")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.pink)
                                .padding()
                            Image(systemName: "multiply")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.pink)
                                .padding()
                        }
                        NavigationLink(
                            destination: settingsPage(),
                            label: {
                                nextButton(color:.pink)})
                    }
                    )
        }
    }
}

struct nextButton: View {
    let color: Color
    
    var body: some View {
        Text("Next")
            .frame(width: 200, height: 50, alignment: .center)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct settingsPage: View {
    
    @State private var selectedLevel = 0
    @State private var selectedOperation = 0
    
    let levels = [1, 2, 3]
    let operations = ["Addition", "Subtraction", "Multiplication", "Division"]
    
    var body: some View {
        VStack {
            
            Text("Select Level")
                .font(.system(size: 36, weight: .ultraLight, design: .default))
            
            Picker (selection: $selectedLevel, label: Text("Level")) {
                ForEach(1..<4) {
                    Text("\($0)")
                }
            }.pickerStyle(.wheel)
            
            Text("Select Operation").font(.system(size: 36, weight: .ultraLight, design: .default))
            
            Picker (selection: $selectedOperation, label: Text("Operation")) {
                ForEach(0 ..< 4) {
                    Text(operations[$0])
                }
            }.pickerStyle(.wheel)
            
            let difficulty = levels[selectedLevel], operation = operations[selectedOperation]
            @State var destinationView: AnyView?
            
            switch (difficulty, operation) {
            case (1, "Addition"):
                NavigationLink(destination: EasyAddition(), label: {
                    nextButton(color: .pink)
                })
            case (2, "Addition"):
                NavigationLink(destination: MediumAddition(), label: {
                    nextButton(color: .green)
                })
            case (3, "Addition"):
                NavigationLink(destination: HardAddition(), label: {
                    nextButton(color: .blue)
                })
            default:
                NavigationLink(destination: EmptyView(), label: {
                    nextButton(color: .red)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        settingsPage()
    }
}
