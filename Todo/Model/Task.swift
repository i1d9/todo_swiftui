//
//  Task.swift
//  Todo
//
//  Created by Ian Nalyanya on 22/11/2022.
//

import Foundation



class Workflow : ObservableObject{
    
    @Published var tasks : [Task] = [Task(name: "Task One", description: "sdkjnsd", isCompleted: false, dueDate: Date.now),
                                     Task(name: "Task Two", description: "sdkjnsd", isCompleted: false, dueDate: Date.now)
                        ,Task(name: "Task Three", description: "sdkjnsd", isCompleted: false, dueDate: Date.now)]
}


class Task : Identifiable{
    var name : String = ""
    var description : String = ""
    var isCompleted : Bool = false
    var dueDate : Date = Date.now
    var id = UUID()
    
    init(name: String, description: String, isCompleted: Bool, dueDate: Date) {
           self.name = name
           self.description = description
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.id = UUID()
       }
}
