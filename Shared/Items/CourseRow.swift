//
//  CourseRow.swift
//  DesignCodeCourse
//
//  Created by 임현지 on 2021/05/30.
//

import SwiftUI

struct CourseRow: View {
    var item: CourseSection = courseSections[0]
    
    var body: some View {
        HStack(alignment: .center) {
            Image(item.logo)
                .renderingMode(.original)
                .imageScale(.medium)
                .frame(width: 48, height: 48)
                .background(item.color)
                .clipShape(Circle())
                

            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.title)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.primary)
                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
