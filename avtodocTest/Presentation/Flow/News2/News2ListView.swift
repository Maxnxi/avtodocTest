//
//  News2ListView.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 15/07/2022.
//

import SwiftUI

struct News2ListView: View {
    
    @ObservedObject var viewModel: News2ListViewModel
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                List {
                    Section(header: Text("Header")) { // header ?
                        ForEach(viewModel.news) {
                            new in
                            NavigationLink(destination: NewDetailView()) {
                                
                                    NewListCellView(viewModel: new)
                            }
                            .task {
                                if new == viewModel.news.last {
                                    await viewModel.getNews(for: viewModel.currentPage)
                                }
                            }
                            //.onAppear() {
//                                if new == viewModel.news.last {
//                                    await viewModel.getNews(for: viewModel.currentPage)
//
//                                    //.getNewsForPage(viewModel.currentPage)
//                                }
//                            }
                        }
                    } // Section
                } // List
            } // VStack
            .background(Color.green)
            .task {
                if viewModel.news.isEmpty {
                    await viewModel.getNews(for: 1)// getNewsForPage(1)
                }
            }
        }
    }
}

struct News2ListView_Previews: PreviewProvider {
    static var previews: some View {
        News2ListView(viewModel: News2ListViewModel(networkService: NetworkServiceAwInputImpl()))
    }
}

