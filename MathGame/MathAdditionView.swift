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
        let oneRemainder = (firstNumDigits[2] + secondNumDigits[2]) / 10
        let tenRemainder = (oneRemainder + firstNumDigits[1] + secondNumDigits[1]) / 10
        
        
        VStack {
            
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
                    
                
                TextField("0", text: $value2)
                    .font(.system(size: 55, weight: .ultraLight, design: .default))
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 1))
                
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .foregroundColor(game.getTextColor(value:value2, correctValue:tenRemainder))
                    
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
        }
    }
}

struct MediumAddition: View {
    var game:Game = Game(difficulty: 2, operation: "Addition")
    
    var body: some View {
        let firstNumDigits = game.getDigits()[0]
        let secondNumDigits = game.getDigits()[1]

        VStack {
            
            HStack {
                Spacer(minLength: 160)
                
                TextField("0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 55, weight: .ultraLight, design: .default))
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 1))
                
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
                
                TextField("0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 55, weight: .ultraLight, design: .default))
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 1))
                
                TextField("0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 55, weight: .ultraLight, design: .default))
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 1))
                
                TextField("0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 55, weight: .ultraLight, design: .default))
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 1))
                
                Spacer(minLength: 115)
            }
            .padding(.top, -20)
        }
    }
}

struct EasyAddition: View {
    var game:Game = Game(difficulty: 1, operation: "Addition")
    @State private var onesPlaceDigit:String = ""
    @State private var tensPlaceDigit:String = ""
    
    var body: some View {
        let firstNumDigits = game.getDigits()[0]
        let secondNumDigits = game.getDigits()[1]

        VStack {
            
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
                TextField("0", text: self.$tensPlaceDigit)
                    .font(.system(size: 55, weight: .ultraLight, design: .default))
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(borderColor, lineWidth: 1))
                
                 
                
                
                
                TextField("0", text: self.$onesPlaceDigit)
                    .font(.system(size: 55, weight: .ultraLight, design: .default))
                    .multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(borderColor, lineWidth: 1))
                
                
                
                
                Spacer(minLength: 110)
            }
            .padding(.top, -20)
        }
    }
    
    @State private var borderColor = Color.gray
}

struct WrongTextBox: View {
    @State var input:String
    
    var body: some View {
        Text(input).font(.system(size: 55, weight: .ultraLight, design: .default))
            .border(Color.red)
    }
}

struct MathOperationsView_Previews: PreviewProvider {
    static var previews: some View {
        MathAdditionView()
        HardAddition()
        MediumAddition()
        EasyAddition()
            
    }
}
