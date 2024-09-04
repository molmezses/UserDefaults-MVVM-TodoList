//
//  TodoListApp.swift
//  TodoList
//
//  Created by Mustafa Ölmezses on 23.08.2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
