//
//  HeaderView.swift
//  ToDoApp
//
//  Created by Jason Vo on 8/15/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color(red: 93 / 255, green: 130 / 255,
                                       blue: 178 / 255))
                .rotationEffect(Angle(degrees: 15))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                    .underline()
                Text(subtitle)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, // blue rectangle frame
                height: 350)
        .offset(y: -150) // Move whole thing upwards
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "To Do List", subtitle: "Get Things Done")
    }
}
