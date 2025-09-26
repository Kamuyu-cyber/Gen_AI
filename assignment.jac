"""Rock Paper Scissors Game"""

import random;

walker RPSGame {
    has choice: str;

    can start with `root entry;
    can play with turn entry;
}

node turn {
    has computer_choice: str = random.choice(["rock", "paper", "scissors"]);
}

# Will run when in CLI mode (not in cloud)
with entry:__main__ {
    root spawn RPSGame("rock");
    root spawn RPSGame("paper");
    root spawn RPSGame("scissors");
}

impl RPSGame.start {
    if not [root --> (`?turn)] {
        next = root ++> turn(random.choice(["rock", "paper", "scissors"]));
    } else {
        next = [root --> (`?turn)];
    }
    visit next;
}

impl RPSGame.play {
    if [-->] {
        visit [-->];
    } else {
        if self.choice == here.computer_choice {
            print("Player chose " + self.choice + ". Computer chose " + here.computer_choice + ". It's a TIE!");
        } elif (self.choice == "rock" and here.computer_choice == "scissors") or
             (self.choice == "paper" and here.computer_choice == "rock") or
             (self.choice == "scissors" and here.computer_choice == "paper") {
            print("Player chose " + self.choice + ". Computer chose " + here.computer_choice + ". You WIN!");
        } else {
            print("Player chose " + self.choice + ". Computer chose " + here.computer_choice + ". You LOSE!");
        }
        disengage;
    }
}
