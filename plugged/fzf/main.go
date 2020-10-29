package main

import (
	"github.com/junegunn/fzf/src"
	"github.com/junegunn/fzf/src/protector"
)

<<<<<<< HEAD
var revision string
=======
var version string = "0.24"
var revision string = "devel"
>>>>>>> fzf tagbar

func main() {
	protector.Protect()
	fzf.Run(fzf.ParseOptions(), revision)
}
