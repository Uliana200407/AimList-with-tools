//
//  AimEditorView.swift
//  AimList
//
//  Created by mac on 17.03.2023.
//

import SwiftUI



struct AimEditorView: View {
    @State var selectedDescription: Description?
    @State var name: String
    @State var desc: String
    @State var expirationDate: Date
    @State var sheduleTime: Bool
    @Environment(\.presentationMode)  var presentationMode:Binding<PresentationMode>

    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder:DateHolder

    init (passedDescription: Description?,initialDate: Date){
        if let description = passedDescription{
            _selectedDescription = State(initialValue: description)
            _name = State(initialValue: description.name ?? "")
            _desc = State(initialValue: description.desc ?? "")
            _expirationDate = State(initialValue: description.expirationDate ?? initialDate)
            _sheduleTime = State(initialValue: description.sheduleTime)
            
        }
        else {
            _name = State(initialValue:  "")
            _desc = State(initialValue: "")
            
            _expirationDate = State(initialValue: initialDate)
            _sheduleTime = State(initialValue: false)
        }
    }
    var body: some View {
        
        Form
        {
            
            Section(header:  Text("Task"))
            {
                TextField("Task name", text: $name)
                TextField("Task description", text: $desc)
                
            }
            Section(header:  Text("Expiration Date"))
            {
                Toggle("Shedule Time",isOn: $sheduleTime)
                DatePicker("Expiration Date", selection: $expirationDate,displayedComponents: displayComps())
            }
            if selectedDescription?.isCompleted() ?? false {
                Section(header:  Text("Done"))
                {
                    Text(selectedDescription?.completionDate?.formatted(date:.abbreviated,time: .shortened) ?? "")
                        .foregroundColor(Color.green)
                }
            }
            Section(){
                Button("Save",action: saveAction)
                    .font(.headline)
            }
        }
        
    }
    func displayComps()->DatePickerComponents{
        return sheduleTime ? [.hourAndMinute,.date] : [.date]
    }
    func saveAction(){
        withAnimation{
            if selectedDescription == nil{
                selectedDescription = Description(context: viewContext)
            }
            selectedDescription?.creationDate = Date()
            selectedDescription?.name = name
            selectedDescription?.expirationDate = expirationDate
            selectedDescription?.sheduleTime = sheduleTime
            dateHolder.saveContext(viewContext)
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}
struct AimEditorView_Previews: PreviewProvider {
    static var previews: some View {
        AimEditorView(passedDescription: Description(), initialDate: Date())
    }
}
