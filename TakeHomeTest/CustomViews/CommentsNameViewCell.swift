//
//  CommentsViewCell.swift
//  TakeHomeTest
//
//  Created by james Jones on 17/07/2022.
//

import SwiftUI

struct CommentsNameViewCell: View {
    let name: String
    // Simple struct for the authors name 
    var body: some View {
       Text(name)
            .font(.title3)
            .bold()
            .frame(width: 250, height: 30)
            .clipShape(
                Rectangle()
            )
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
    }
}

struct CommentsNameViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentsNameViewCell(name: "James Jones")
    }
}
