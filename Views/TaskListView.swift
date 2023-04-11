//
//  ContentView.swift
//  AimList
//
//  Created by mac on 17.03.2023.
//

import SwiftUI
import CoreData


struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder:DateHolder

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Description.expirationDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Description>

    var body: some View {
        
     
        NavigationView {
            ZStack{
         
                Image("Image 1")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                List {
              
                           
                        ForEach(items) { item in
                            NavigationLink(destination: AimEditorView(passedDescription: item, initialDate: Date()).environmentObject(dateHolder))
                            {
                               
                                TaskSource(passedDescription: item)
                                    .environmentObject(dateHolder)
                                
                            }
                        }
                        .onDelete(perform: deleteItems)
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
                FloatingButton().environmentObject(dateHolder)
                
                VStack {
                    Spacer()
                    ZStack {
                        
                        NavigationLink(destination: Buttons()) {
                            Text("Tools⚙️")
                                .font(.custom("Open Sans", fixedSize: 35))
                                .foregroundColor(.init("Color"))
                        }
                    }
                }

                
                    .navigationTitle("TaskTracker")
                    .font(.custom("Open Sans", fixedSize: 50))
                    
                
            }

        }
        
    }
        
            
        
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

    }
}
