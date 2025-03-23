/*
Escreva um programa em Dart para criar uma classe Animal com as
propriedades [id, nome, cor]. Crie outra classe chamada Cat e a estenda de Animal. 
Adicione uma nova propriedade chamada som (do tipo String). 
Crie um objeto de Cat e imprima todos os detalhes.
*/
void main() {
  Cat gato = Cat(0, "Frajola", "Preto e Branco");

  print(gato.toString());
}

class Animal {
  int id;
  String name;
  String color;

  Animal(this.id, this.name, this.color);
}

class Cat extends Animal {
  String sound = "Meeeooowww!";

  Cat(id, name, color) : super(id, name, color);

  @override
  String toString() {
    return "ID: ${this.id} \nCAT NAME: ${this.name} \nFUR COLOR: R\$${this.color} \nSOUND: ${this.sound}";
  }
}