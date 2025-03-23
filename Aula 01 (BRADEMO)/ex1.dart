/* 
Escreva um programa em Dart para criar uma classe Laptop 
com as propriedades [id, nome, ram] e crie 3 objetos dela, imprimindo todos os detalhes.
*/
void main() {
	var laptop1 = Laptop(0, "IdeaPad", 16);
	var laptop2 = Laptop(1, "MacBook Air M2", 8);
	var laptop3 = Laptop(2, "Galaxy Book 4", 16);

	print(laptop1.toString() + laptop2.toString() + laptop3.toString());
}

class Laptop {
	int id;
	String name;
	int ram;

	Laptop(this.id, this.name, this.ram);

    @override
    String toString() {
        return "ID: ${this.id} \nNAME: ${this.name} \nRAM: ${this.ram}\n\n";
    }
}