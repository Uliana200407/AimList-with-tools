//
//  NoteView.swift
//  AimList
//
//  Created by mac on 07.04.2023.
//

import SwiftUI

struct NoteView: View {
    @State var showColors: Bool = false
    @State var animateButton:Bool=false
    var body: some View {
        HStack(spacing: 0){
            if isMacOS(){
                Group{
                    sideBar()
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 1)
                }
            }
            
            
            
            MainContent ( )
        }
         #if os (macOS)
        .ignoresSafeArea()
        #endif
        .frame(width: isMacOS() ? getRect().width / 1.7 : nil, height: isMacOS() ? getRect().height - 180 : nil,alignment: .leading)
        .background((Color.white).ignoresSafeArea())
  #if os(iOS)
.overlay (sideBar())
    #endif
        
    }
    @ViewBuilder
    func MainContent()->some View{
        VStack(spacing: 6){

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    Text ("Notes")
                        .font (isMacOS() ? .system(size: 33,weight: .bold): .largeTitle.bold () )
                        .frame (maxWidth: .infinity, alignment: .leading)
                    let columns = Array(repeating: GridItem(.flexible(), spacing:
                                                                isMacOS () ? 25 : 15), count: isMacOS() ? 3 : 1)
                    LazyVGrid (columns: columns, spacing: 25) {
                        ForEach (notes) {note in
                            CardView (note: note)
                        }
                }
                    .padding(.top,30)
            }
                .padding (.top, isMacOS () ? 45 : 30)
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding (.top, isMacOS () ? 40 : 15)
        .padding (.horizontal,25)
}
    
    @ViewBuilder
    func CardView(note: Note) -> some View{
        VStack{
            Text (note.note)
                .font (isMacOS () ? .title2 : .body) .multilineTextAlignment (.leading)
                .frame (maxWidth: .infinity, alignment: .leading)
            HStack{
                Text (note.date,style: .date)
                    .foregroundColor (.black)
                    .opacity (0.8)
                Spacer (minLength: 0)
                Button {
                } label: {
                    Image (systemName: "heart.fill")
                        
                        .padding (8)
                        .foregroundColor (.white)
                        . background (Color.black)
                        .clipShape (Circle ())
                
              }
            }
            
            
            .padding (.top, 55)
        }
        
        .padding ()
        .background (note.cardColor)
        .cornerRadius (18)
    }
    @ViewBuilder
    func sideBar()-> some View{
        VStack{
            if isMacOS(){
                Text("Pocket")
                    .font(.title2)
                .fontWeight(.semibold)}
            if isMacOS(){
                addButton()
                .zIndex(1)}
            VStack(spacing:15){
                let colors = [Color("Notes 1"),Color("Notes 2"),Color("Notes 3"),Color("Notes 4"),Color("Notes 5")]
                ForEach(colors,id: \.self){color in
                    Circle()
                        .fill(color)
                        .frame (width: isMacOS() ? 20: 25, height:
                    isMacOS () ? 20 : 25)                }
            }
            
            .padding(.top,20)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1:0)
            .zIndex(0)
            if !isMacOS ( ){
                addButton ( )
                .zIndex (1)}
        }
#if os (macOS)
        .frame(maxHeight: .infinity ,alignment: .top)
        .padding(.vertical)
        .padding(.horizontal,22)
        .padding(.top,35)
#else
        .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .topTrailing)
       .padding()

#endif
    }
    @ViewBuilder
    func addButton()->some View{
        Button{withAnimation(.interactiveSpring(response: 0.5,dampingFraction: 0.6,blendDuration: 0.6)){
            showColors.toggle()
            animateButton.toggle()
        }
            
            DispatchQueue.main.asyncAfter (deadline: .now () + 0.3) {
                withAnimation(.spring()){
                    animateButton.toggle()
                }
            }
        
        }label: {
            Image (systemName: "scribble.variable")
                .font(.title2)
                .foregroundColor (.white)
                .scaleEffect (animateButton ? 1.1: 1)
                .padding (isMacOS ( ) ? 12 : 15)
                .background (Color.black)
                .clipShape (Circle())
        }
        .rotationEffect(.init(degrees: showColors ? 45 : 0) )
        .scaleEffect (animateButton ? 1.1: 1)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
extension View{
        func getRect ()->CGRect{
         #if os(iOS)
            return UIScreen.main.bounds
            #else
            return NSScreen.main!.visibleFrame
            #endif
            
        }
    
        func isMacOS( )->Bool{
            #if os(iOS)
            return false
            #endif
            return true
            
            
        }
        
}

struct Previews_NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
#if os (macOS)
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set {}
    }
}
#endif
