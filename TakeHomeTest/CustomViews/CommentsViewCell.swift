//
//  CommentsViewCell.swift
//  TakeHomeTest
//
//  Created by james Jones on 17/07/2022.
//

import SwiftUI

struct CommentsViewCell: View {
    let bodyText: String
    // Simple struct for authors comment 
    var body: some View {
        Text(bodyText)
            .font(.system(size: 14, weight: .light))
            .multilineTextAlignment(.leading)
            .minimumScaleFactor(0.65)
            .frame(height: 90)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
            .padding()
    }
}

struct CommentsViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentsViewCell(bodyText: "here is some textsss ss sss ssd sdfdw dfs ddfef fefefvc fe")
    }
}
