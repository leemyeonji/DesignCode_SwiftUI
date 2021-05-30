//
//  CourseRow.swift
//  DesignCodeCourse
//
//  Created by 임현지 on 2021/05/30.
//

import SwiftUI

struct CourseRow: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "paperplane.circle.fill")
                .renderingMode(.template)
                .imageScale(.medium)
                .frame(width: 48, height: 48)
                .background(Color.blue)
                .clipShape(Circle())
                .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 4.0) {
                Text("SwiftUI")
                    .font(.subheadline)
                    .bold()
                Text("Description")
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
