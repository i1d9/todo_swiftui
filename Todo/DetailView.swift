//
//  DetailView.swift
//  Todo
//
//  Created by Ian Nalyanya on 22/11/2022.
//

import SwiftUI

struct DetailView: View {
    @State var task : Task
    @State var isPresented = false
    @State private var settingsDetent = PresentationDetent.medium

    var body: some View {
        NavigationView{
            Section{
                
                
                VStack {
                    Text(task.description)
                    Text(task.dueDate.formatted(.dateTime.day().month().year()) )
                        
                    
                }.sheet(isPresented: $isPresented, content: {
                    FormView(
                        
                        task: task, isVisible: $isPresented).presentationDetents([.medium, .large], selection: $settingsDetent)
                })
                
            }.navigationTitle(task.name).toolbar {
                Button("Edit") {
                    isPresented = true
                }}
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var task = Task(name: "Task One", description: "Task descriptoin", isCompleted: false, dueDate: Date.now)
    
    static var previews: some View {
        DetailView(task: task)
    }
}
