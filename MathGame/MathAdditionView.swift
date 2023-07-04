//
//  MathAdditionView.swift
//  MathGame
//
//  Created by Megha Salvi on 6/23/23.
//

import SwiftUI

struct MathAdditionView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MathAdditionView_Previews: PreviewProvider {
    static var previews: some View {
        MathAdditionView()
        HardAddition()
        MediumAddition()
        EasyAddition()
    }
}

struct HardAddition: View {
    var game:Game = Game(difficulty: 3, operation: "Addition")
    
    @State private var value1: String = ""
    @State private var value2: String = ""
    @State private var value3: String = ""
    @State private var value4: String = ""
    @State private var value5: String = ""
    @State private var value6: String = ""
    
    var body: some View {
        let firstNumDigits = game.getDigits()[0]
        let secondNumDigits = game.getDigits()[1]
        let correctAnswerDigits = game.getAnswerDigits()
        let ones = correctAnswerDigits[3]
        let tens = correctAnswerDigits[2]
        let hundreds = correctAnswerDigits[1]
        let thousands = correctAnswerDigits[0]
        let correctAnswer = ones + (10 * tens) + (100 * hundreds) + (1000 * thousands)
        let oneRemainder = (firstNumDigits[2] + secondNumDigits[2]) / 10
        let tenRemainder = (oneRemainder + firstNumDigits[1] + secondNumDigits[1]) / 10
        
        
        VStack {
            
            HStack {
                
                NavigationLink(
                    destination: ContentView().navigationBarBackButtonHidden(true),
                    label: {
                        Text("Home")
                            .frame(width: 110, height: 50, alignment: .center)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                        
                    }).position(x: 50, y: 20)
                
                NavigationLink(
                    destination: settingsPage().navigationBarBackButtonHidden(true),
                    label: {
                        Text("Settings")
                            .frame(width: 110, height: 50, alignment: .center)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                        
                    }).position(x: 130, y: 20)
            }

            
            VStack {
                HStack() {
                    //generate new problem button
                    NavigationLink(
                        destination: HardAddition(),
                        label: {
                            Text("Generate New Problem")
                                .frame(width: 200, height: 50, alignment: .center)
                                .background(.pink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    
                }
                Spacer(minLength: 160)
                
                HStack {
                    Spacer(minLength: 160)

                    TextField("0", text: $value1)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                    
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value1, correctValue:tenRemainder))
                        
                    
                    TextField("0", text: $value2)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                    
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value2, correctValue:oneRemainder))
                        
                    Spacer(minLength: 140)
                }
                .padding(.bottom, -20)
                
                VStack (alignment: .leading, spacing: 5) {
         
                    HStack {
                        Spacer(minLength: 160)
                        ForEach(firstNumDigits, id: \.self) { digit in
                            Text("\(digit) ")
                                .font(.system(size: 55, weight: .ultraLight, design: .default))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        Spacer(minLength: 90)
                    }
                    HStack {
                        Spacer()
                        Text("+")
                            .font(.system(size: 55, weight: .ultraLight, design: .default))
                            .multilineTextAlignment(.center)
                        Spacer(minLength: 270)
                    }
                    .padding(.top, -30)
                    .padding(.bottom, -30)

                    HStack {
                        Spacer(minLength: 160)
                        ForEach(secondNumDigits, id: \.self) { digit in
                            Text("\(digit) ")
                                .font(.system(size: 55, weight: .ultraLight, design: .default))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        Spacer(minLength: 90)
                    }
                }
                
                Divider()
                    .background(Color.black)
                    .frame(height: 4)
                    .padding(.horizontal)
                    .frame(width: 250)
                    .padding(.top, -25)
                
                HStack {
                    Spacer(minLength: 120)
                    
                    TextField("0", text: $value3)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value3, correctValue:thousands))
                        
                    
                    TextField("0", text: $value4)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value4, correctValue:hundreds))
                        
                    
                    TextField("0", text: $value5)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value5, correctValue:tens))
                        
                    

                    TextField("0", text: $value6)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                        
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value6, correctValue:ones))
                        
                    
                    Spacer(minLength: 95)
                }
                .padding(.top, -20)
                
                ZStack {
                    if game.userAnswerCorrect(onesString:value6, tensString:value5, hundredsString:value4, thousandsString:value3, correctAnswer: correctAnswer, onesRemainderString:value2, tensRemainderString:value1, correctRemainderOne:oneRemainder, correctRemainderTen:tenRemainder) {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.green)
                            .frame(width: 250, height: 200)
                            .overlay(
                                VStack {
                                    Text("Correct!").font(.largeTitle)
                                    
                                    HStack() {
                                        //next button
                                        NavigationLink(
                                            destination: HardAddition().navigationBarBackButtonHidden(true),
                                            label: {
                                                Text("Next Problem")
                                                    .frame(width: 200, height: 50, alignment: .center)
                                                    .background(.pink)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(10)
                                            })
                                    }
                        })
                            .position(x: 200, y: 110)
                    }
                }
            }
            Spacer(minLength: 225)
        }
    }
}

