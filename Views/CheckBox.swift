//
//  CheckBox.swift
//  AimList
//
//  Created by mac on 03.04.2023.
//

import SwiftUI

struct CheckBox: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder:DateHolder
    @ObservedObject var passedDescription:Description
    var body: some View {
        Image(systemName: passedDescription.isCompleted() ? "checkmark.circle.fill" : "circle")
            .foregroundColor (passedDescription.isCompleted() ? .green : .secondary)
            .onTapGesture {
                withAnimation
                {
                    if !passedDescription.isCompleted()
                    {
                        passedDescription.completionDate = Date()
                        dateHolder.saveContext(viewContext)
                        
                    }
                }
            }
        }
    }

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(passedDescription: Description())
    }
}
