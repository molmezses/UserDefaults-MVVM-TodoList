//
//  AddView.swift
//  TodoList
//
//  Created by Mustafa Ölmezses on 23.08.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Button(action:saveButtonClicked, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✏️")
        .alert("Warning", isPresented: $showAlert) {
            Text("OK ")
        } message: {
            Text(alertTitle)
        }

    }
    
    func saveButtonClicked(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count <= 3 {
            showAlert.toggle()
            alertTitle = "Your new todo item must be at least 3 characters long..😳"
            return false
        }
        return true
    }
    
    
}

#Preview {
    NavigationStack{
        AddView()
    }
    .environmentObject(ListViewModel())
}
