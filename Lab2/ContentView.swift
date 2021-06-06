//
//  ContentView.swift
//  Lab2
//
//  Created by Carlos Eduardo Umaña Acevedo on 2/6/21.
//

import SwiftUI

struct Button : Hashable {
    var label: String
    var color: Color
}

let clear = Button(label: "AC", color: Color.gray)
let negative = Button(label: "+/-", color: Color.gray)
let percent = Button(label: "%", color: Color.gray)

let divide = Button(label: "÷", color: Color.orange)
let multiply = Button(label: "x", color: Color.orange)
let subtract = Button(label: "-", color: Color.orange)
let add = Button(label: "+", color: Color.orange)
let equal = Button(label: "=", color: Color.orange)

let seven = Button(label: "7", color: Color.blue)
let eight = Button(label: "8", color: Color.blue)
let nine = Button(label: "9", color: Color.blue)

let four = Button(label: "4", color: Color.blue)
let five = Button(label: "5", color: Color.blue)
let six = Button(label: "6", color: Color.blue)

let one = Button(label: "1", color: Color.blue)
let two = Button(label: "2", color: Color.blue)
let three = Button(label: "3", color: Color.blue)

let zero = Button(label: "0", color: Color.blue)
let point = Button(label: ".", color: Color.blue)

struct ContentView: View {
    
    let buttons = [
        [clear, negative, percent, divide],
        [seven, eight, nine, multiply],
        [four, five, six,subtract],
        [one,two, three, add],
        [zero, point, point, equal]
    ]
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .trailing) {
                
                VStack(alignment: .leading) { 
                    Text("0")
                        .foregroundColor(.white)
                        .font(.system(size:50))
                }
                .padding(.all)
          
                
                ForEach(buttons, id: \.self) {row in
                    HStack(spacing: 0.0){
                        ForEach(row, id: \.self) { value in
                            CardView(content: value)
                        }
                    }
                }
            }
            
        }
    }
}

struct CardView: View {
    var content: Button
    
    var body: some View {
        Text(content.label)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .font(.system(size: 32))
            .foregroundColor(.white)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .background(content.color)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
//            .previewLayout(.fixed(width: 812, height: 375))
//            .environment(\.horizontalSizeClass, .compact)
//            .environment(\.verticalSizeClass, .compact)
    }
}
