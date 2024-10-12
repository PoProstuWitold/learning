abstract class Animal {
	private _name: string
	private _age: number

	constructor(name: string, age: number) {
		this._name = name
		this._age = age
	}

	abstract makeSound(): void // czysto wirtualna
	abstract move(): void // czysto wirtualna
	info(): void { // wirutalna
		console.log(`name: ${this._name}, age: ${this._age}, instance: ${this.constructor.name}`)
	}

	get name(): string {
		console.log('Getting name...')
		return this._name
	}

	set name(name: string) {
		console.log('Setting name...')
		this._name = name
	}

	get age(): number {
		console.log('Getting age...')
		return this._age
	}

	set age(age: number) {
		console.log('Setting age...')
		this._age = age
	}
}

class Dog extends Animal {
	private _breed: string

    constructor(name: string, age: number, breed?: string) {
        super(name, age)
        this._breed = breed ?? 'unknown'
    }

	public makeSound() {
		console.log('Bark')
	}

	public move() {
		console.log('Run')
	}

	override info(): void {
		super.info()
		console.log(`breed: ${this._breed}`)
	}

	get breed(): string {
		console.log('Getting breed...')
		return this._breed
	}

	set breed(breed: string) {
		console.log('Setting breed...')
		this._breed = breed
	}
}

function main() {
	const dog = new Dog('Sara', 3)
	dog.makeSound()
	dog.move()
	dog.info()

	// gettery i settery
	dog.name = 'Sarsenka'
	console.log(dog.name)
	dog.age = 4
	console.log(dog.age)
	dog.breed = 'half-pekingese'
	console.log(dog.breed)
	
	dog.info()
}

main()