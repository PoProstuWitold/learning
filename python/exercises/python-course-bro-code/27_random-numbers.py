import random

low = 1
high = 100
options = ("Rock", "Paper", "Scissors")
cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

number = random.random()
number = random.randint(low, high)
choice = random.choice(options)
random.shuffle(cards)

print(cards)