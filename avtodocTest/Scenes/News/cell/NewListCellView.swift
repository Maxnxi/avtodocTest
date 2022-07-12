//
//  NewListCellView.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 12/07/2022.
//

import SwiftUI

struct NewListCellView: View {

    var viewModel: New

    var body: some View {
        VStack {
         Spacer(minLength: 12)
            Image(systemName: "person")
            Spacer(minLength: 12)
            Text(viewModel.title)
            Text(viewModel.publishedDate)
        }
        .background(Color.gray)
    }
}

struct NewListCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewListCellView(viewModel: New(id: 1,
                                       title: "New", newsDescription: "This text is about news an other things",
                                       publishedDate: "22/03/22",
                                       url: "123123",
                                       fullURL: "123123",
                                       titleImageURL: "123123",
                                       categoryType: "123123123"))
    }
}
