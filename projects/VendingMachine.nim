type Drink = tuple[drinkName: string, liters: int, price: int]


type
  VendingMachine = object
    name: string
    drinks: seq[Drink]
    money: int


var pareton : ref VendingMachine = new(VendingMachine)

pareton.name = "Pareton"
pareton.drinks = @[("Aquarius", 2, 1)]
pareton.money = 0
  
proc buyDrink*(machine: var ref VendingMachine, drink: string) =
   var found: bool = false
   var tries: int = 0
    
   while(found == false and tries <= 3):
     if(tries == 3):
        echo drink," not found in the machine. Sorry!"
        break
     for drinks in machine.drinks:
       tries += 1
       
       if drinks.drinkName == drink:
         found = true
         machine.money = machine.money + drinks.price
         echo "Bought ", drink, " machine now has $", machine.money 
         break

        
buyDrink(pareton, "Aquarius")
buyDrink(pareton, "CocaCola")


      
  
    