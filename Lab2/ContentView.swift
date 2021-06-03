//
//  ContentView.swift
//  Lab2
//
//  Created by Carlos Eduardo Umaña Acevedo on 2/6/21.
//

import SwiftUI

struct ContentView: View {
    let buttons = [
        ["7", "8", "9", "%"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", ".", "="]
    ]
    
    var body: some View {
        VStack {
            ForEach(buttons, id: \.self) {row in
                HStack{
                    ForEach(row, id: \.self) { value in
                        CardView(content: value)
                    }
                }
            }
        }
    }
}

struct CardView: View {
    var content: String
    
    var body: some View {
        Text(content).accentColor(.white)
            .font(.system(size: 32))
            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
