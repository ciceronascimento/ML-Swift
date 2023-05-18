//
//  main.swift
//  CBL-ML
//
//  Created by Cicero Nascimento on 16/05/23.
//

import Foundation

var readCSV = ReadCSV()
var data: [Iris] = readCSV.loadCSV()
let knn: KNNClassifier = KNNClassifier()
let dmc: DMCClassifier = DMCClassifier()
dmc.dataset = data
var loop = true

let dataSetTeste:[SIMD4<Double>] = [[5.1,3.5,1.4,0.3], //Iris-setosa
                                    [4.8,3.4,1.9,0.2], //Iris-setosa
                                    [6.0,2.9,4.5,1.5], //Iris-versicolor
                                    [6.0,2.2,4.0,1.0], //Iris-versicolor
                                    [6.3,3.4,5.6,2.4], //Iris-virginica
                                    [6.7,3.3,5.7,2.5]] //Iris-virginica
dmc.training()

repeat {
    print("\nAlgoritmo para testar\n1 - KNN\n2 - DMC\n3 - Perceptron(Não implementado ainda\n4 - Sair do programa")
    print("Entrada: ", terminator: "")
    let escolha = readLine()!
    let escolhaInt = Int(escolha)

    switch escolhaInt{
    case 1:
        testarKnn()
        sleep(3)
    case 2:
        testarDmc()
        sleep(3)
    case 3:
        print("Nao implementado ainda")
        sleep(3)
    case 4:
        loop = false
    default:
        print("\n\n=======|ATENÇAO|=======\n")
        print("Apenas 1, 2 ou 3 permitidos")
        sleep(3)
    }
} while loop


func testarKnn(){
    for row in dataSetTeste {
        let predictKnn = knn.predictClassification(data: data, trainingRow: row, k: 4)
        print(predictKnn!)
    }
}

func testarDmc(){
    for row in dataSetTeste {
        let predictDmc = dmc.predictClassification(trainingRow: row)
        print(predictDmc)
    }
}





