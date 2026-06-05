class Nave {
    var velocidad 
    var direccion 

    method velocidad() = velocidad
    method direccion() = direccion

    method acelerar(cuanto) {
        velocidad = (velocidad + cuanto).min(10)
    }
    method desacelerar(cuanto) {
        velocidad = (velocidad - cuanto).max(-10)
    }

    method irHaciaElSol() {
        direccion = 10
    }
    method escaparDelSol() {
        direccion = 0
    }
    method ponerseParaleloAlSol() {
        direccion = 0
    }

    method acercarseUnPocoAlSol() {
        direccion += 1
    }
    method alejarseUnPocoDelSol() {
        direccion -= 1
    }

    method prepararViaje(cantAcelera) {
        self.acelerar(cantAcelera)
    }   // metodo abstracto, es un metodo sin definir que obliga a 
        // las clases hijas a utilizarlo obligatoriamente
        // al tener Nave un metodo abstracto no puedo instanciar 
        // ningun objecto clase Nave
}
class NaveBaliza inherits Nave {
    var property color
    const coloresValidos = ["rojo", "verde", "azul"]

    method cambiarColorDeBaliza(colorNuevo) {
        if (coloresValidos.contains(colorNuevo))
            color = colorNuevo
    }
    method agregarColor(colorNuevo) {
        coloresValidos.add(colorNuevo)
    }
    method quitarColor(colorNuevo) {
        coloresValidos.remove(colorNuevo)
    }

    override method prepararViaje(cantAcelera) {
        self.cambiarColorDeBaliza("verde")
        self.ponerseParaleloAlSol()
    }
}
class NavePasajeros inherits Nave{
    var cantidadPasajeros 
    var cantidadRaciones 
    var cantidadBebidas 

    method cantidadPasajeros() = cantidadPasajeros
    method subirPasajeros(cantidad) {
        cantidadPasajeros += cantidad
    }
    method bajarPasajeros(cantidad) {
        cantidadPasajeros -= cantidad
    }
    method cargarRaciones(cantidad) {
        cantidadRaciones += cantidad
    }
    method descargarRaciones(cantidad) {
        cantidadRaciones -= cantidad
    }
    method cargarBebidas(cantidad) {
        cantidadBebidas += cantidad
    }
    method descargarBebidas(cantidad) {
        cantidadBebidas -= cantidad
    }

    override method prepararViaje(cantAcelera) {
        self.cargarRaciones(cantidadPasajeros * 4)
        self.cargarBebidas(cantidadPasajeros * 6)
        Nave.acercarseUnPocoAlSol()
    }
}
// crear instancia en consola
// const nave1 = new Nave(velocidad = 10, direccion = 10)
class NaveDeCombate inherits Nave{
    var estaVisible = true
    var misilesDesplegados = true
    const mensajesEmitidos = []

    method estaVisible() = estaVisible
    method ponerseVisible() {estaVisible = true}
    method ponerseInvisible() {estaVisible = false}

    method misilesDesplegados() = misilesDesplegados
    method desplegarMisiles() {misilesDesplegados = true}
    method replegarMisiles() {misilesDesplegados = false}

    method emitirMensaje(mensaje) {
        mensajesEmitidos.add(mensaje)
    }
    method primerMensajeEmitido() = mensajesEmitidos.first()
    method ultimoMensajeEmitido() = mensajesEmitidos.last()
    method esEscueta() = mensajesEmitidos.any({m => m.size() > 30})
    method emitioMensaje() = mensajesEmitidos.size() > 0

    override method prepararViaje(cantAcelera) {
        self.ponerseVisible()
        self.replegarMisiles()
        Nave.acelerar(cantAcelera)
        self.emitirMensaje("Saliendo en misión")
        super(cantAcelera)
    }
}
// override sobreescribe el metodo de la clase padre
// con super se puede ejecutar el contenido del metodo en el 
// padre escribiendo una sola linea (dicho contenido pueden ser
// muchas lineas de codigo)