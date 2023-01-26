//
//  ContentView.swift
//  iExpense
//
//  Created by Ikbal Demirdoven on 2023-01-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    var body: some View {
        NavigationStack
        {
            List
            {
                //we could remove id:\.self below because each item is already unique because of the id property that is UUID already.
                ForEach(expenses.items)
                {
                    item in Text("\(item.name)")
                }
                .onDelete(perform: remove)
            }
            .toolbar
            {
                Button
                {
                    let expense = ExpenseItem(name: "Test", price: 10.99, type: "Personal")
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("iExpense")
            .toolbar
            {
                EditButton()
            }
        }
    }
    
    func remove(at offSets : IndexSet)
    {
        expenses.items.remove(atOffsets: offSets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
