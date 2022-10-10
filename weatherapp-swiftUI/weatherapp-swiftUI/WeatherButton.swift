//
//  WeatherButton.swift
//  weatherapp-swiftUI
//
//  Created by Michael O'Dell on 10/10/22.
//

import Foundation
import SwiftUI

struct WeatherButtonView: View {
    var textColor: Color
    var backgroundColor: Color
    var title: String
    
    var body: some View {
            Text(title)
                .frame(width:280, height: 50)
                .foregroundColor(textColor)
                .background(backgroundColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        }
}
