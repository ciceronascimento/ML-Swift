//
//  main.swift
//  CBL-ML
//
//  Created by Cicero Nascimento on 16/05/23.
//

import Foundation

print("Hello, KNN!")

var readCSV = ReadCSV()
var data: [Iris] = readCSV.loadCSV()
let knn: KNNClassifier = KNNClassifier()
let dmc: DMCClassifier = DMCClassifier()


let dataSetTeste:[SIMD4<Double>] = [[5.1,3.5,1.4,0.3], //Iris-setosa
                                    [4.8,3.4,1.9,0.2], //Iris-setosa
                                    [6.0,2.9,4.5,1.5], //Iris-versicolor
                                    [6.0,2.2,4.0,1.0], //Iris-versicolor
                                    [6.3,3.4,5.6,2.4], //Iris-virginica
                                    [6.7,3.3,5.7,2.5]] //Iris-virginica


for row in dataSetTeste {
    let predictKnn = knn.predictClassification(data: data, trainingRow: row, k: 4)
    print(predictKnn!)
}

let predictDmc = dmc.predictClassification(data: data, trainingRow: dataSetTeste, k: 4)

//print("KNN: \(predict!)")
