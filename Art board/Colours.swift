//
//  Colours.swift
//  AimList
//
//  Created by mac on 04.04.2023.
//

import SwiftUI

struct Colours: View {
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple, Color.yellow, Color.pink, Color.black , ]
    @Binding var selectedColor: Color
    
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Image (systemName: selectedColor == color ? C.Icons.recordCircleFill
                       : C.Icons.circleFill)
                .foregroundColor (color)
                    .font (.system(size: 16))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }
            }
            .padding(.bottom)
        }
        
    }
}

struct Colours_Previews: PreviewProvider {
    static var previews: some View {
        Colours(selectedColor: .constant(.blue))
    }
}
