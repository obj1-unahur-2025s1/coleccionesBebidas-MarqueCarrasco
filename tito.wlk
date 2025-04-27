object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuado{
    const nutrientes = [] 
    method rendimientos(cantidad) = nutrientes.sum()*cantidad

    method agregar(nutriente) {
      nutrientes.add(nutriente)
    }

}

object aguaSaborizada{
    var bebida = terere
    method rendimiento(cantidad) = 1 + bebida.rendimiento(cantidad)/4
    method bebida(nueva){
        bebida = nueva 
    }
   
}

object coctelSuave{
    const bebida = [wisky , terere]
    method rendimiento(cantidad) {
        const bebidasAConsiderar= bebida.filter({e=>e.rendimiento(cantidad)>0.5})
        return bebidasAConsiderar.sum({e=>e.rendimiento(cantidad)})
                                // bebidas.any({e=>e.rendimiento(1)==0})*cantidad
                        
    }

    method agregar(nueva){
        bebida.add(nueva)
    }

    method quitar(nueva){
        bebida.remove(nueva)
    }

    method rendimientoBis(cantidad) =
         bebida.filter({e=>e.rendimiento(cantidad)>0.5}).sum({e=>e.rendimiento(cantidad)})
}

object coctel{
     const bebida= []
     method rendimiento(cantidad){
        var rendimiento = 1
        return bebida.forEach{p => rendimiento * p.rendimiento(cantidad)}
     }

    method agregar(nueva){
        bebida.add(nueva)
    }

    method quitar(nueva){
        bebida.remove(nueva)
    } 
}
