#import "@preview/easytable:0.1.0": easytable, elem
#import elem: *
#import "@preview/i-figured:0.2.4"
#import "@preview/sourcerer:0.2.1": code

//************ 表格设置
#let tr_alt = tr.with(cell_style: (x: none, y: none) => (
  fill: if calc.even(y) {
    luma(95%)
  } else {
    none
  },
))
//************

#let paper(
  title: "",
  faculty: "",
  class: "",
  author: "",
  studentnumber: "",
  adviser: "",
  date: datetime.today().display(),
  cnabstract: [],
  cnkeywords: (),
  enabstract: [],
  enkeywords: (),
  body,
) = {
  // 设置纸张大小
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2cm, inside: 2.5cm, outside: 2cm),
  )

  // 设置标题
  set document(
    title: title,
    author: author,
    keywords: cnkeywords.join("，") + enkeywords.join("; "),
  )

  // 设置正文
  set text(12pt, font: ("Times New Roman", "SimSun"), lang: "zh", region: "cn")

  set document(
    title: title,
    author: author,
    keywords: cnkeywords.join("，") + enkeywords.join("; "),
  )
  set text(12pt, font: ("Times New Roman", "SimSun"), lang: "zh", region: "cn")

  show heading.where(level: 1): it => {
    align(center)[#text(font: ("Times New Roman", "SimHei"))[#it]]
  }

  //************ 图形、代码及表格列表设置
  // this `level: 2` instructs the figure counters to be reset for every
  // level 2 section, so at every level 1 and level 2 heading.
  show heading: i-figured.reset-counters.with(level: 1)

  // this `level: 2` instructs the figure numbering to include the first
  // two levels of the current heading numbering.
  // how this should behave with zeros can be set using `zero-fill`.
  // e.g., setting `zero-fill: false` and `leading-zero: false` assures
  // there is never a `0` in the numbering.
  show figure: i-figured.show-figure.with(level: 1, numbering: "1-1")
  show math.equation: i-figured.show-equation

  set figure.caption(position: top, separator: [#h(1em)])
  show figure.where(kind: image): set figure.caption(position: bottom)
  //************

  //************ 代码框设置
  show raw.where(block: true): it => {
    code(it)
  }
  //************

  //************ 标题页设置
  v(5fr)
  align(center, image("logo.png", width: 50%))
  v(10pt)
  set align(center)
  text(40pt, "本科毕业设计")

  v(10fr, weak: true)
  let hline() = [#v(-0.7em)#line(length: 20em)]
  text(
    14pt,
    table(
      columns: (20%, auto),
      stroke: none,
      [题#h(2em)目：], [#title#hline()],
      [学#h(2em)院：], [#faculty#hline()],
      [年级专业：], [#class#hline()],
      [学生姓名：], [#author#hline()],
      [学#h(2em)号：], [#studentnumber#hline()],
      [指导教师：], [#adviser#hline()],
    ),
  )

  v(10fr, weak: true)
  text(14pt, date)

  set align(left)
  pagebreak()
  //************

  // typst目前在标题、图、表、无序列表和有序列表之后不能正确缩进，添加以下代码：
  //************ 设置缩进
  let fake-par = style(styles => {
    let b = par[#box()]
    let t = measure(b + b, styles)
    b
    v(-t.height)
  })
  show enum: it => {
    it
    fake-par
  }
  show figure: it => {
    it
    fake-par
  }
  show heading: it => {
    it
    fake-par
  }
  show image: it => {
    it
    fake-par
  }
  show list: it => {
    it
    fake-par
  }
  show table: it => {
    it
    fake-par
  }
  //************

  set par(first-line-indent: 2em, justify: true)
  show par: set block(spacing: 0.65em)

  //************ 版权页
  pagebreak(to: "odd", weak: true)
  counter(page).update(1)
  align(center, text(16pt, font: "SimHei", [学术诚信声明]))
  [本人郑重声明：所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。]
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    stroke: none,
    [], [], [#align(right, [作者签名：])], [#v(1em)#line(length: 100%)],
  )

  v(2em)
  align(center, text(16pt, font: "SimHei", [版权使用授权书]))
  [本人在导师指导下所完成的毕业论文（设计）及相关的资料（包括图纸、试验记录、原始数据、实物照片、图片、录音带、设计手稿等），知识产权归属吉利学院。本人完全了解吉利学院有关保存、使用毕业论文（设计）的规定。本人授权吉利学院可以将本毕业论文（设计）的全部或部分内容编入有关数据库进行检索，可以采用任何复制手段保存和汇编本毕业论文（设计）。如果发表相关成果，一定征得指导教师同意，且第一署名单位为吉利学院。本人离校后使用毕业论文（设计）或与该论文直接相关的学术论文或成果时，第一署名单位仍为吉利学院。]
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    stroke: none,
    [#align(right, [作者签名：])], [#v(1em)#line(length: 100%)], [#align(
        right,
        [指导教师签名：],
      )], [#v(1em)#line(length: 100%)],

  )

  pagebreak()
  //************

  //************ 页眉、页脚
  set page(
    header: [#h(1fr)吉利学院本科毕业设计#h(1fr)#line(length: 100%, stroke: 2pt)],
    number-align: center,
  )
  //************

  set heading(numbering: none)
  set page(numbering: "I")
  counter(page).update(1)

  //************ 中文摘要
  pagebreak(to: "odd", weak: true)
  heading([摘#h(2em)要])
  cnabstract
  v(1em)
  let cn = cnkeywords.join("；")
  par(first-line-indent: 0em)[
    #text(font: "SimHei", [关键词：])
    #cn
  ]
  pagebreak()
  //************

  //************ 英文摘要
  heading([ABSTRACT])
  enabstract
  v(1em)
  let en = enkeywords.join("; ")
  par(first-line-indent: 0em)[
    #text([*Keywords:* ])
    #en
  ]
  pagebreak()
  //************

  //************ 目录
  pagebreak(to: "odd", weak: true)
  set par(first-line-indent: 0em, justify: true)
  outline(title: [目#h(2em)录], indent: true, depth: 3)
  i-figured.outline(title: [图形列表])
  i-figured.outline(target-kind: table, title: [表格列表])
  i-figured.outline(target-kind: raw, title: [代码列表])
  // master 版本不能编译
  i-figured.outline(target-kind: math.equation, title: [公式列表])
  pagebreak()
  //************

  //************ 正文
  set page(numbering: "1")
  counter(page).update(1)
  // 设置章节标题
  set heading(numbering: (..nums) => {
    let vals = nums.pos()
    if vals.len() == 1 {
      let value = str(vals.at(0))
      return "第" + value + "章"
    } else {
      return nums.pos().map(str).join(".")
    }
  })
  // 设置章节标题分页并位于奇数页、居中、黑体
  show heading: set text(font: ("Times New Roman", "SimHei"))
  show heading.where(level: 1): it => {
    pagebreak(to: "odd", weak: true)
    align(center)[#it]
  }
  // 首行缩进
  set par(first-line-indent: 2em, justify: true)

  body
  //************
}