struct MediumAddition: View {
    var game:Game = Game(difficulty: 2, operation: "Addition")
    
    @State private var value1: String = ""
    @State private var value2: String = ""
    @State private var value3: String = ""
    @State private var value4: String = ""
    
    var body: some View {
        let firstNumDigits = game.getDigits()[0]
        let secondNumDigits = game.getDigits()[1]
        let correctAnswerDigits = game.getAnswerDigits()
        let ones = correctAnswerDigits[2]
        let tens = correctAnswerDigits[1]
        let hundreds = correctAnswerDigits[0]
        let correctAnswer = ones + (10 * tens) + (100 * hundreds)
        let oneRemainder = (firstNumDigits[1] + secondNumDigits[1]) / 10

        VStack {
            HStack {
                
                NavigationLink(
                    destination: ContentView().navigationBarBackButtonHidden(true),
                    label: {
                        Text("Home")
                            .frame(width: 110, height: 50, alignment: .center)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                        
                    }).position(x: 50, y: 20)
                
                NavigationLink(
                    destination: settingsPage().navigationBarBackButtonHidden(true),
                    label: {
                        Text("Settings")
                            .frame(width: 110, height: 50, alignment: .center)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                        
                    }).position(x: 130, y: 20)
            }
            VStack() {
                HStack() {
                    //generate new problem button
                    NavigationLink(
                        destination: MediumAddition(),
                        label: {
                            Text("Generate New Problem")
                                .frame(width: 200, height: 50, alignment: .center)
                                .background(.pink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    
                }

                HStack {
                    Spacer(minLength: 160)
                    
                    TextField("0", text: $value1)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value1, correctValue:oneRemainder))
                    
                    Spacer(minLength: 175)
                }
                .padding(.bottom, -20)
                
                VStack (alignment: .leading, spacing: 5) {
         
                    HStack {
                        Spacer(minLength: 160)
                        ForEach(firstNumDigits, id: \.self) { digit in
                            Text("\(digit) ")
                                .font(.system(size: 55, weight: .ultraLight, design: .default))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        Spacer(minLength: 90)
                    }
                    HStack {
                        Spacer()
                        Text("+")
                            .font(.system(size: 55, weight: .ultraLight, design: .default))
                            .multilineTextAlignment(.center)
                        Spacer(minLength: 270)
                    }
                    .padding(.top, -30)
                    .padding(.bottom, -30)

                    HStack {
                        Spacer(minLength: 160)
                        ForEach(secondNumDigits, id: \.self) { digit in
                            Text("\(digit) ")
                                .font(.system(size: 55, weight: .ultraLight, design: .default))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        Spacer(minLength: 90)
                    }
                }
                
                Divider()
                    .background(Color.black)
                    .frame(height: 4)
                    .padding(.horizontal)
                    .frame(width: 250)
                    .padding(.top, -25)
                
                HStack {
                    Spacer(minLength: 105)
                    
                    TextField("0", text: $value2)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value2, correctValue:hundreds))
                    
                    
                    TextField("0", text: $value3)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value3, correctValue:tens))
                    
                    TextField("0", text: $value4)
                        .font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .foregroundColor(game.getTextColor(value:value4, correctValue:ones))
                    
                    Spacer(minLength: 115)
                }
                .padding(.top, -20)
                
                ZStack {
                    if game.userAnswerCorrect(onesString:value4, tensString:value3, hundredsString:value2, thousandsString:"0", correctAnswer: correctAnswer, onesRemainderString:value1, tensRemainderString:"0", correctRemainderOne:oneRemainder, correctRemainderTen:0) {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.green)
                            .frame(width: 250, height: 200)
                            .overlay(
                                VStack {
                                    Text("Correct!").font(.largeTitle)
                                    
                                    HStack() {
                                        //next button
                                        NavigationLink(
                                            destination: MediumAddition(),
                                            label: {
                                                Text("Next Problem")
                                                    .frame(width: 200, height: 50, alignment: .center)
                                                    .background(.pink)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(10)
                                            })
                                        
                                    }
                                }
                            )
                    }
                }
                
            }
        }
    }
}

