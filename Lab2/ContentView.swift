//
//  ContentView.swift
//  Lab2
//
//  Created by Carlos Eduardo Umaña Acevedo on 2/6/21.
//

import SwiftUI

struct Button : Hashable {
    let label: String
    let color: Color
    
    var isZero: Bool = false
}

let clear = Button(label: "AC", color: Color("calcActButton"))
let negative = Button(label: "+/-", color: Color("calcActButton"))
let percent = Button(label: "%", color: Color("calcActButton"))

let divide = Button(label: "÷", color: Color.orange)
let multiply = Button(label: "x", color: Color.orange)
let subtract = Button(label: "-", color: Color.orange)
let add = Button(label: "+", color: Color.orange)
let equal = Button(label: "=", color: Color.orange)

let seven = Button(label: "7", color: Color("calcNumButton"))
let eight = Button(label: "8", color: Color("calcNumButton"))
let nine = Button(label: "9", color: Color("calcNumButton"))

let four = Button(label: "4", color: Color("calcNumButton"))
let five = Button(label: "5", color:Color("calcNumButton"))
let six = Button(label: "6", color: Color("calcNumButton"))

let one = Button(label: "1", color: Color("calcNumButton"))
let two = Button(label: "2", color: Color("calcNumButton"))
let three = Button(label: "3", color: Color("calcNumButton"))

let zero = Button(label: "0", color: Color("calcNumButton"), isZero: true)
let point = Button(label: ".", color: Color("calcNumButton"))

struct ContentView: View {
        
    let buttons = [
        [clear, negative, percent, divide],
        [seven, eight, nine, multiply],
        [four, five, six,subtract],
        [one,two, three, add],
        [zero, point, equal]
    ]
    
    var body: some View {
        ZStack {
            Color("calcPanel").ignoresSafeArea()
            
            VStack(alignment: .trailing, spacing: 0.0) {
                
                Text("0")
                    .foregroundColor(.white)
                    .font(.system(size:50))
                    .padding(.all)
                
                ForEach(buttons, id: \.self) {row in
                    HStack(spacing: 0.0){
                        let index = buttons.firstIndex(of: row)
                        
                        if (index == 4) {
                            GeometryReader { geometry in
                                HStack(spacing: 0.0) {
                                    ForEach(row, id: \.self) { value in
                                        let width = geometry.size.width / (value.isZero ? 2 : 4)
                                        
                                        CardView(content: value, width: width)
                                    }
                                }
                            }
                        } else {
                            ForEach(row, id: \.self) { value in
                                CardView(content: value)
                            }
                        }
                    }
                }
            }
            
        }
    }
}

struct CardView: View {
    var content: Button
    var width: CGFloat = /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/
    
    var body: some View {
        Text(content.label)
            .frame(maxWidth: width, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .font(.system(size: 32))
            .foregroundColor(.white)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .background(content.color)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
