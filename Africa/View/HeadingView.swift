//
//  HeadingView.swift
//  Africa
//
//  Created by Sergiy Vergun on 27.10.2023.
//

import SwiftUI

struct HeadingView: View {
    
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.accentColor)
            Text(text)
        }.padding(.vertical).font(.title3).fontWeight(.medium)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(image: "photo.stack", text: "Heading text").previewLayout(.sizeThatFits).padding()
    }
}
