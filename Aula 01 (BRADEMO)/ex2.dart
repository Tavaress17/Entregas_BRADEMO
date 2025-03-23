/*
Escreva um programa em Dart para criar uma classe House com as
propriedades [id, nome, preço]. Crie um construtor para ela e crie 3 objetos.
Adicione-os a uma lista e imprima todos os detalhes.
*/
void main() {
    var houses = <House>[];
    houses.add(House(0, "Uberaba, Bragança Paulista - SP", "260.000,00"));
    houses.add(House(1, "Jardim das Acácias, Campinas - SP", "450.000,00"));
    houses.add(House(2, "Vila São José, São Paulo - SP", "350.000,00"));

    for(var house in houses) {
        print(house.toString());
    }
}

class House {
    int id;
    String name; // Coloquei nome, mas refere-se ao endereço da casa.
    String price;

    House(this.id, this.name, this.price);

    @override
    String toString() {
        return "ID: ${this.id} \nADDRESS: ${this.name} \nPRICE: R\$${this.price}\n";
    }
}