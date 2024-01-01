(define (problem extension2) (:domain extension2)
(:objects 
  book book1 book2 book3 book4 book5 book6 book7 book8 book9 book10 book11 book12 - libro
  enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre - mes
)
(:init
    (= (mesANumero enero) 1)
    (= (mesANumero febrero) 2)
    (= (mesANumero marzo) 3)
    (= (mesANumero abril) 4)
    (= (mesANumero mayo) 5)
    (= (mesANumero junio) 6)
    (= (mesANumero julio) 7)
    (= (mesANumero agosto) 8)
    (= (mesANumero septiembre) 9)
    (= (mesANumero octubre) 10)
    (= (mesANumero noviembre) 11)
    (= (mesANumero diciembre) 12)


    (= (paginasEnMes enero) 0)
    (= (paginasEnMes febrero) 0)
    (= (paginasEnMes marzo) 0)
    (= (paginasEnMes abril) 0)
    (= (paginasEnMes mayo) 0)
    (= (paginasEnMes junio) 0)
    (= (paginasEnMes julio) 0)
    (= (paginasEnMes agosto) 0)
    (= (paginasEnMes septiembre) 0)
    (= (paginasEnMes octubre) 0)
    (= (paginasEnMes noviembre) 0)
    (= (paginasEnMes diciembre) 0)

    (= (paginasEnLibro book) 300)
    (= (paginasEnLibro book1) 501)
    (= (paginasEnLibro book2) 730)
    (= (paginasEnLibro book3) 800)
    (= (paginasEnLibro book4) 400)
    (= (paginasEnLibro book5) 200)
    (= (paginasEnLibro book6) 200)
    (= (paginasEnLibro book7) 700)
    (= (paginasEnLibro book8) 120)
    (= (paginasEnLibro book9) 90)
    (= (paginasEnLibro book10) 300)
    (= (paginasEnLibro book11) 210)
    (= (paginasEnLibro book12) 230)

    (= (mesLibroPlanificado book) 0)
    (= (mesLibroPlanificado book1) 0)
    (= (mesLibroPlanificado book2) 0)
    (= (mesLibroPlanificado book3) 0)
    (= (mesLibroPlanificado book4) 0)
    (= (mesLibroPlanificado book5) 0)
    (= (mesLibroPlanificado book6) 0)
    (= (mesLibroPlanificado book7) 0)
    (= (mesLibroPlanificado book8) 0)
    (= (mesLibroPlanificado book9) 0)
    (= (mesLibroPlanificado book10) 0)
    (= (mesLibroPlanificado book11) 0)
    (= (mesLibroPlanificado book12) 0)

    ;   ; ;;;;;;;;;;;;;;;;;;Juego de prueba simple
    ; (esPredecesor book book1)
    ; (esPredecesor book1 book2)
    ; (esPredecesor book2 book3)
    ; (esPredecesor book3 book4)
    ; (esPredecesor book4 book5)
    ; (esPredecesor book5 book6)
    ; (esPredecesor book6 book7)
    ; (libroAPlanificar book7)

    ; ;;;;;;;;;;;;;;;;;;Juego de prueba con un predecesores con predecesores, CORREGIDO EL ERROR
    ; (esPredecesor book2 book3)
    ; (esPredecesor book3 book6)
    ; (esPredecesor book3 book5)
    ; (esPredecesor book4 book5)
    ; (esPredecesor book5 book6)
    ; (libroAPlanificar book6)

    ;;;;;;;;;;;;;;;;;;Juego de prueba con un dos predecesores con predecesores
    ; (esPredecesor book1 book2)
    ; (esPredecesor book1 book3)
    ; (esPredecesor book2 book4)
    ; (esPredecesor book3 book4)
    ; (libroAPlanificar book4)

    ; ;;;;;;;;;;;;;;;;;;Juego de prueba 4
    ; (esPredecesor book1 book2)
    ; (esPredecesor book1 book3)
    ; (esPredecesor book2 book4)
    ; (esPredecesor book3 book2)
    ; (esPredecesor book3 book4)
    ; (libroAPlanificar book4)


    ; ;;;;;;;;;;;;;;;;;;Juego de prueba 5
    ; (esPredecesor book5 book1)
    ; (esPredecesor book5 book2)
    ; (esPredecesor book5 book3)
    ; (esPredecesor book5 book4)
    ; (esPredecesor book1 book2)
    ; (esPredecesor book2 book3)
    ; (esPredecesor book2 book4)
    ; (esPredecesor book3 book4)
    ; (esPredecesor book3 book7)
    ; (esPredecesor book7 book8)
    ; (esPredecesor book8 book4)
    ; (libroAPlanificar book4)

    ;;;;;;;;;;;;;;;;;;Juego de prueba 6
    ; (esPredecesor book1 book3)
    ; (esPredecesor book3 book4)
    ; (esPredecesor book4 book6)
    ; (esPredecesor book6 book9)
    ; (esPredecesor book9 book11)
    ; (esPredecesor book3 book5)
    ; (esPredecesor book5 book7)
    ; (esPredecesor book5 book8)
    ; (esPredecesor book7 book10)
    ; (esPredecesor book8 book10)
    ; (esPredecesor book10 book11)
    ; (esPredecesor book11 book12)
    ; (libroAPlanificar book12)

    ; ;;;;;;;;;;;;;;;;;;Juego de prueba 7
      ; (esPredecesor book8 book5)
      ; (esPredecesor book9 book5)
      ; (esPredecesor book10 book5)
    
  ;;;;;;;;;;;;;;;;;;;;;;;;;juego prueba 7.5 ciclo
    ;(esPredecesor book1 book2)
    ;(esPredecesor book2 book1)
    ;(libroAPlanificar book1)

    ; ;;;;;;;;;;;;;;;;;;Juego de prueba 8 Paralelo
      ;(esPredecesor book11 book5)
      ;(esParalelo book1 book2)
      ;(libroAPlanificar book5)
      ;(libroAPlanificar book2)

    ;;;;;;;;;;;;;;;;;;;Juego de prueba 9 Paralelo
    ; (esPredecesor book7 book8)
    ; (esPredecesor book6 book8)
    ; (esParalelo book6 book7)
    ; (esParalelo book5 book6)
    ; (libroAPlanificar book8)

    ;; ;;;;;;;;;;;;;;;;;;Juego de prueba 10 Paralelo
    ;(esParalelo book3 book1)
    ;(esParalelo book2 book1)
    ;(esParalelo book book1)
    ;(esParalelo book4 book1)
    ;(esParalelo book5 book1)
    ;(esParalelo book6 book1)
    ;(libroAPlanificar book1)

    ;; ;;;;;;;;;;;;;;;;;;Juego de prueba 11 Paralelo
    ;(esPredecesor book1 book2)
    ;(esPredecesor book1 book3)
    ;(esParalelo book2 book5)
    ;(esParalelo book3 book5)
    ;(esParalelo book3 book5)
    ;(esPredecesor book5 book7)
    ;(esParalelo book7 book8)
    ;(libroAPlanificar book8)    
    ;;1-->{2,3,5,4}-->{7,8}

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;Juego de prueba 12 800 paginas solo paralelos
    ;book 1 300 paginas
    ;book 2 501 paginas
    ;book 3 800 paginas
    ;si se añade book3 el planificador no encuentra solucion y es correcto 
    ; (esParalelo book book1)
    ; (esParalelo book2 book1)
    ; ;(esParalelo book3 book1)
    ; (libroAPlanificar book1)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;Juego de prueba 13 800 paginas solo precedecias
    ;si la suma de las paginas de book5+ book6 + book7 es menor que 800, los pone en el mismo mes los tres
    ; de otro modo, pone el que sobra en otro mes
    (esPredecesor book5 book4)
    (esPredecesor book6 book4)
    (esPredecesor book7 book4)
    (libroAPlanificar book4)
)

  (:goal (not (exists (?l - libro) 
                (and (libroAPlanificar ?l) (not (libroPlanificado ?l)))
              )
          )
    )

)