"""A Number Guessing Game"""

import random;
import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide a fun hint if guess is incorrect"""
def give_hint(guess: int, correct_number: int) -> str by llm();

walker GuessGame {
    has guess: int;

    can start with `root entry;
    can process_guess with turn entry;
}

node turn {
    has correct_number: int;
}

impl GuessGame.start {
    next = root ++> turn(random.randint(1, 10));
    visit next;
    self->process_guess(next);
}

impl GuessGame.process_guess {
    if self.guess == here.correct_number {
        print("Congratulations! You guessed correctly.");
        disengage;
    } else {
        print("Wrong guess!");
        hint = give_hint(self.guess, here.correct_number);
        print("Hint: " + hint);
        disengage;
    }
}

with entry: __main__ {
    root -> GuessGame(3);
    root -> GuessGame(4);
    root -> GuessGame(5);
    root -> GuessGame(6);
}