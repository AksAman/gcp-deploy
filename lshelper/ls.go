package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
)

var inputDir = flag.String("dir", "/", "input directory")

func visit(p string, info os.FileInfo, err error) error {
	if err != nil {
		return err
	}
	ignore := []string{".git", ".idea", "node_modules", "vendor", "etc", "proc", "lib"}
	for _, i := range ignore {
		// ignore if p contains i
		if strings.Contains(p, i) {
			return nil
		}
	}
	if info.IsDir() {
		return nil
	}
	fmt.Println(" ", p, info.IsDir())
	return nil
}

func main() {

	flag.Parse()

	currentDir, _ := os.Getwd()
	fmt.Printf("currentDir: %v\n", currentDir)
	// list input directory
	err := filepath.Walk(*inputDir, visit)
	if err != nil {
		log.Println(err.Error())
	}
	fmt.Printf("inputDir: %v\n", *inputDir)
}
