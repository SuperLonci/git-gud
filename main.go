package main

import (
	"fmt"
	"math/rand"
	"time"
)

const (
	reset  = "\033[0m"
	green  = "\033[32m"
	cyan   = "\033[36m"
	yellow = "\033[33m"
	bold   = "\033[1m"
)

func main() {
	rand.Seed(time.Now().UnixNano())

	// Rotating crab army
	crabs := []string{
		`
           __     _
         /  \~~~/  \
   ,----(     . .    )
  /      \__     __/
 /|         (__)  |
^ \   /____\__/   /      Git elephant is here to remind you that
   |__|    |__|--"       your Git skills are as solid as a wet noodle.
`,
		`
    \\      \\     
     \\\__  (o)>
     \'-.___/ )
     '._/_.'-'
    Git chicken is judging you.
`,
		`
        _      _
     __(.)< __(.)> 
     \___)  \___)  

    Git duckies clone your shame.
`,
		`
        _      _
     __(.)< __(.)> 
     \___)  \___)  

    Git duckies are here to quack about your poor Git habits.
`,
		`
        .--.
      .'_\/_'.
       =_||_=
       = || =
       __||__     Git crab sees your merge conflict.
      /  \/  \\
`,
		`
     _____     ____
    /     \~~~/    \\
   (  o   o    o   o )
   \__   ___|___   _/
     |__|   |_| |__|   Git crab can’t fix your mistakes, only highlight them.
`,
	}

	// Closing remarks of doom
	closers := []string{
		"git gud or git rekt.",
		"Now stop asking for help and GIT GUD.",
		"You break it, you fix it. That’s the Git way.",
		"This isn't Stack Overflow. Figure it out.",
		"If you force push to main, I hope you step on a Lego.",
		"Congrats, you're only 87 more mistakes away from mastery.",
		"Real devs don’t use --force. Except when they do.",
		"You've used more help than code. Impressive.",
		"Remember: rebase is like a gun. Powerful, dangerous, and you'll probably shoot yourself.",
	}

	fmt.Println(bold + "Welcome to git gud — because you clearly need it." + reset)
	fmt.Println(crabs[rand.Intn(len(crabs))])

	// Git command snark-help
	fmt.Println("\n" + bold + "Common Git commands to save your life:"+ reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git status", reset, cyan+"→ See what hell you've unleashed."+reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git add .", reset, cyan+"→ Stage everything. Like a lunatic."+reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git commit -m \"msg\"", reset, cyan+"→ Make it official. With regret."+reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git push", reset, cyan+"→ Yeet your changes to the origin."+reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git pull", reset, cyan+"→ Bring in 'surprises' from your teammates."+reset)

	fmt.Println("\n" + bold + "Branching and Merging:" + reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git checkout -b <branch>", reset, cyan+"→ Flee the main branch."+reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git merge main", reset, cyan+"→ Combine things and pray for no conflicts."+reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git rebase main", reset, cyan+"→ Rewrite history. Like a professional liar."+reset)

	fmt.Println("\n" + bold + "Damage Control:" + reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git stash", reset, cyan+"→ Hide your sins. Temporarily."+reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git restore <file>", reset, cyan+"→ Undo dumb stuff. Again."+reset)
	fmt.Printf("%s%-24s%s %s\n", green, "git reset --hard", reset, cyan+"→ Erase everything. No regrets."+reset)

	// Final kick in the terminal
	fmt.Println("\n" + yellow + closers[rand.Intn(len(closers))] + reset)
}
