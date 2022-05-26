# Spooky Ghost Game
import std/random
from std/strutils import parseInt
randomize()
    
echo "[!] Welcome to the Ghost Game!"
echo "[!] You are in a hunted house, there's three doors... which one do you choose?"

type
  Player = object
    points: int
    strike: int

var player : ref Player = new(Player)

player.points = 0
player.strike = 0

proc openDoor(num: int) : auto =
  let roll = rand(1..3)
  if roll == num:
    player.points += 1
    echo "[+] Woo! No ghost! You go to the next level! >:D"
  else:
    player.strike += 1
    echo "[-] Hello my name is Ghost Johnson!"
    echo "[-] You found Ghost Johnson! You got a strike!"


while true:
  if player.strike >= 3:
    echo "[-] You died?!"
    break
  echo "Current points: [", player.points ,"] pts"
  echo "[>] 1, 2 or 3"
  var choice = readLine(stdin)
  openDoor(parseInt(choice))
  
