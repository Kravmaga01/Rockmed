//Todo:Cards para solicitud de evento
import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';

//* ESTUCTURA
class SolicitudCard extends StatelessWidget {
  const SolicitudCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //* Este padig permitira que las cards tenga separación simetrica.
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        //* Controlador de separación de las cards
        margin: const EdgeInsets.only(top: 60, bottom: 60),
        width: double.infinity, // solicitamos que ocuper todo el espacio
        height: 400, // el tamaño sera de 400
        decoration: _cardsBorders(), //! Premite que la decoración sea un crad
        child: Stack(
          //* pila
          alignment:
              Alignment.bottomLeft, // alineación de la pila a la izquierda
          children: [
            _BackGroundImage(), // la imagen de fondo
            _EventDetails(), //Detalles del evento.
            Positioned(top: 0, right: 0, child: _PriceTeg()),
            Positioned(
                top: 0,
                left: 0,
                child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'EvetForm'),
                    child: _NotAvalieble()))
          ],
        ),
      ),
    );
  }
}

//Todo: builds

//* _NotAvalieble

class _NotAvalieble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Editar Evento',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

//*priceteg
class _PriceTeg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$1003.999',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

//* BoxDecoration
BoxDecoration _cardsBorders() => BoxDecoration(
        color: AppTheme.second,
        borderRadius: BorderRadius.circular(25), // border circular
        boxShadow: const [
          //* Crea el efecto sombra
          BoxShadow(
              color: AppTheme.fourth, // color del gobal tema
              blurRadius: 10, // da efecto de radio
              offset: Offset(0, 6) // efecto de sombra,
              )
        ]);

//* _EvenDetails
class _EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //* separaciín de contanido
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: _buildDecoration(),
        width: double.infinity,
        height: 70,
        child: Column(
          // linia el contenido en columna
          crossAxisAlignment:
              CrossAxisAlignment.start, //* a linia los elemoentos al inicio
          children: const [
            //! aqui van los valores
            // titulo
            Text(
              'Discoduro G',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, //* permite que no se desborde
            ),
            //descripción
            Text(
              'Aquií debe ir la descripción del evento',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  //* BuilDecoration
  BoxDecoration _buildDecoration() => const BoxDecoration(
      color: AppTheme.primary,
      borderRadius: BorderRadius.only(
          // boder redondeados
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(25)));
}

//! Imagen de fondo por defecto para una card vacia
class _BackGroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25), // borde redondeado
      child: Container(
        width: double.infinity,
        height: 400,
        child: const FadeInImage(
            placeholder: AssetImage(
                'assets/placeholder-title.gif'), // placeholder mientras carga la imagen
            image: NetworkImage(
                'https://via.placeholder.com/400x300/f6f6f6'), // imagen por defecto si a card esata vacia
            fit: BoxFit.cover), // permite que abarque todo el espacio
      ),
    );
  }
}
