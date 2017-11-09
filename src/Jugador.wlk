class NoTienePlataSuficienteException inherits Exception{}
class Jugador {
	var horasJugadasEnTotal
	var logrosObtenidos=#{}
	var dineroDigital
	var juegosComprados=#{}
	constructor(_horasJugadas,_dineroDigital){
		horasJugadasEnTotal=_horasJugadas
		dineroDigital=_dineroDigital
	}
	method horasJugadasEnTotal(){
		return horasJugadasEnTotal
	}
	method experienciaGamer(){
		return horasJugadasEnTotal*25
	}
	method aumentarHorasJugadas(cantidadHoras){
		horasJugadasEnTotal+=cantidadHoras
	}
	method agregarLogro(logro){
		logrosObtenidos.add(logro)
	}
	method cantidadGemas(){
		return logrosObtenidos.sum({logro=>logro.obtenerLogro()})
	}
	method transformarGemasEnDinero(){
		dineroDigital+=self.cantidadGemas()
	}
	method comprarJuego(juego){
		if(!self.puedeComprarlo(juego)){
			throw new NoTienePlataSuficienteException("No le alcanza el dinero para comprarlo")
		}
		if(dineroDigital<juego.precio()){
			self.transformarGemasEnDinero()
		}
		dineroDigital-=juego.precio()
		juegosComprados.add(juego)
	}
	method puedeComprarlo(juego){
		return dineroDigital+self.cantidadGemas()>=juego.precio() || !juegosComprados.contains(juego)
	}
	method logrosImportantesObtenidos(){
		return logrosObtenidos.filter({logro=>logro.esImportante()})
	}
	method juegosConLogrosImportanesObtenidos(){
		return self.logrosImportantesObtenidos().map({logro=>logro.juego()})
	}
	method juegosConLogrosImportantesObtenidosParaAlardear(){
		return self.juegosConLogrosImportanesObtenidos().filter({juego=>juego.esRosita()})
	}
	method jugar(juego,cantHoras){
		self.aumentarHorasJugadas(cantHoras)
		juego.otorgarLogro(self,cantHoras)
	}
	method cantidadLogrosObtenidos(){
		return logrosObtenidos.size()
	}
}