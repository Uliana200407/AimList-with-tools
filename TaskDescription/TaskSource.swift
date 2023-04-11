//
//  TaskSource.swift
//  AimList
//
//  Created by mac on 03.04.2023.
//

import SwiftUI

struct TaskSource: View {
    @EnvironmentObject var dateHolder:DateHolder
    @ObservedObject var passedDescription:Description
    var body: some View {
        CheckBox( passedDescription: passedDescription)
            .environmentObject(dateHolder)
        Text(passedDescription.name ?? "")
            .padding (.horizontal)
    }
}

struct TaskSource_Previews: PreviewProvider {
    static var previews: some View {
        TaskSource(passedDescription: Description())
    }
}
