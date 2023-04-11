//
//  AimListApp.swift
//  AimList
//
//  Created by mac on 17.03.2023.
//

import SwiftUI
import UserNotifications

@main
struct AimListApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
       
                TaskListView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(dateHolder)
            }
        }
    }


struct NotesMacOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
#if os (macOS)
        .windowStyle (HiddenTitleBarWindowStyle())
#endif
    }
}