struct EasyAddition: View {
    var game:Game = Game(difficulty: 1, operation: "Addition")
    @State private var value1: String = ""
    @State private var value2: String = ""
    
    var body: some View {
        let firstNumDigits = game.getDigits()[0]
        let secondNumDigits = game.getDigits()[1]
        let correctAnswerDigits = game.getAnswerDigits()
        let ones = correctAnswerDigits[1]
        let tens = correctAnswerDigits[0]
        let correctAnswer = ones + (10 * tens)

        VStack {
            HStack() {
                //generate new problem button
                NavigationLink(
                    destination: EasyAddition(),
                    label: {
                        Text("Generate New Problem")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                
            }
            
            VStack (alignment: .leading, spacing: 5) {
     
                HStack {
                    Spacer(minLength: 225)
                    ForEach(firstNumDigits, id: \.self) { digit in
                        Text("\(digit) ")
                            .font(.system(size: 55, weight: .ultraLight, design: .default))
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("+").font(.system(size: 55, weight: .ultraLight, design: .default))
                        .multilineTextAlignment(.center)
                    Spacer(minLength: 270)
                }
                .padding(.top, -30)
                .padding(.bottom, -30)

                HStack {
                    Spacer(minLength: 225)
                    ForEach(secondNumDigits, id: \.self) { digit in
                        Text("\(digit) ")
                            .font(.system(size: 55, weight: .ultraLight, design: .default))
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    Spacer()
                }
            }
            
            Divider()
                .background(Color.black)
                .frame(height: 4)
                .padding(.horizontal)
                .frame(width: 250)
                .padding(.top, -25)
            
            HStack {
                Spacer(minLength: 160)
                TextField("0", text: $value1)
                    .font(.system(size: 55, weight: .ultraLight, design: .default))
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(borderColor, lineWidth: 1))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .foregroundColor(game.getTextColor(value:value1, correctValue:tens))
                
                 
                TextField("0", text: $value2)
                    .font(.system(size: 55, weight: .ultraLight, design: .default))
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(borderColor, lineWidth: 1))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .foregroundColor(game.getTextColor(value:value2, correctValue:ones))
                
                
                
                
                Spacer(minLength: 110)
            }
            .padding(.top, -20)
            
            ZStack {
                if game.userAnswerCorrect(onesString:value2, tensString:value1, hundredsString:"0", thousandsString:"0", correctAnswer: correctAnswer, onesRemainderString:"0", tensRemainderString:"0", correctRemainderOne: 0, correctRemainderTen: 0) {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.green)
                        .frame(width: 250, height: 200)
                        .overlay(
                            VStack {
                                Text("Correct!").font(.largeTitle)
                                
                                HStack() {
                                    //next button
                                    NavigationLink(
                                        destination: EasyAddition(),
                                        label: {
                                            Text("Next Problem")
                                                .frame(width: 110, height: 50, alignment: .center)
                                                .background(.pink)
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                        })
                                    
                                    //home button
                                    NavigationLink(
                                        destination: ContentView().navigationBarBackButtonHidden(true),
                                        label: {
                                            Text("Home")
                                                .frame(width: 200, height: 50, alignment: .center)
                                                .background(.blue)
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                            
                                        })
                                }
                            }
                        )
                }
            }
        }
    }
    
    @State private var borderColor = Color.gray
}
