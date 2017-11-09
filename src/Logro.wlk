class Logro {
	var juego
	constructor(_juego){
		juego=_juego
	}
	method juego(){
		return juego
	}
	method calcularGemas()
	method esImportante(){
		return self.calcularGemas()>500
	}
}


class LogroAvance inherits Logro{
	var cantidadHorasJugadasAlJuego
	constructor(_juego,_cantidadHorasJugadasAlJuego) = super(_juego) {
		cantidadHorasJugadasAlJuego=_cantidadHorasJugadasAlJuego
	}
	override method calcularGemas(){
		return cantidadHorasJugadasAlJuego*juego.dificultad()
	}
	override method esImportante(){
		return false
	}
}

class LogroSecretoDesbloqueado inherits Logro{
	var cantGemas
	constructor(_juego,_cantGemas)= super(_juego){
		cantGemas=_cantGemas
	}
	override method calcularGemas(){
		return cantGemas
	}
}
class LogroExperienciaAlcanzada inherits Logro{
	var jugador
	constructor(_juego,_jugador)= super(_juego){
		jugador=_jugador
	}
	override method calcularGemas(){
		return juego.dificultad()*jugador.experienciaGamer()
	}
}