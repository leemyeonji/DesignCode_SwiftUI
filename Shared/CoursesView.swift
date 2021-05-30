//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by 임현지 on 2021/05/30.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(width: 335, height: 250)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    show.toggle()
                                    selectedItem = item
                                    isDisabled = true
                                }
                            }
                            .disabled(isDisabled)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            
            if let selectedItem = selectedItem {
                ScrollView {
                    CourseItem(course: selectedItem)
                        .matchedGeometryEffect(id: selectedItem.id, in: namespace)
                        .frame(height: 300)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                show.toggle()
                                self.selectedItem = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    self.isDisabled = false
                                }
                            }
                        }
                    VStack {
                        ForEach(0..<20) { item in
                            CourseRow()
                                .padding(4)
                        }
                    }
                    .padding()
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion:AnyTransition
                            .opacity
                            .animation(Animation.spring().delay(0.3)),
                        removal: AnyTransition
                            .opacity
                            .animation(Animation.spring())
                    )
                )
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}