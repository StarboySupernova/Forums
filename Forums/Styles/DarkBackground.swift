//
//  DarkBackground.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/19/22.
//

import Foundation
import SwiftUI

struct DarkBackground<S: Shape>: View { //will change the struct and filename, it is not accurate
    var isHighlighted: Bool //is it depressed or not
    var shape: S
    
    
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(colors:Color("lightEnd"), Color("lightStart")))
                    .overlay(shape.stroke(LinearGradient(colors: Color("darkEnd"), Color("darkStart")), lineWidth: 4)) //bevel appears when button is pressed
                    .shadow(color: Color("darkStart"), radius: 10, x: 5, y: 5)
                    .shadow(color: Color("darkEnd"), radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(colors: Color("darkEnd"), Color("darkStart")))
                    .overlay(shape.stroke(Color("lightStart"), lineWidth: 4))
                    .shadow(color: Color("darkStart"), radius: 10, x: -10, y: -10)
                    .shadow(color: Color("darkEnd"), radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .contentShape(Capsule())
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: Capsule())
            )
    }
}


                          

