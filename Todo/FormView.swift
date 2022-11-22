//
//  FormView.swift
//  Todo
//
//  Created by Ian Nalyanya on 22/11/2022.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var workflow : Workflow
    @State var task : Task
    @Binding var isVisible : Bool
    var body: some View {
        
            Form{
                Section{
                    VStack(alignment: .leading){
                        Text("Title").font(.headline)
                        TextField("What's the name of the task?", text: $task.name)

                        
                        
                    }
                    
                    VStack(alignment: .leading){
                        Text("Description").font(.headline)
                        TextEditor(text: $task.description).foregroundColor(Color.gray)
                        DatePicker(selection: $task.dueDate, label: { Text("Due by") })
                }
                    
                    Button(action: {
                        isVisible = false
                        workflow.tasks.append(task)
                    }, label: {
                        Text("Save")
                    })
                
                
                  
                }
            }
        
    }
}

struct FormView_Previews: PreviewProvider {
    
    static let task = Task(name: "Implement Search", description: "Use the api keys provided to add search functionality to the application", isCompleted: false, dueDate: Date.now)
    static var previews: some View {
        FormView( task: task, isVisible: .constant(true))
    }
}
