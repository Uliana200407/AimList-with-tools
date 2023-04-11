//
//  FloatingButtomn.swift
//  AimList
//
//  Created by mac on 17.03.2023.
//

import SwiftUI
import UIKit



struct FloatingButton: View {
    @State var selectedTag: String?
    @State var tag:Int? = nil
    @State private var goesToDetail: Bool = false

    @EnvironmentObject var dateHolder:DateHolder
    
   
    var body: some View {
            NavigationLink(destination: AimEditorView(passedDescription: nil, initialDate: Date()).environmentObject(dateHolder)){
                Text("Add a task✐")
                    .font(.custom("Open Sans", fixedSize: 32))
                    .fontWeight(.heavy)
                    .frame(width: 200,height: 50)
            }
            .padding(30)
            .bold()
            .foregroundColor(.init("Color 1"))
            .background(Color.init("Color 2"))
            .cornerRadius(20)
            .shadow(radius: 20)
            .padding(30)
            
            
            
            
        }
        
        
        
    }

struct FloatingButtomn_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
        ArtView()
        ContentView2()
    }
}
