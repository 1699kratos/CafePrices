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
                HStack { Text("$" + self.object.price) }
            }
            .navigationTitle("Detalles")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Back"){
                       dissmissView()
                    }
                }
            }
        }
        .accentColor(.blue)
    }
}

//struct ItemSwiftUIView_Previews: PreviewProvider {
  //  static var previews: some View {
    //    ItemSwiftUIView().environmentObject(Item())
    //}
//}
