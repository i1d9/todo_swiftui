//
//  ContentView.swift
//  Todo
//
//  Created by Ian Nalyanya on 22/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var workflow : Workflow
    @State var isPresented = false
    @State private var settingsDetent = PresentationDetent.medium

    var body: some View {
        NavigationView {
                List {
                    ForEach(workflow.tasks) { task in
                        
                        NavigationLink{
                            DetailView(task: task)
                        }label: {
                            Text(task.name)
                        }
                    }.sheet(isPresented: $isPresented, content: {
                        FormView(
                            
                            task: Task(name: "", description: "Explain in detail what this task should achieve", isCompleted: false, dueDate: Date.now), isVisible: $isPresented).presentationDetents([.medium, .large], selection: $settingsDetent)
                    })
            }.navigationTitle("Tasks").toolbar {
                Button("New") {
                    isPresented.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    

    
    
    static var previews: some View {
        ContentView().environmentObject(Workflow())
    }
}
