
## {0^n 1^n 0^n | n >= 1}

Q: Conjunto de estados {q0, q1, q2, q3, q4, q5}
Σ: Conjunto de símbolos de entrada {0, 1}
Γ: Conjunto de símbolos de cinta {0, 1, X, Y, Z, B}
δ: Función de transición:
δ(q0, 0) = (q1, X, R)
δ(q1, 0) = (q1, 0, R)
δ(q1, 1) = (q2, Y, R)
δ(q2, 1) = (q2, 1, R)
δ(q2, 0) = (q3, Z, R)
δ(q3, 0) = (q3, 0, R)
δ(q3, B) = (q4, B, L)
δ(q4, 0) = (q4, 0, L)
δ(q4, 1) = (q4, 1, L)
δ(q4, X) = (q4, X, L)
δ(q4, Y) = (q4, Y, L)
δ(q4, Z) = (q4, Z, L)
δ(q4, 0) = (q5, B, R)

q0: Estado inicial
q5: Estado de aceptación


## 