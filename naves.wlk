class Nave {
    var velocidad 
    var direccion
    var combustible 

    method acelerar(cuanto) {
        velocidad = (velocidad + cuanto).min(100000)
    }
    method desacelerar(cuanto) {
        velocidad = (velocidad - cuanto).max(0)
    }

    method irHaciaElSol() {
        direccion = 10
    }
    method escaparDelSol() {
        direccion = -10
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

    method cargarCombustible(litros) {
        combustible += litros
    }
    method descargarCombustible(litros) {
        combustible -= litros
    }

    method prepararViaje() {
        self.acelerar(5000)
        self.cargarCombustible(30000)
    }   // metodo abstracto, es un metodo sin definir que obliga a 
        // las clases hijas a utilizarlo obligatoriamente
        // al tener Nave un metodo abstracto no puedo instanciar 
        // ningun objecto clase Nave
    method estaTranquila() = combustible >= 4000 && velocidad < 12000
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

    override method prepararViaje() {
        self.cambiarColorDeBaliza("verde")
        self.ponerseParaleloAlSol()
        super()
    }
    override method estaTranquila() = super() && color <> "rojo"
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

    override method prepararViaje() {
        self.cargarRaciones(cantidadPasajeros * 4)
        self.cargarBebidas(cantidadPasajeros * 6)
        self.acercarseUnPocoAlSol()
        super()
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

    override method prepararViaje() {
        self.ponerseVisible()
        self.replegarMisiles()
        self.acelerar(15000)
        self.emitirMensaje("Saliendo en misión")
        super()
    }
    override method estaTranquila() {}
}
// override sobreescribe el metodo de la clase padre
// con super se puede ejecutar el contenido del metodo en el 
// padre escribiendo una sola linea (dicho contenido pueden ser
// muchas lineas de codigo)
class NaveHospital inherits NavePasajeros{
    var estadoQuirofanos

    method prepararElQuirofano() {
        estadoQuirofanos = true
    }
    override method prepararViaje() {}
}
class NaveDeCombateSigilosas inherits NaveDeCombate {

}