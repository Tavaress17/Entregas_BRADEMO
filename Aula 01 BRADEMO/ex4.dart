/*
Escreva um programa em Dart para criar uma classe Camera com
propriedades privadas [id, marca, cor, preço]. Crie métodos getter e setter
para acessar e modificar os valores. Além disso, crie 3 objetos dela e imprima todos os detalhes.
*/
void main() {
  var camera1 = Camera(0, "Canon", "Preto", "");
  var camera2 = Camera(1, "Instax", "Verde", "");
  var camera3 = Camera(2, "Polaroid", "Branco", "");

  camera1.setPrice("3.299,00");
  camera2.setPrice("999,00");
  camera3.setPrice("1.779,00");

  print(camera1.toString() + camera2.toString() + camera3.toString());
}

class Camera {
  int _id;
  String _brand;
  String _color;
  String _price;

  Camera(this._id, this._brand, this._color, this._price);

  int getId() {
    return this._id;
  }

  void setId(int id) {
    this._id = id;
  }

  String getBrand() {
    return _brand;
  }

  void setBrand(String brand) {
    this._brand = brand;
  }

  String getColor() {
    return _color;
  }

  void setColor(String color) {
    this._color = color;
  }

  String getPrice() {
    return _price;
  }

  void setPrice(String price) {
    this._price = price;
  }

  @override
  String toString() {
    return "ID: ${this.getId()} \nBRAND: ${this.getBrand()} \nCOLOR: ${this.getColor()} \nPRICE: R\$ ${this.getPrice()}\n\n";
  }
}
