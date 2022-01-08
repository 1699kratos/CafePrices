//
//  ItemSwiftUIView.swift
//  CafePrices
//
//  Created by erick eduardo on 26/10/21.
//

import SwiftUI

struct ItemSwiftUIView: View {
    
    @EnvironmentObject var object : Item
    var dissmissView: (() -> Void)
    
    var body: some View {
        NavigationView {
            VStack {
                ItemImageSwiftUIView()
                HStack { Text(self.object.name) .font(.title) }
                HStack { Text("$" + self.object.price).font(.custom("Helvetica Neue", size: 40)) }
            }
            .navigationTitle("Detalles")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Regresar") {
                       dissmissView()
                    }
                }
            }
        }
        .accentColor(.blue)
    }
}

