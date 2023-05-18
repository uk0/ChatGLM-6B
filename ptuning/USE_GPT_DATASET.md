

#### cover




```python


output = []

for item in data:
    conversations = item["conversations"]
    content = ""
    summary = ""
    for conv in conversations:
        if conv["from"] == "human":
            content = conv["value"]
        elif conv["from"] == "gpt":
            summary = conv["value"]
    output.append({"content": content, "summary": summary})

# 打印输出结果
for item in output:
    print(item)


```

```bash




#sg_90k_part1_html_cleaned.json

[
    {
        "id": "Og9h3C1",
        "conversations": [
            {
                "from": "human",
                "value": "safaff"
            },
            {
                "from": "gpt",
                "value": "xxxx"
            },
        ]
    }
]
我有这样的数据结构 我希望将上面的数据结构转换成
content 是 conversations中 from = humant 的value
summary  是 conversations中 from = gpt 的value
我想生成下面的数据每一个 都是一行 
{"content": "你好，你是谁", "summary": "你好，我是树先生的助手小6。"}

```