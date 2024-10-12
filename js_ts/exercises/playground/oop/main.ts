abstract class Animal {
	abstract makeSound(): void // czysto wirtualna
	move(): void { // wirtualna
		console.log('Move')
	}
}

class Dog extends Animal {
	makeSound() {
		console.log('Bark')
	}
	override move() {
		console.log('Run')
	}
}

function main() {
	const dog = new Dog()
	dog.makeSound()
	dog.move()
}

main()