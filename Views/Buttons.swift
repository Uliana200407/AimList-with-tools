//
//  Buttons.swift
//  AimList
//
//  Created by mac on 10.04.2023.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        ZStack {
            Image("Image 1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Welcome to the page of necessary tools⚙️")
                    .font(.custom("Open Sans", fixedSize: 35))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: ArtView()) {
                        Image(systemName: "hand.draw.fill")
                            .font(.system(size: 70))
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(Color("Color 1"))
                            .cornerRadius(20)
                            .shadow(radius: 20)
                            .padding(30)
                            .frame(minWidth: 200, minHeight: 200)
                    }
                    Spacer()
                    NavigationLink(destination: NoteView()) {
                        Image(systemName: "star.bubble")
                            .font(.system(size: 70))
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(Color("Color 1"))
                            .cornerRadius(20)
                            .shadow(radius: 20)
                            .padding(30)
                            .frame(minWidth: 200, minHeight: 200)
                    }
                    Spacer()
                }
                Spacer()
                NavigationLink(destination: ContentView2()) {
                    Image(systemName: "timer.circle")
                        .font(.system(size: 70))
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color("Color 1"))
                        .cornerRadius(20)
                        .shadow(radius: 20)
                        .padding(30)
                        .frame(minWidth: 200, minHeight: 200)
                }
                .padding()
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
        ArtView()
        ContentView2()
        ContentView()
    }
}
