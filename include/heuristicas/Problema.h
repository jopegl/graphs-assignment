#ifndef HEURISTICAS_PROBLEMA_H
#define HEURISTICAS_PROBLEMA_H

// Responsável: todos (contrato). Único ponto que muda quando o tema for definido.

#include <string>

class Grafo;
class Arvore;
class Aleatorio;

class Problema {
public:
    virtual ~Problema() = default;

    // Tema A: número de folhas | Tema B: número de vértices de ramificação
    virtual int avaliar(const Arvore& t) const = 0;

    // Tema A: a > b (maximização) | Tema B: a < b (minimização)
    virtual bool melhor(int a, int b) const = 0;

    // Construtivo. alfa = 0 -> guloso puro.
    virtual Arvore construir(const Grafo& g, double alfa, Aleatorio& rng) const = 0;

    virtual std::string nome() const = 0;
};

#endif // HEURISTICAS_PROBLEMA_H
