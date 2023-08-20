//
//  ToDoListItemsView.swift
//  ToDoApp
//
//  Created by Jason Vo on 8/15/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color(red: 93 / 255, green: 130 / 255,
                                           blue: 178 / 255))
                    .offset(y: -690)
                // VStack
                VStack {
                    Text("Tasks")
                        .offset(x: -140)
                        .offset(y: 15)
                        .font(.system(size: 33))
                        .bold()
                        .foregroundColor(.white)
                    List(items) { item in
                        ToDoListItemView(item: item)
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(.red)
                            }
                    }
                    .listStyle(PlainListStyle())
                }
                .toolbar {
                    Button {
                        // Action
                        viewModel.showingNewItemView = true;
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "PQ7MMxXVttZXWzH6vOHoZt3JroX2")
    }
}
