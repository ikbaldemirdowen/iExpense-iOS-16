//
//  ContentView.swift
//  iExpense
//
//  Created by Ikbal Demirdoven on 2023-01-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationStack
        {
            List
            {
                //we could remove id:\.self below because each item is already unique because of the id property that is UUID already.
                ForEach(expenses.items)
                {
                    item in
                    HStack
                    {
                        VStack(alignment : .leading)
                        {
                            Text(item.name)
                                .font(.subheadline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.price, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: remove)
            }
            .toolbar
            {
                Button
                {
                    showingAddExpense.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("iExpense")
            .toolbar
            {
                EditButton()
            }
            .sheet(isPresented: $showingAddExpense)
            {
                AddView(expenses: expenses)
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
        ContentView(expenses: Expenses())
    }
}
