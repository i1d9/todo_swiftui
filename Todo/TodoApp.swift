//
//  TodoApp.swift
//  Todo
//
//  Created by Ian Nalyanya on 22/11/2022.
//

import SwiftUI

@main
struct TodoApp: App {
   
    
    @StateObject var workflow = Workflow()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(workflow)
        }
    }
}
