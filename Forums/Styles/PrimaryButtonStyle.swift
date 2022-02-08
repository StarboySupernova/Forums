//
//  PrimaryButtonStyle.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, maxHeight: 44)
                .background(Color(#colorLiteral(red: 0.184266597, green: 0.8003296256, blue: 0.4435204864, alpha: 1)).opacity(
                    configuration.isPressed ? 0.5: 1
                ))
            .cornerRadius(10)
    }
}

