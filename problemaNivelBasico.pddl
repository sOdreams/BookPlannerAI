(define (problem nivelBasico) (:domain nivelBasico)
(:objects 
  book book1 book2 book3 book4 book5 book6 book7 - libro
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

    (= (mesLibroPlanificado book) 0)
    (= (mesLibroPlanificado book1) 0)
    (= (mesLibroPlanificado book2) 0)
    (= (mesLibroPlanificado book3) 0)
    (= (mesLibroPlanificado book4) 0)
    (= (mesLibroPlanificado book5) 0)
    (= (mesLibroPlanificado book6) 0)
    (= (mesLibroPlanificado book7) 0)


    ; ;todo: put the initial state's facts and numeric values here
    ; (esPredecesor book1 book)
    ; (esPredecesor book1 book2)
    ; (esPredecesor book2 book3)
    ;(esPredecesor book4 book3)
    (esPredecesor book3 book4)
    (esPredecesor book4 book5)
    (esPredecesor book4 book6)
    ; (esPredecesor book5 book6)
    ; (libroLeido book5)
    (libroAPlanificar book6)
    (libroAPlanificar book2)
)

(:goal (not (exists (?l - libro) 
              (and (libroAPlanificar ?l) (not (libroPlanificado ?l)))
            )
        )
)

)