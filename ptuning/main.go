package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
)

type Conversation struct {
	From  string `json:"from"`
	Value string `json:"value"`
}

type Data struct {
	Id            string         `json:"id"`
	Conversations []Conversation `json:"conversations"`
}

type Output struct {
	Content string `json:"content"`
	Summary string `json:"summary"`
}

func main() {
	// 从文件中读取数据
	file, _ := ioutil.ReadFile("input.json")

	var data []Data
	_ = json.Unmarshal([]byte(file), &data)

	var output []Output

	for _, item := range data {
		var content, summary string
		for _, conv := range item.Conversations {
			if conv.From == "human" {
				content = conv.Value
			} else if conv.From == "gpt" {
				summary = conv.Value
			}
		}
		output = append(output, Output{Content: content, Summary: summary})
	}

	// 将输出写入到文件中，每行一个对象
	f, _ := os.Create("dev.json")
	defer f.Close()
	f1, _ := os.Create("train.json")
	defer f1.Close()

	for i, o := range output {
		b, _ := json.Marshal(o)
		if i < 1000 {
			f.WriteString(string(b) + "\n")
		}

		if i > 1000 {
			f1.WriteString(string(b) + "\n")
		}
	}

	fmt.Println("Done")
}
