//
//  ItemImageSwiftUIView.swift
//  CafePrices
//
//  Created by erick eduardo on 27/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemImageSwiftUIView: View {
    
    @EnvironmentObject var object : Item
    var body: some View {
        if let fileUrl = URL(string: object.image) {
            WebImage(url: fileUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 250)
        }
    }
}

struct ItemImageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ItemImageSwiftUIView()
    }
}

