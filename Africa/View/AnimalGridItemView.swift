//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Sergiy Vergun on 24/12/2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animal : Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

let animals : [Animal] = Bundle.main.decode("animals.json")
#Preview {
    AnimalGridItemView(animal: animals[0]).previewLayout(.sizeThatFits).padding()
}
