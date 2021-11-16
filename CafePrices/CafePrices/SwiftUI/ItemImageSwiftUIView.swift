//
//  ItemImageSwiftUIView.swift
//  CafePrices
//
//  Created by erick eduardo on 27/10/21.
//

import SwiftUI

struct ItemImageSwiftUIView: View {
    
    @EnvironmentObject var object : Item
    
    var body: some View {
        Image(self.object.itemImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 250)
            .shadow(radius: 10)
    }
}

struct ItemImageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ItemImageSwiftUIView()
    }
}
