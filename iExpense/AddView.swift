//
//  AddView.swift
//  iExpense
//
//  Created by Ikbal Demirdoven on 2023-01-25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses = Expenses()
    @State private var name = ""
    @State private var type = "Personal"
    @State private var price = 0.0
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack
        {
            Form
            {
                TextField("Name", text: $name)
                TextField("Price", value: $price, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                Picker("Type", selection: $type)
                {
                    ForEach(types, id: \.self)
                    {
                        Text("\($0)")
                    }
                }
            }
            .toolbar
            {
                Button("Save")
                {
                    let item = ExpenseItem(name: name, price: price, type: type)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            .navigationTitle("Add New Expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
