import Logro.*
class Juego{
	var nivelDificultad
	var nivelDeSangrePorHora
	var precio
	var genero
	constructor(_nivelDificultad,_nivelSangre,_precio,_genero){
		nivelDificultad=_nivelDificultad
		nivelDeSangrePorHora=_nivelSangre
		precio=_precio
		genero=_genero
	}
	method nivelDificultad(){
		return nivelDificultad
	}
	method nivelDeSangrePorHora(){
		return nivelDeSangrePorHora
	}
	method precio(){
		return precio
	}
	method esRosita(){
		return nivelDeSangrePorHora<1 && nivelDificultad<=2
	}
	method cambiarGenero(_genero){
		genero=_genero
	}
	method otorgarLogro(jugador,cantHoras){
		if(jugador.experienciaGamer()%100==0){
			jugador.agregarLogro(new LogroExperienciaAlcanzada(self,jugador))
		}
		genero.otorgarLogro(self,jugador)
	}
	method instalarExpansion(){
		nivelDificultad+=1
		genero.actualizarlo(self)
	}
}


object juegoAventura{
	method otorgarLogro(juego,jugador,cantHoras){
		jugador.agregarLogro(new LogroSecretoDesbloqueado(juego,1/jugador.experienciaGamer()))
	}
	method actualizarlo(juego){
		juego.cambiarGenero(juegoDePelea)
	}
}
object juegoDePelea{
	method otorgarLogro(juego,jugador,cantHoras){
		jugador.agregarLogro(new LogroAvance(juego,cantHoras))
		if(juego.nivelDeSangrePorHora()>10){
			jugador.agregarLogro(new LogroExperienciaAlcanzada(juego,jugador.horasJugadasEnTotal()/10))
		}
	}
	method actualizarlo(juego){}
} 
object juegoDeLogica{
	method otorgarLogro(juego,jugador,cantHoras){
		if(cantHoras*juego.dificultad()>17){
			jugador.agregarLogro(new LogroExperienciaAlcanzada(juego,jugador.cantidadGemas()*2+jugador.cantidadLogrosObtenidos()))
		}
	}
	method actualizarlo(juego){}
}
object fps{
	method otorgarLogro(juego,jugador,cantHoras){}
	method actualizarlo(juego){}
}






