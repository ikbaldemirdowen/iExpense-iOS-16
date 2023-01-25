//
//  ContentView.swift
//  iExpense
//
//  Created by Ikbal Demirdoven on 2023-01-25.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack
        {
            VStack
            {
                List
                {
                    ForEach(numbers, id: \.self)
                    {
                        Text("\($0)")
                    }
                    .onDelete(perform: remoweRows)
                }
                .toolbar
                {
                    EditButton()
                }
                
                Button("Add")
                {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("iExpense")
        }
        
    }
    func remoweRows(at offsets : IndexSet)
    {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}