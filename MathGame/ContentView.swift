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
    var body: some View {
        @State var level = 0
        @State var operation = "Addition"
        
        NavigationView{
            VStack {
                Text("Select Level")
                    .font(.system(size: 36, weight: .ultraLight, design: .default))
                
                Picker("Level", selection: $level) {
                    ForEach(1..<4) {
                        Text("\($0)")
                    }
                }.pickerStyle(.wheel)
                
                Text("Select Operation").font(.system(size: 36, weight: .ultraLight, design: .default))
                
                Picker("Operation", selection: $operation) {
                    Text("Addition")
                    Text("Subtraction")
                    Text("Multiplication")
                    Text("Division")
                }.pickerStyle(.wheel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
