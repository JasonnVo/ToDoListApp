//
//  ScheduleView.swift
//  ToDoApp
//
//  Created by Jason Vo on 8/23/23.
//

import PhotosUI
import SwiftUI

struct ScheduleView: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {
        VStack {
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
            }
            Spacer()
            PhotosPicker(
                selection: $selectedItems,
                maxSelectionCount: 1,
                matching: .images
            ) {
                Text("Select Photo")
            }
            .onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                        case .success(let data):
                            if let data = data {
                                self.data = data
                            } else {
                                print ("Failed to load")
                            }
                        case .failure(let failure):
                            fatalError("\(failure)")
                    }
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
