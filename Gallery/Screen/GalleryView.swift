//
//  GalleryView.swift
//  Gallery
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain
import PreviewData

public struct GalleryView: View {
    
    @StateObject var viewModel: GalleryViewModel
    
    @State private var gridLayout: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    public init(animalRepository: AnimalRepository) {
        _viewModel = .init(wrappedValue: .init(animalRepository: animalRepository))
    }
    
    public var body: some View {
        ScrollView {
            
            Image(viewModel.selectedAnimal.image, bundle: .init(identifier: "com.donggyu.Gallery"))
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .background {
                    Circle().stroke(.accent, lineWidth: 4)
                }
            
            GroupBox {
                HStack {
                    Button {
                        withAnimation {
                            gridLayout = [
                                .init(.flexible()),
                                .init(.flexible()),
                            ]
                        }
                    } label: {
                        HStack {
                            Text("2")
                            Image(systemName: "list.bullet")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Button {
                        withAnimation {
                            gridLayout = [
                                .init(.flexible()),
                                .init(.flexible()),
                                .init(.flexible()),
                            ]
                        }
                    } label: {
                        HStack {
                            Text("3")
                            Image(systemName: "list.bullet")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Button {
                        withAnimation {
                            gridLayout = [
                                .init(.flexible()),
                                .init(.flexible()),
                                .init(.flexible()),
                                .init(.flexible()),
                            ]
                        }
                    } label: {
                        HStack {
                            Text("4")
                            Image(systemName: "list.bullet")
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .foregroundStyle(.accent)
            
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(viewModel.animals) { animal in
                    Image(animal.image, bundle: .init(identifier: "com.donggyu.Gallery"))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .background {
                            Circle().stroke(lineWidth: 2)
                        }
                        .onTapGesture {
                            viewModel.set(animal: animal)
                        }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    GalleryView(animalRepository: AnimalRepositoryPreview())
        .preferredColorScheme(.dark)
}
