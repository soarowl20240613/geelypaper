#import "paper.typ": *
#import "@preview/showybox:2.0.1": showybox

#let cnabstract = [中文摘要]
#let enabstract = [Englsh abstract]
#show: paper.with(
  title: "吉利学院论文模板使用说明",
  faculty: "智能科技学院",
  class: "2021级计算机科学与技术（专升本）3班",
  author: "袁天罡",
  studentnumber: "211124010635",
  adviser: "卓能文",
  date: "二〇二四年五月",
  cnabstract: cnabstract,
  cnkeywords: ("Typst", "模板", "论文结构", "图", "表", "引用", "参考文献"),
  enabstract: enabstract,
  enkeywords: (
    "Typst",
    "Template",
    "Paper Structure",
    "Figure",
    "Table",
    "Reference",
    "Bibliography",
  ),
)

#show raw.where(block: true, lang: "typst-ex"): it => {
  let txt = it.text
  showybox(
    [代码：
      #code(raw(txt, lang: "typc", block: true), lang: "typst")],
    [结果：
      #eval(
        txt,
        mode: "markup",
        scope: (
          cstyle: cstyle,
          cwidth: cwidth,
          easytable: easytable,
          showybox: showybox,
          th: th,
          tr_alt: tr_alt,
        ),
      )],
  )
}

= 绪论

== Typst简介

Typst是一个类似TeX的排版系统，它使用类Markdown语法来描述文档的结构，并直接编译生成最终的PDF文档。Typst 具有以下特点：

- 简单易用：Typst的语法非常简单，学习成本较低。
- 功能强大：Typst支持多种排版元素，如文本、图片、表格等，可以生成各种类型的文档。
- 跨平台：Typst支持在Windows、macOS和Linux平台上运行，可以生成跨平台的文档。

== Typst安装

安装Typst非常简单，只需要下载并安装Typst的安装包即可。在Windows平台上，可以通过下载安装包来安装Typst；在macOS平台上，可以通过Homebrew来安装Typst；在Linux平台上，可以通过apt-get或yum来安装Typst。

= 模板使用

== 下载模板

从https://github.com/soarowl/geelypaper.git上下载最新的模板文件。

== 模板文件结构

模板文件包含以下两个文件：

+ `paper.typ`：模板文件，用于生成最终的PDF文档。
+ `logo.png`：吉利logo。

== 创建Typst文档

创建Typst文档非常简单，只需要在文本编辑器中编写Typst代码即可。Typst的代码以`.typ`为扩展名，可以在文本编辑器中创建一个名为`example.typ`的文件，并编写以下代码：

```typst
#import "paper.typ": *
#let cnabstract = [中文摘要]
#let enabstract = [Englsh abstract]

#show: paper.with(
  title: "吉利学院论文模板使用说明",
  faculty: "智能科技学院",
  class: "2021级计算机科学与技术（专升本）3班",
  author: "袁天罡",
  studentnumber: "211124010635",
  adviser: "卓能文",
  date: "二〇二四年五月",
  cnabstract: cnabstract,
  cnkeywords: ("Typst", "模板", "论文结构", "图", "表", "引用", "参考文献"),
  enabstract: enabstract,
  enkeywords: (
    "Typst",
    "Template",
    "Paper Structure",
    "Figure",
    "Table",
    "Reference",
    "Bibliography",
  ),
)

= 绪论

== Typst简介

Typst是一个类似TeX的排版系统，它使用类Markdown语法来描述文档的结构，并直接编译生成最终的PDF文档。Typst 具有以下特点：

- 简单易用：Typst的语法非常简单，学习成本较低。
- 功能强大：Typst支持多种排版元素，如文本、图片、表格等，可以生成各种类型的文档。
```

== 编译Typst文档

编译Typst文档非常简单，只需要在命令行中输入以下命令即可

```bash
typst compile example.typ
```

编译完成后，会在当前目录下生成一个名为`example.pdf`的文件，这就是最终的PDF文档。

== 修改模板文件

修改模板文件非常简单，只需要在文本编辑器中修改`paper.typ`文件即可。

== 文档结构

```typc
= 一级标题
== 二级标题
=== 三级标题
```

== 插入无序列表

```typst-ex
- 无序列表1
- 无序列表2
- 无序列表3
```

== 插入有序列表

```typst-ex
+ 有序列表1
+ 有序列表2
+ 有序列表3
```

== 插入图片

```typst-ex
#figure(
  image("img/manage.png", width: 80%),
  caption: [管理界面]
)
```

== 插入表格

```typst-ex
#figure(
  caption: [category表],
  kind: table,
  supplement: "表",
  easytable({
    let tr = tr_alt

    cwidth(1fr, 1fr, 1fr)
    cstyle(left, center, right)
    th[Header 1][Header 2][Header 3]
    tr[How][I][want]
    tr[a][drink,][alcoholic]
    tr[of][course,][after]
    tr[the][heavy][lectures]
    tr[involving][quantum][mechanics.]
  }),
)
```

== 插入公式

```typst-ex
勾股定理可用公式：$a^2 + b^2 = c^2$表示。
```

```typst-ex
#figure(
  caption: [数列求和],
  kind: math.equation,
  supplement: "公式",
  $ sum_(k=1)^n k = (n(n+1)) / 2 $
)
```

== 插入代码块

````typst-ex
```c
#include <stdio.h>

int main() {
    char *hello_world = "Hello, World!";
    printf("%s\n", hello_world);
    return 0;
}
```
````

在Typst文档中添加太多代码，导致可读性降低，也不便于后续采用相应的工具进行编辑、更新、管理与维护，建议将代码组织在一个文件夹中。
````typst-ex
#figure(
  caption: [计算斐波纳契],
  raw(read("src/fibonaci.py"), lang: "py3", block: true)
)
````

== 插入引用

在被引用的图表等地方用`<name>`设置标签，在打算引用的地方输入`@name`即可。name后面如果是中文，添加一个空格可避免编译错误。在`i-figured`中，需要在引用的地方添加`fig:、tbl:、lst:`等，形成`@fig:name`形式。如：@fig:register 所示。

#figure(caption: [用户注册], image("img/register.png", width: 50%)) <register>

== 插入参考文献

参考文献设置也比较简单，只需在文件尾部加入`#bibliography("example.yml", style: "gb-7714-2015-numeric")`即可。yml格式如下：
```yaml
audio-descriptions:
  affiliated:
    - names: Taylor, Dallas
      role: narrator
  author: Barrows, Miellyn Fitzwater
  date: 2017-02-07
  issue: 8
  parent:
    author: Taylor, Dallas
    title: Twenty Thousand Hertz
    type: Audio
  title: Audio Descriptions
  type: Audio
  url: https://www.20k.org/episodes/audio
barb:
  author: Günther-Haug, Barbara
  date: 2020
  language: de-DE
  location: München
  publisher: MVG
  title: Den Boden unter den Füßen verlieren
  type: Book
```

在文章适当的地方插入`@audio-descriptions`@audio-descriptions 或`@barb`@barb 这类的键。

== typst进阶

更多内容请参考#link("https://github.com/soarowl/typst.git")[Typst简介]及#link("https://typst.app/docs")[Typst官方文档]

#bibliography("basic.yml", style: "gb-7714-2015-numeric")
