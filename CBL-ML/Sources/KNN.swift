//
//  KNN.swift
//  CBL-ML
//
//  Created by Cicero Nascimento on 16/05/23.
//

import Foundation
import simd

class KNNClassifier {
    private(set) var distances: [(Iris, Double)] = []
    private(set) var neighbors: [Iris] = []
    private(set) var outputValues: [String] = []
    /**
     Calcula os vizinhos mais próximos com base em uma instância de teste.

     - Parameters:
       - trainingSet: O conjunto de treinamento contendo as instâncias de treinamento.
       - testInstance: A instância de teste para a qual deseja-se encontrar os vizinhos mais próximos.
       - k: O número de vizinhos mais próximos a serem selecionados.

     - Returns: Uma matriz contendo os vizinhos mais próximos.
     */
    func getNeighbors(trainingSet: [Iris], testInstance: SIMD4<Double>, k: Int) -> [Iris] {

        // Calcula a distância entre a instância de teste e cada instância de treinamento
        for trainingRow in trainingSet {
            let distance = simd_distance(testInstance, trainingRow.vector!)
            distances.append((trainingRow, distance))
        }
        
        // Ordena as distâncias em ordem crescente
        let sortedDistances = distances.sorted(by: { $0.1 < $1.1 } )

        // Seleciona os k vizinhos mais próximos
        for i in 0..<k {
            neighbors.append(sortedDistances[i].0)
        }
        return neighbors
    }

    /**
     Realiza a classificação de uma instância de teste com base nos vizinhos mais próximos.

     - Parameters:
       - data: O conjunto de treinamento contendo as instâncias de treinamento e suas respectivas classes.
       - trainingRow: A instância de teste a ser classificada.
       - k: O número de vizinhos mais próximos a serem considerados na votação.

     - Returns: A classe prevista para a instância de teste.
     */
    func predictClassification(data: [Iris], trainingRow: SIMD4<Double>, k: Int) -> String? {
        neighbors = getNeighbors(trainingSet: data, testInstance: trainingRow, k: k)

        // Extrai a classe de cada vizinho
        outputValues = neighbors.map { $0.species }

        // Realiza a votação para determinar a classe prevista
        let prediction = outputValues.reduce(into: [:]) { counts, element in
            counts[element, default: 0] += 1
        }.max { $0.value < $1.value }?.key
        neighbors.removeAll()
        outputValues.removeAll()
        distances.removeAll()
        return prediction
    }
}
