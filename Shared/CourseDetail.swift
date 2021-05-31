//
//  CourseDetail.swift
//  DesignCodeCourse
//
//  Created by 임현지 on 2021/05/31.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course = courses[0]
    var namespace: Namespace.ID
    
    #if os(iOS)
    var cornerRadius: CGFloat = 22.0
    #else
    var cornerRadius: CGFloat = 10.0
    #endif
    
    
    var body: some View {
        #if os(iOS)
        content
        .edgesIgnoringSafeArea(.all)
        #else
        content
        #endif
    }
    
    var content: some View {
        VStack {
            ScrollView {
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                            .padding(4)
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetail(namespace: namespace)
    }
}
