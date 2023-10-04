from typing import Literal
from random import choice

Hand = Literal["R", "P", "S", ""]


def player(prev_play: Hand, opponent_history: list[Hand] = []) -> Hand:
    return ""


def oneMemoryPlayer(prev_play: Hand, opponent_history: list[Hand] = []) -> Hand:
    
    opponent_history.append(prev_play)
    guess = opponent_history[-1]
    return oppose(guess)


def oppose(hand: Hand) -> Hand:
    if hand == "P":
        return "S"
    elif hand == "R":
        return "P"
    elif hand == "S":
        return "R"
    return choice(["R", "P", "S"])
