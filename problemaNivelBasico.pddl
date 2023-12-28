(define (problem nivelBasico) (:domain nivelBasico)
(:objects 
  book book1 book2 book3 book4 book5 book6 book7 - libro
  enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre - mes
)
(:init
    ;todo: put the initial state's facts and numeric values here
    (esPredecesor book book1)
    (esPredecesor book1 book2)
    (esPredecesor book2 book3)
    (esPredecesor book3 book4)
    (esPredecesor book4 book5)
    (esPredecesor book5 book6)
    ; un libro leido en la secuencia anterior rompe el ciclo que impide que se planifiquen los libros, por eso se agrega el book4 como leido
    (libroLeido book) 
    (libroALeer book4)
    (libroALeer book7)

    (= (tiempo enero) 1)
    (= (tiempo febrero) 2)
    (= (tiempo marzo) 3)
    (= (tiempo abril) 4)
    (= (tiempo mayo) 5)
    (= (tiempo junio) 6)
    (= (tiempo julio) 7)
    (= (tiempo agosto) 8)
    (= (tiempo septiembre) 9)
    (= (tiempo octubre) 10)
    (= (tiempo noviembre) 11)
    (= (tiempo diciembre) 12)

    ; en caso de quitar el libro leido (book4), no se podrá planificar los libros
    ; (esPredecesor book3 book4)
    ; (esPredecesor book2 book3)
    ; (esPredecesor book5 book6)
    ; (esPredecesor book4 book5)
    ; (esPredecesor book1 book2)
    ; (libroPlanificado book5)
    ; (libroPlanificado book6)
    ; (libroPlanificado book)
    
)

(:goal (forall (?l - libro) (or (not (libroALeer ?l)) (libroPlanificado ?l))))


;un-comment the following line if metric is needed
;(:metric minimize (???))
)

