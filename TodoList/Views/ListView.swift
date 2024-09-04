//
//  ListView.swift
//  TodoList
//
//  Created by Mustafa Ölmezses on 23.08.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
       
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform:listViewModel.deleteItem)
                    .onMove(perform:listViewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Todo List🔖")
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add")
                }

            }
        })
    }
    
}

#Preview {
    NavigationStack{
        ListView()
    }
    .environmentObject(ListViewModel())
}


