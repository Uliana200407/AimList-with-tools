//
//  ContentView2.swift
//  AimList
//
//  Created by mac on 08.04.2023.
//

import SwiftUI


struct ContentView2: View {
    
    @StateObject var fastingManager = FastingManager()
    var title: String {
        switch fastingManager.fastingState {
        case .notStarted:
            return "It's time to begin"
        case .fasting:
            return "Your are in a fasting mode"
        case .feeding:
            return "You are providing food"
        }
    }
    
    var body: some View {
        ZStack {
            Image("Image 1")
                .resizable()
                .ignoresSafeArea()
            content
        }
    }
    var content: some View {
        ZStack {
            VStack(spacing: 40) {
                
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(fastingManager.fastingPlan.rawValue)
                    .bold()
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(.infinity)
                Spacer()
            }.padding()
            
            VStack(spacing: 40) {
                
                ProgressRing()
                    .environmentObject(fastingManager)
                
                HStack(spacing: 60){
                    
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "Start" : "Started")
                            .opacity(0.9)
                            .italic()
                            .bold()
                        Text(fastingManager.startTime, format:.dateTime.weekday().hour().minute().second())
                            .bold()
                    }
                    
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "End" : "Ends")
                            .opacity(0.9)
                            .italic()
                            .bold()
                        Text(fastingManager.endTime, format:.dateTime.weekday().hour().minute().second())
                            .bold()
                            
                    }
                    
                }

                VStack{
                    Button {
                        fastingManager.toggleFastingState()
                    } label: {
                        Text(fastingManager.fastingState == .fasting ? "End Fasting" : "Start Fasting")
                            .frame(width: 200,height: 50)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                            .background(Color("Color 3"))
                            .cornerRadius(.infinity)
                    }
                }
            }.padding()
            
            }
            .foregroundColor(.black)
        }
    }


struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
