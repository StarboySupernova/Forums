//
//  ColorBackground.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/19/22.
//
import Foundation
import SwiftUI

extension Color {
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
    static let darkStart = Color(red: 50/255, green: 60/255, blue: 65/255)
    static let darkEnd = Color(red: 25/255, green: 25/255, blue: 30/255)
    static let lightStart = Color(red: 60/255, green: 160/255, blue: 240/255)
    static let lightEnd = Color(red: 30/255, green: 80/255, blue: 120/255)
}

extension LinearGradient {
    init(colors: Color...){
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool //is it depressed or not
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(colors: Color.lightEnd, Color.lightStart))
                    .overlay(shape.stroke(LinearGradient(colors: Color.lightStart, Color.lightEnd), lineWidth: 4)) //bevel appears when button is pressed
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(colors: Color.darkStart, Color.darkEnd))
                    .overlay(shape.stroke(LinearGradient(colors: Color.black, Color.gray), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ColorfulButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .contentShape(Circle())
            .background(
                ColorfulBackground(isHighlighted: configuration.isPressed, shape: Circle())
            )
    }
}


