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
        let itemUrl = URL(string: object.image)
        Image(systemName: "product")
            .data(url: itemUrl!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 250)
        
    }

}

struct ItemImageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ItemImageSwiftUIView()
    }
}

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
